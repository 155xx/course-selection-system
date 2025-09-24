
var myCharth = echarts.init(document.getElementById('arightboxbott'));
$.get("http://localhost:8080/xuanke/admin/home/getBing2",{
},function(data){
optionh = {
    color: [{
        type: 'linear',
        x: 0,
        y: 0,
        x2: 0,
        y2: 1,
        colorStops: [{
            offset: 0,
            color: '#2C8179' // 0% 处的颜色
        }, {
            offset: 1,
            color: '#18C4B9' // 100% 处的颜色
        }],
        global: false // 缺省为 false
    }, {
        type: 'linear',
        x: 0,
        y: 0,
        x2: 0,
        y2: 1,
        colorStops: [{
            offset: 0,
            color: '#ACBF95' // 0% 处的颜色
        }, {
            offset: 1,
            color: '#7CBF2B' // 100% 处的颜色
        }],
        global: false // 缺省为 false
    }, {
        type: 'linear',
        x: 0,
        y: 0,
        x2: 0,
        y2: 1,
        colorStops: [{
            offset: 0,
            color: '#508097' // 0% 处的颜色
        }, {
            offset: 1,
            color: '#1C3979' // 100% 处的颜色
        }],
        global: false // 缺省为 false
    }, {
        type: 'linear',
        x: 0,
        y: 0,
        x2: 0,
        y2: 1,
        colorStops: [{
            offset: 0,
            color: '#4d72d9' // 0% 处的颜色
        }, {
            offset: 1,
            color: '#75489F' // 100% 处的颜色
        }],
        global: false // 缺省为 false
    }],
    title: [{
        top: 125,
        left: 80,
        textStyle: {
            fontSize: 18,
            color: 'rgba(255,255,255,.6)'
        },
        text: '请假\n未请'
    },{
        top: 125,
        right: 80,
        textStyle: {
            fontSize: 18,
            color: 'rgba(255,255,255,.6)'
        },
        text: '打卡\n应到'
    }],
    tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b}: {c} ({d}%)'
    },
    legend: {
        left: 10,
        textStyle: {
            fontSize: 10,
            color: 'rgba(255,255,255,.7)'
        },
        data: ['应到人数', '打卡人数', '请假人数', '夜不归宿']
    },
    grid: {
        
        containLabel: true
    },
    series: [{
        name: '人数',
        type: 'pie',
        radius: ['45%', '65%'],
        center: ['75%', '55%'],
        avoidLabelOverlap: false,
        label: {
            // show: false,
            position: 'inner',
            formatter: '{b} {c} 人'
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
        data: [{
            value: data.data.num,
            name: '应到人数'
        }, {
            value: data.data.qiandaonum,
            name: '打卡人数'
        }]
    }, {
        name: '人数',
        type: 'pie',
        radius: ['45%', '65%'],
        center: ['25%', '55%'],
        avoidLabelOverlap: false,
        label: {
            // show: false,
            position: 'inner',
            formatter: '{b} {c} 人'
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
            { value: data.data.qingjianum, name: '请假人数' },
            { value: data.data.weinum, name: '夜不归宿' },
        ]
    }]
};

myCharth.setOption(optionh);
})