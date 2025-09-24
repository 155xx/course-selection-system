
var myChart = echarts.init(document.getElementById('aleftboxtbott'));

$.get("http://localhost:8080/xuanke/admin/home/getZhu",{
},function(data){
	console.log(data)
option = {
    color: ['#7ecef4'],
    backgroundColor: 'rgba(1,202,217,.2)',
    title: {
        top: 5,
        left: 20,
        textStyle: {
            fontSize: 10,
            color: 'rgba(255,255,255,.6)'
        },
        text: '对比上次'
    },
    legend: {
        right: 10,
        top: 5,
        textStyle: {
            fontSize: 10,
            color: 'rgba(255,255,255,.6)'
        },
        data: [data.data.name1, data.data.name2]
    },
    grid: {
        left: 20,
        right: 20,
        top: 30,
        bottom: 2,
        containLabel: true
    },

    xAxis: {
        type: 'value',
        axisLine: {
            lineStyle: {
                color: 'rgba(255,255,255,.2)'
            }
        },
        splitLine: {
            lineStyle: {
                color: 'rgba(255,255,255,0)'
            }
        },
        axisLabel: {
            color: "rgba(255,255,255,0)"
        },
        boundaryGap: [0, 0.01]
    },
    yAxis: {
        type: 'category',
    
        axisLine: {
            lineStyle: {
                color: 'rgba(255,255,255,.5)'
            }
        },
        splitLine: {
            lineStyle: {
                color: 'rgba(255,255,255,.1)'
            }
        },
        axisLabel: {
            color: "rgba(255,255,255,.5)"
        },
        data: ['应到人数', '打卡人数', '请假人数', '夜不归宿']
    },
    series: [{
        name: data.data.name1,
        type: 'bar',
        barWidth: 15,
        label: {
            show: true,
            position: 'inside'
        },
        itemStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(
                    1, 0, 0, 1, [{
                        offset: 0,
                        color: 'rgba(77,114,217,.7)'
                    }, {
                        offset: 1,
                        color: 'rgba(117,72,159,.7'
                    }]
                )
            }
        },
        data: [data.data.map1.num, data.data.map1.qiandaonum, data.data.map1.qingjianum, data.data.map1.weinum]
    }, {
        name: data.data.name2,
        type: 'bar',
        barWidth: 15,
        label: {
            show: true,
            position: 'inside'
        },
        itemStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(
                    1, 0, 0, 1, [{
                        offset: 0,
                        color: 'rgba(230,253,139,.7)'
                    }, {
                        offset: 1,
                        color: 'rgba(41,220,205,.7)'
                    }]
                )
            }
        },
        data: [data.data.map2.num, data.data.map2.qiandaonum, data.data.map2.qingjianum, data.data.map2.weinum]
    }]
};
myChart.setOption(option);
})