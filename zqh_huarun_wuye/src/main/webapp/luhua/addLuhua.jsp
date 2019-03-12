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
<h1>添加绿化区域</h1>
	<div class="layui-form-item">
    <label class="layui-form-label">区域名称</label>
    <div class="layui-input-block">
      <input type="text" name="name" required  lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">绿化价格</label>
    <div class="layui-input-block">
      <input type="text" name="price" required  lay-verify="required" placeholder="请输入价格" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">绿化面积</label>
    <div class="layui-input-block">
      <input type="text" name="areas" required  lay-verify="required" placeholder="请输入面积" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">种植植被</label>
    <div class="layui-input-block">
      <input type="text" name="vegetation" required  lay-verify="required" placeholder="请输入植被" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">图片链接</label>
    <div class="layui-input-block">
      <input type="text" name="imgURL" required  lay-verify="required" placeholder="图片链接地址" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">种植时间</label>
    <div class="layui-input-block">
      <input type="text" name="plantingDate" required  lay-verify="required" placeholder="请输入种植时间" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">负责人Id</label>
    <div class="layui-input-block">
      <input type="text" name="fuzerenId" required  lay-verify="required" placeholder="负责人Id" autocomplete="off" class="layui-input">
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
			var price = $("input[name=price]").val();
			var areas = $("input[name=areas]").val();
			var vegetation = $("input[name=vegetation]").val();
			var imgURL = $("input[name=imgURL]").val();
			var plantingDate = $("input[name=plantingDate]").val();
			var fuzerenId = $("input[name=fuzerenId]").val();
			//执行ajax请求
			$.ajax({
				url:'<%=contextPath %>/addGreenarea',
				method:'POST',
				data:{"name":name,"price":price,"areas":areas,"vegetation":vegetation,
						"imgURL":imgURL,"plantingDate":plantingDate,"fuzerenId":fuzerenId},
				dataType:'text',
				success:function(data){
					alert(data)
					//添加成功后跳转加主页面 
					window.location.href='<%=contextPath %>/luhua/luhuaTable.jsp' ;
				}
			});
		});
	});	
</script>
