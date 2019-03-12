<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String contextPath = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>华润·凤凰城物业管理系统</title>
   <link rel="stylesheet" href="<%=contextPath %>/layui/css/layui.css">
	<script src="<%=contextPath %>/layui/layui.js"></script>
	<!-- 导入jQuery在线插件 -->
<script src="<%=contextPath%>/js/jquery-2.1.1.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">华润·凤凰城物业管理系统</div>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
         	 贤心
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="#">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">
      	  <li class="layui-nav-item">
          	<a href="#">买房交房流程管理</a>
          </li>
          <li class="layui-nav-item">
          	<a href="#">装修流程管理</a>
          </li>
          <li class="layui-nav-item">
          	<a href="#">建材入库管理</a>
          </li>
          <li class="layui-nav-item">
          	<a href="#">购买车位,停车位管理</a>
          </li>                 
          <li class="layui-nav-item layui-nav-itemed">
            <a href="javascript:;">物业绿化管理</a>
            <dl class="layui-nav-child">
              <dd><a href="<%=contextPath %>/luhua/greenareaAndFuzeren.jsp" target="iframe">绿化详细信息</a></dd>
              <dd><a href="<%=contextPath %>/luhua/luhuaTable.jsp" target="iframe">绿化表格</a></dd>
              <dd><a href="<%=contextPath %>/luhua/fuzerenTable.jsp" target="iframe">绿化负责人</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
          	<a href="">客户资料管理</a>
          </li>
          <li class="layui-nav-item">
          	<a href="">房屋维修管理</a>
          </li>
          <li class="layui-nav-item">
          	<a href="">临时停车管理</a>
          </li>
          <li class="layui-nav-item">
          	<a href="">垃圾处理管理</a>
          </li>
          <li class="layui-nav-item">
          	<a href="">污水排放管理</a>
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;">物业公司员工考勤管理</a>
            <dl class="layui-nav-child">
              <dd>
               <a href="<%=contextPath%>/kaoqin/AttendanceTable.jsp" target="iframe">考勤详情</a>
              </dd>
              <dd><a href="<%=contextPath%>/kaoqin/EmployeesTable.jsp" target="iframe">员工基本信息</a></dd>
              <dd>
               <a href="<%=contextPath%>/kaoqin/JobsTable.jsp" target="iframe">职务详情</a>
              </dd>           
              <dd>
               <a href="<%=contextPath%>/kaoqin/employeesAttendanceTable.jsp" target="iframe">查询员工考勤</a>
              </dd>
              <dd><a href="<%=contextPath%>/kaoqin/employeesJobsTable.jsp" target="iframe">查询员工职务</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
          	<a href="">业主信息管理</a>
          </li>
          <li class="layui-nav-item">
          	<a href="">业主登录管理</a>
          </li>
          <li class="layui-nav-item">
          	<a href="">物业经理管理</a>
          </li>
        </ul>
    </div>
  </div>
  
  <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 2px;">
            <iframe name="iframe" width="100%" height="730px" frameborder="0"
                    class="xiframe" scrolling="no" src="welcome.jsp"></iframe>
        </div>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <span style="margin-left: 400px">
              © 2019 iArchie-华润物业管理系统-V1.0.1 - 底部固定区域
        </span>

    </div>
<script>
//JavaScript代码区域
layui.use(['element','layer'], function(){
  var element = layui.element;
  var layer = layui.layer ;  
});
</script>
</body>
</html>