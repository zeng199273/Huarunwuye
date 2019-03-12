<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工考勤信息</title>
<link rel="stylesheet" href="<%=contextPath %>/layui-v2.4.5/layui/css/layui.css"  media="all">
<script src="<%=contextPath %>/layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script src="<%=contextPath %>/js/jquery-2.1.1.js"></script> 
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	    <legend style="text-align: center">员工考勤详情界面</legend>
	</fieldset>
<div background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <form class="layui-form layui-from-pane" action="" method="post">
                    <div class="layui-card-body">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">员工名:</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="name" placeholder="请输入需要查询的员工名"
                                           class="layui-input">
                                </div>
                            </div>
                            <button class="layui-btn" lay-submit lay-filter="queryForm"
                                    style="margin-left:20px">立即查询
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
	    elem: '#test'  //指定原始 table 容器的选择器或 DOM，方法渲染方式必填
	    ,url:'<%=contextPath %>/findEmployeesAttendance'  //数据接口
	    ,toolbar: '#toolbarDemo'   //开启表格头部工具栏区域
	    ,title: '员工考勤表'  //标题 
	    ,totalRow: true   //是否开启合计行区域
	    ,defaultToolbar: ['filter', 'print', 'exports']  //自由配置头部工具栏右侧的图标
	    ,cols: [[   //设置表头。值是一个二维数组。方法渲染方式必填
	      {type: 'checkbox', fixed: 'left'}
	      ,{field:'id', title:'编号', width:200, 
	    	  fixed: 'left', unresize: true, sort: true}
	      ,{field:'name', title:'员工名', width:200}
	      ,{field:'staffId', title:'员工号', width:200}
	      ,{field:'phone', title:'联系电话', width:200}
	      ,{field:'clockIn', title:'打卡时间', width:200}
	    ]]
	    ,page: true //分页
	  });
	//监听查询点击事件
      form.on('submit(queryForm)', function (data) {
              table.render({
                  elem: '#test'
                  , url: '<%=contextPath%>/findEmployeesAttendance?name=' + data.field.name  //后台数据接口
                  , page: true //开启分页
                  ,cols: [[   //设置表头。值是一个二维数组。方法渲染方式必填
           	      {type: 'checkbox', fixed: 'left'}
           	      ,{field:'id', title:'编号', width:200, 
           	    	  fixed: 'left', unresize: true, sort: true}
           	      ,{field:'name', title:'员工名', width:200}
           	      ,{field:'staffId', title:'员工号', width:200}
           	      ,{field:'phone', title:'联系电话', width:200}
           	      ,{field:'clockIn', title:'打卡时间', width:200}
           	    ]]
          });
          return false;
      });
	});
</script>	
</body>
</html>