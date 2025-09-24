# 学生选课管理系统

基于SpringBoot+MyBatis开发的学生选课管理系统，支持学生选课、教师管理、管理员审核等功能。

## 技术栈
- 后端：SpringBoot, MyBatis, MySQL
- 前端：HTML, CSS, JavaScript
- 工具：Maven, Git

## 功能模块
- 学生端：课程浏览、选课操作、选课结果查询
- 教师端：课程信息管理、选课学生统计
- 管理员端：系统初始化、课程审核、用户管理

## 项目结构
src/
├── main/
│   ├── java/          # 后端Java代码
│   └── resources/     # 配置文件
└── webapp/           # 前端页面文件
## 快速开始
1. 导入MySQL数据库脚本
2. 配置application.properties中的数据库连接
3. 运行SpringBoot主程序
4. 访问http://localhost:8080

## 注意事项
- 需要配置MySQL数据库
- 默认端口8080
