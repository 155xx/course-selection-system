var myCharts = echarts.init(document.getElementById('aleftboxtmidd'));

$.get("http://localhost:8080/xuanke/admin/home/getBing",{
},function(data){
	options = {
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
	    backgroundColor: 'rgba(1,202,217,.2)',
	    title: [{ 
	        text: '应到对比',
	        textStyle: {
	            color: '#a0b3c7',
	            fontWeight: 'normal',
	            fontSize: 14
	        },
	        top: 'top',
	        left: '15%'
	    },{
	        text: '请假对比',
	        textStyle: {
	            color: '#a0b3c7',
	            fontWeight: 'normal',
	            fontSize: 14
	        },
	        top: 'top',
	        left: '65%'
	    }],
	    grid: {
	        left: 10,
	        right: 40,
	        top: 20,
	        bottom: 0,
	        containLabel: true
	    },
	    legend: {
	        x: 'center',
	        y: '70%',
	        textStyle: {
	            fontSize: 10,
	            color: 'rgba(255,255,255,.7)'
	        },
	        data: ['应到人数', '打卡人数', '请假人数', '夜不归宿']
	    },
	    calculable: true,
	    series: [

	        {
	            name: '面积模式',
	            type: 'pie',
	            radius: [5, 50],
	            center: ['25%', '40%'],
	            roseType: 'area',
	            label: {
	                normal: {
	                    formatter: '{c}',
	                    position: 'inside'
	                }
	            },
	            itemStyle: {
	            },

	            data: [{
	                value: data.data.num,
	                name: '应到人数'
	            }, {
	                value: data.data.qiandaonum,
	                name: '打卡人数'
	            }]
	        }, {
	            name: '面积模式',
	            type: 'pie',
	            radius: [5, 50],
	            center: ['75%', '40%'],
	            roseType: 'area',
	            label: {
	                normal: {
	                    formatter: '{c}',
	                    position: 'inside'
	                }
	            },
	            data: [
	                { value: data.data.qingjianum, name: '请假人数' },
	                { value: data.data.weinum, name: '夜不归宿' },

	            ]
	        }
	    ]
	};



	myCharts.setOption(options);
})
