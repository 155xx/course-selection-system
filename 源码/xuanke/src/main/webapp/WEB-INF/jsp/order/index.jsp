<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<link rel="stylesheet" href="http://localhost:8080/xuanke/layui-v2/css/layui.css" media="all" />
<link rel="stylesheet" href="http://localhost:8080/xuanke/css/all.css" media="all" />
</head>
<body>
    <blockquote class="layui-elem-quote quoteBox">
            <h2>我的选课</h2>
    </blockquote>

    <table id="List" lay-filter="List"></table>

    <script type="text/html" id="ListBar">
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="tuiding">退课</a>
    </script>


<script type="text/javascript" src="http://localhost:8080/xuanke/layui-v2/layui.js"></script>
<script type="text/javascript">
layui.use(['form','layer','table','laytpl','util'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laytpl = layui.laytpl,
        table = layui.table,
        savetag = null,
        util = layui.util;

    //列表
    var tableIns = table.render({
        elem: '#List',
        url : 'http://localhost:8080/xuanke/admin/order/getList',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limit : 20,
        limits : [10,15,20,25],
        id : "ListTable",
        cols : [[
            {field: 'id', title: 'ID', width:200, align:'center'},
            {field: 'uname', title: '学生', minWidth:100, align:'center'},
            {field: 'content', title: '申请简述', minWidth:100, align:'center'},
            {field: 'sname', title: '课程', minWidth:100, align:'center'},
            {field: 'uname2', title: '老师', minWidth:100, align:'center'},
            {field: 'state', title: '状态', minWidth:100, align:'center'},
            {title: '操作', maxWidth:200, templet:'#ListBar',fixed:"right",align:"center"}
        ]]
    });



    //列表操作
    table.on('tool(List)', function(obj){
        var Event = obj.event,
        Data = obj.data;
        if (Event === 'tuiding') {
            layer.confirm('您确定要退课？',{icon:3,title:'提示信息'},function(index){
                $.get("http://localhost:8080/xuanke/admin/order/tuiding",{
                    id : Data.id,
                },function(data){
                    if (data.status!=200) {
                        layer.msg(data.info);
                    }else{
                        layer.msg(data.info,{icon:1,time: 500,offset:'t'},function(){
                            tableIns.reload();
                            layer.close(index);
                        });
                    }
                })
            });
        }

    });


})
</script>        
</body>
</html>