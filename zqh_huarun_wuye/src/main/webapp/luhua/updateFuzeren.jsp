<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>carousel模块快速使用</title>
  <link rel="stylesheet" href="<%=contextPath%>/layui/css/layui.css">
  <script src="<%=contextPath%>/layui/layui.js"></script>
  <script src="<%=contextPath%>/js/jquery-2.1.1.js"></script> 
  <style>
  	.layui-input{
		width:200px;
	}
	h1,button{margin-left:120px;}
  </style>
</head>
<body>
<h1>修改负责人</h1>
  <div class="layui-form-item">
    <label class="layui-form-label">编号ID</label>
    <div class="layui-input-block">
      <input type="text" name="id" disabled="disabled" value="${requestScope.fuzeren.id}" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">负责人名称</label>
    <div class="layui-input-block">
      <input type="text" name="name" value="${requestScope.fuzeren.name}" lay-verify="required" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">联系电话</label>
    <div class="layui-input-block">
      <input type="text" name="phone" value="${requestScope.fuzeren.phone}" lay-verify="required" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">职务</label>
    <div class="layui-input-block">
      <input type="text" name="jobs" value="${requestScope.fuzeren.jobs}" lay-verify="required" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">维护时间</label>
    <div class="layui-input-block">
      <input type="text" name="scwxsj" value="${requestScope.fuzeren.scwxsj}" lay-verify="required" autocomplete="off" class="layui-input">
    </div>
  </div>
  <button class="layui-btn">确定修改</button>
</body>
</html>
<!-- 执行jQuery对数据的操作 -->
<script>
	$(function(){
		$("button:eq(0)").click(function(){
			//得到表单的数据
			var id = $("input[name=id]").val();
			var name = $("input[name=name]").val();
			var phone = $("input[name=phone]").val();
			var jobs = $("input[name=areas]").val();
			var scwxsj = $("input[name=scwxsj]").val();
			//执行ajax请求
			$.ajax({
				url:'<%=contextPath%>/upFuzeren',
				method:'POST',
				data:{"id":id,"name":name,"phone":phone,"jobs":jobs,"scwxsj":scwxsj},
				dataType:'text',
				success:function(data){
					alert(data)
					//修改成功后跳转加主页面  
					window.location.href='<%=contextPath%>/luhua/fuzerenTable.jsp' ;
				}
			});
		});
	});	
</script>
