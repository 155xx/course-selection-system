
var myChartb = echarts.init(document.getElementById('amiddboxtbott1'));

$.get("http://localhost:8080/xuanke/admin/home/getbanji",{
},function(res){
console.log(res);
var sqds_category = [];
var data = [];
for (let d of res.data) {
	sqds_category.push(d.name);
	data.push([d.qiandaonum,d.qingjianum , 1000000, d.name, '2020年6月']);
}


option = {
    backgroundColor: 'rgba(1,202,217,.2)',
    grid: {
        left: 40,
        right: 50,
        top: 30,
        bottom: 25,
    },
    xAxis: {
        name: '打卡\n人数',
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
        }
    },
    yAxis: {
        name: '请假人数',
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
        scale: true
    },
    visualMap: [
        {
            show: false,
            dimension: 3,
            categories: sqds_category,
            calculable: true,
            precision: 0,
            textGap: 30,
            textStyle: {
                color: '#ccc'
            },
            inRange: {
                // color: ['#121122', 'rgba(3,4,5,0.4)', 'red'],
                color: (function () {
                    var colors = ['#bcd3bb', '#e88f70', '#edc1a5', '#9dc5c8', '#e1e8c8', '#7b7c68', '#e5b5b5', '#f0b489', '#928ea8', '#bda29a'];
                    return colors.concat(colors);
                })()
            }
        }
    ],
    series: [{
        name: '2020年6月',
        data: data,
        type: 'scatter',
        symbolSize: function(data) {
            // console.info(Math.sqrt(data[2]) / 5e1);
            return Math.sqrt(data[2]) / 5e1;
        },
        label: {
            show: true,
            position: 'right',
            formatter: function(param){
                if (Math.sqrt(param.data[2]) / 5e1 > 10) {
                    return param.data[3];
                } else {
                    return '';
                }
            },
            emphasis: {
                show: true,
                formatter: function(param) {
                    return param.data[3];
                },
                position: 'right'
            }
        },
        itemStyle: {
            opacity: 0.8,
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowOffsetY: 0,
            shadowColor: 'rgba(0, 0, 0, 0.5)',
        }
    }]
};
myChartb.setOption(option);
})


