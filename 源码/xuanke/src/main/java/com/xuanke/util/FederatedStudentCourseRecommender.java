package com.xuanke.util;

import java.util.*;

public class FederatedStudentCourseRecommender {
// 课程分数数据，键为学生ID，值为课程到分数的映射
public Map<String, Map<String, Double>> studentScores = new HashMap<>();
// 课程权重，键为课程名，值为权重
private Map<String, Double> courseWeights = new HashMap<>();
// 学习率
private double learningRate;

public FederatedStudentCourseRecommender(double learningRate) {
    this.learningRate = learningRate;
}

// 添加学生分数
public void addStudentScore(String studentId, String course, double score) {
    studentScores.putIfAbsent(studentId, new HashMap<>());
    studentScores.get(studentId).put(course, score);
}

// 学生本地更新模型权重（FedSGD）
public Map<String, Double> updateLocalWeights(String studentId) {
    Map<String, Double> localWeights = new HashMap<>(courseWeights);
    Map<String, Double> scores = studentScores.get(studentId);
    if (scores != null) {
        for (String course : scores.keySet()) {
            double gradient = scores.get(course); // 梯度等于分数
            localWeights.put(course, localWeights.get(course) - learningRate * gradient);
        }
    }
    return localWeights;
}

// 服务器聚合更新
public void aggregateUpdates(Map<String, Map<String, Double>> updates) {
    for (Map<String, Double> update : updates.values()) {
        for (String course : update.keySet()) {
            courseWeights.put(course, courseWeights.getOrDefault(course, 0.0) + update.get(course));
        }
    }
}

// 推荐课程
public String recommendCourse(String studentId) {
    Map<String, Double> scores = studentScores.get(studentId);
    if (scores == null || scores.isEmpty()) {
        return getRandomCourse();
    }

    Map<String, Double> weightedScores = new HashMap<>();
    for (String course : courseWeights.keySet()) {
        double weightedScore = 0.0;
        if (scores.containsKey(course)) {
            weightedScore = scores.get(course) * courseWeights.get(course);
        }
        weightedScores.put(course, weightedScore);
    }

    return getCourseWithMaxWeightedScore(weightedScores);
}

// 获取权重最高的课程
private String getCourseWithMaxWeightedScore(Map<String, Double> weightedScores) {
    double maxScore = Double.NEGATIVE_INFINITY;
    String recommendedCourse = null;
    for (Map.Entry<String, Double> entry : weightedScores.entrySet()) {
        if (entry.getValue() > maxScore) {
            maxScore = entry.getValue();
            recommendedCourse = entry.getKey();
        }
    }
    return recommendedCourse;
}

// 获取随机课程
private String getRandomCourse() {
    List<String> courses = new ArrayList<>(courseWeights.keySet());
    Collections.shuffle(courses);
    return courses.isEmpty() ? null : courses.get(0);
}

	// 主函数，用于演示
	public static void main(String[] args) {
	    FederatedStudentCourseRecommender recommender = new FederatedStudentCourseRecommender(0.1);
	    // 添加学生分数
	    recommender.addStudentScore("student1", "Math", 85.0);
	    recommender.addStudentScore("student1", "Physics", 90.0);
	    recommender.addStudentScore("student2", "Math", 70.0);
	    recommender.addStudentScore("student2", "Chemistry", 80.0);
	    recommender.addStudentScore("student3", "Chemistry", 80.0);
	    recommender.aggregateUpdates(recommender.studentScores);
	    recommender.updateLocalWeights("student2");
	    System.out.println(recommender.recommendCourse("student2"));
	}
}