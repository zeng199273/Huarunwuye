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
  <link rel="stylesheet" href="<%=contextPath %>/layui/css/layui.css">
  <script src="<%=contextPath %>/layui/layui.js"></script>
  <script src="<%=contextPath %>/js/jquery-2.1.1.js"></script> 
  <style>
  	.layui-input{
		width:200px;
	}
	h1,button{margin-left:120px;}
  </style>
</head>
<body>
<h1>添加绿化负责人</h1>
	<div class="layui-form-item">
    <label class="layui-form-label">负责人名称</label>
    <div class="layui-input-block">
      <input type="text" name="name" required  lay-verify="required" placeholder="请输入负责人名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">联系电话</label>
    <div class="layui-input-block">
      <input type="text" name="phone" required  lay-verify="required" placeholder="请输入联系电话" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">职务</label>
    <div class="layui-input-block">
      <input type="text" name="jobs" required  lay-verify="required" placeholder="请输入职务" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">维护时间</label>
    <div class="layui-input-block">
      <input type="text" name="scwxsj" required  lay-verify="required" placeholder="请输入维护时间" autocomplete="off" class="layui-input">
    </div>
  </div>
  <button class="layui-btn">确定添加</button>
</body>
</html>
<!-- 执行jQuery对数据的操作 -->
<script>
	$(function(){
		$("button:eq(0)").click(function(){
			//得到表单的数据
			var name = $("input[name=name]").val();
			var phone = $("input[name=phone]").val();
			var jobs = $("input[name=jobs]").val();
			var scwxsj = $("input[name=scwxsj]").val();
			if(name!="" && phone!="" && jobs!="" && scwxsj!=""){
				//执行ajax请求
				$.ajax({
					url:'<%=contextPath %>/addFuzeren',
					method:'POST',
					data:{"name":name,"phone":phone,"jobs":jobs,"scwxsj":scwxsj},
					dataType:'text',
					success:function(data){
						alert(data)
						//添加成功后跳转加主页面 
						window.location.href='<%=contextPath %>/luhua/fuzerenTable.jsp' ;
					}
				});
			}else{
				alert("表单不能为空");
			}	
		});
	});	
</script>
