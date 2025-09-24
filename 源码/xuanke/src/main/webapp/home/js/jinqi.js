

var myChartj = echarts.init(document.getElementById('amiddboxtbott2'));

$.get("http://localhost:8080/xuanke/admin/home/getgoodsfenxi",{
},function(data){
var num = 0;
for (var ent1 in data.data.numlist) {
	num+=data.data.numlist[ent1];
}

var qiandaonum = 0;
for (var ent2 in data.data.qiandaonumlist) {
	qiandaonum+=data.data.qiandaonumlist[ent2];
}

var qingjianum = 0;
for (var ent3 in data.data.qingjianumlist) {
	qingjianum+=data.data.qingjianumlist[ent3];
}

var weinum = 0;
for (var ent4 in data.data.weinumlist) {
	weinum+=data.data.weinumlist[ent4];
}
console.log(num);
console.log(qiandaonum);
console.log(qingjianum);
console.log(weinum);
option = {
    backgroundColor: 'rgba(1,202,217,.2)',
    grid: {
        left: 60,
        right: 50,
        top: 100,
        bottom: 25
    },
    title: [{
        top: 70,
        left: 150,
        textStyle: {
            fontSize: 14,
            color: 'rgba(255,255,255,.9)'
        },
        text: '近期打卡统计'
    }],
    legend: [{
        top: 10,
        left: 20,
        textStyle: {
            fontSize: 10,
            color: 'rgba(255,255,255,.7)'
        },
        data: ['实到人数','请假人数']
    },
    {
        top: 30,
        left: 20,
        textStyle: {
            fontSize: 10,
            color: 'rgba(255,255,255,.7)'
        },
        data: ['夜不归宿']
    }],
    xAxis: [{
        name: '打卡',
        type: 'category',
        axisLine: {
            lineStyle: {
                color: 'rgba(255,255,255,.2)'
            }
        },
        splitLine: {
            lineStyle: {
                color: 'rgba(255,255,255,.1)'
            }
        },
        axisLabel: {
            color: "rgba(255,255,255,.7)"
        },

        data: data.data.titlelist,
        axisPointer: {
            type: 'shadow'
        }
    }],
    yAxis: [{
        type: 'log',
        name: '人数',
        axisLine: {
            lineStyle: {
                color: 'rgba(255,255,255,.3)'
            }
        },
        splitLine: {
            lineStyle: {
                color: 'rgba(255,255,255,.01)'
            }
        },
    }],
    series: [{
            name: '人数占比',
            type: 'pie',
            radius: ['20%', '30%'],
            center: ['80%', '20%'],
            avoidLabelOverlap: true,
            minAngle: 30,
            label: {
                // show: false,
                position: 'inner',
                formatter: '{b} {d}%'
            },
            emphasis: {
                label: {
                    show: true,
                    fontSize: '30',
                    fontWeight: 'bold'
                }
            },
            labelLine: {
                show: false
            },
            data: [
                { value: qiandaonum, name: '实到人数', itemStyle: { color: '#bcd3bb', opacity: 0.8, shadowBlur: 10, shadowOffsetX: 0, shadowOffsetY: 0, shadowColor: 'rgba(0, 0, 0, 0.5)', } },
                { value: qingjianum, name: '请假人数', itemStyle: { color: '#e1e8c8', opacity: 0.8, shadowBlur: 10, shadowOffsetX: 0, shadowOffsetY: 0, shadowColor: 'rgba(0, 0, 0, 0.5)', } },
                { value: weinum, name: '夜不归宿', itemStyle: { color: '#e88f70', opacity: 0.8, shadowBlur: 10, shadowOffsetX: 0, shadowOffsetY: 0, shadowColor: 'rgba(0, 0, 0, 0.5)', } },
           ]
        }, {
            name: '实到人数',
            type: 'line',
            data: data.data.qiandaonumlist,
            smooth: true,
            itemStyle: {
                color: '#e88f70',
                opacity: 0.8,
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowOffsetY: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)',
            }
        }, {
            name: '请假人数',
            type: 'line',
            data: data.data.qingjianumlist,
            smooth: true,
            itemStyle: {
                color: '#edc1a5',
                opacity: 0.8,
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowOffsetY: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)',
            }
        }, {
            name: '夜不归宿',
            type: 'line',
            data: data.data.weinumlist,
            smooth: true,
            itemStyle: {
                color: '#9dc5c8',
                opacity: 0.8,
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowOffsetY: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)',
            }
        
        }
    ]
};
myChartj.setOption(option);
})