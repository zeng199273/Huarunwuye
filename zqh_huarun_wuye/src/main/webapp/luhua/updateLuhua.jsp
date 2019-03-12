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
<h1>修改绿化区域</h1>
  <div class="layui-form-item">
    <label class="layui-form-label">序列ID</label>
    <div class="layui-input-block">
      <input type="text" name="id" disabled="disabled" value="${requestScope.g.id}" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">区域名称</label>
    <div class="layui-input-block">
      <input type="text" name="name" value="${requestScope.g.name}" lay-verify="required" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">绿化价格</label>
    <div class="layui-input-block">
      <input type="text" name="price" value="${requestScope.g.price}" lay-verify="required" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">绿化面积</label>
    <div class="layui-input-block">
      <input type="text" name="areas" value="${requestScope.g.areas}" lay-verify="required" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">种植植被</label>
    <div class="layui-input-block">
      <input type="text" name="vegetation" value="${requestScope.g.vegetation}" lay-verify="required" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">图片链接</label>
    <div class="layui-input-block">
      <input type="text" name="imgURL" value="${requestScope.g.imgURL}" lay-verify="required" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">种植时间</label>
    <div class="layui-input-block">
      <input type="text" name="plantingDate" value="${requestScope.g.plantingDate}" lay-verify="required" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">负责人Id</label>
    <div class="layui-input-block">
      <input type="text" name="fuzerenId" value="${requestScope.g.fuzerenId}" lay-verify="required" autocomplete="off" class="layui-input">
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
			var price = $("input[name=price]").val();
			var areas = $("input[name=areas]").val();
			var vegetation = $("input[name=vegetation]").val();
			var imgURL = $("input[name=imgURL]").val();
			var plantingDate = $("input[name=plantingDate]").val();
			var fuzerenId = $("input[name=fuzerenId]").val();
			//执行ajax请求
			$.ajax({
				url:'<%=contextPath%>/upGreenarea',
				method:'POST',
				data:{"id":id,"name":name,"price":price,"areas":areas,"vegetation":vegetation,
						"imgURL":imgURL,"plantingDate":plantingDate,"fuzerenId":fuzerenId},
				dataType:'text',
				success:function(data){
					alert(data)
					//修改成功后跳转加主页面  
					window.location.href='<%=contextPath%>/luhua/luhuaTable.jsp' ;
				}
			});
		});
	});	
</script>
