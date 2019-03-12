<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>绿化详细信息表</title>
<link rel="stylesheet" href="<%=contextPath %>/layui-v2.4.5/layui/css/layui.css"  media="all">
<script src="<%=contextPath %>/layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script src="<%=contextPath %>/js/jquery-2.1.1.js"></script> 
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	    <legend style="text-align: center">绿化详情界面</legend>
	</fieldset>	   
	<div background-color: #F2F2F2;">
	    <div class="layui-row layui-col-space15">
	        <div class="layui-col-md12">
	            <div class="layui-card">              
	                <form class="layui-form layui-from-pane" action="" method="post">
	                    <div class="layui-card-body">
	                        <div class="layui-form-item">
	                            <div class="layui-inline">
	                                <label class="layui-form-label">负责人:</label>
	                                <div class="layui-input-inline">
	                                    <input type="text" name="mname" placeholder="请输入需要查询的负责人"
	                                           class="layui-input">
	                                </div>
	                            </div>                           
	                            <button class="layui-btn" lay-submit lay-filter="queryForm"
	                                    style="margin-left: 120px">立即查询
	                            </button>
	                        </div>
	                       <!-- 数据表格 -->
							<table class="layui-hide" id="test" lay-filter="test"></table>	 
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>             
<script>
	layui.use(['table','form'], function(){
	  var table = layui.table;
	  var form = layui.form;
	  
	  table.render({
	    elem: '#test'
	    ,url:'<%=contextPath %>/findGreenateaAndFuzeren'  //数据接口
	    ,toolbar: '#toolbarDemo'
	    ,title: '绿化数据表'
	    ,totalRow: true
	    ,defaultToolbar: ['filter', 'print', 'exports']
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'}
	      ,{field:'mid', title:'编号', width:80, 
	    	  fixed: 'left', unresize: true, sort: true}
	      ,{field:'mgname', title:'绿化名称', width:100}
	      ,{field:'mprice', title:'绿化价格', width:100}
	      ,{field:'mareas', title:'绿化面积(亩)', width:100}
	      ,{field:'mvegetation', title:'绿化植被', width:100}
	      ,{field:'mimgURL', title:'链接图片', width:120,templet:'<div><img src="{{d.mimgURL}}"></div>'}
	      ,{field:'mplantingDate', title:'种植时间', width:100}
	      ,{field:'mname', title:'负责人', width:80}
	      ,{field:'mphone', title:'联系电话', width:120}
	      ,{field:'mjobs', title:'职务', width:80}
	      ,{field:'mscwxsj', title:'维护时间', width:100}
	    ]]
	    ,page: true
	  });
	//监听查询点击事件
      form.on('submit(queryForm)', function (data) {
        table.render({
            elem: '#test'
            , url: '<%=contextPath %>/findGreenateaAndFuzeren?name='+data.field.mname //后台数据接口
            , page: true //开启分页
            ,cols: [[
           	      {type: 'checkbox', fixed: 'left'}
           	      ,{field:'mid', title:'编号', width:80, 
           	    	  fixed: 'left', unresize: true, sort: true}
           	      ,{field:'mgname', title:'绿化名称', width:100}
           	      ,{field:'mprice', title:'绿化价格', width:100}
           	      ,{field:'mareas', title:'绿化面积(亩)', width:100}
           	      ,{field:'mvegetation', title:'绿化植被', width:100}
           	      ,{field:'mimgURL', title:'链接图片', width:120,templet:'<div><img src="{{d.mimgURL}}"></div>'}
           	      ,{field:'mplantingDate', title:'种植时间', width:100}
           	      ,{field:'mname', title:'负责人', width:80}
           	      ,{field:'mphone', title:'联系电话', width:120}
           	      ,{field:'mjobs', title:'职务', width:80}
           	      ,{field:'mscwxsj', title:'维护时间', width:100}
           	    ]]
          });
          return false;
      });
	});
</script>	
</body>
</html>