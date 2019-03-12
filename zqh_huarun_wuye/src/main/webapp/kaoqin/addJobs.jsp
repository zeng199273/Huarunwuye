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
<h1>添加职务</h1>
	<div class="layui-form-item">
    <label class="layui-form-label">职务</label>
    <div class="layui-input-block">
      <input type="text" name="jobs" required  lay-verify="required" placeholder="请输入职务" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">基本工资</label>
    <div class="layui-input-block">
      <input type="text" name="basePay" required  lay-verify="required" placeholder="请输入基本工资" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">补贴</label>
    <div class="layui-input-block">
      <input type="text" name="subsidy" required  lay-verify="required" placeholder="请输入补贴" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">实发工资</label>
    <div class="layui-input-block">
      <input type="text" name="grossPay" required  lay-verify="required" placeholder="请输入实发工资" autocomplete="off" class="layui-input">
    </div>
  </div>
  <button class="layui-btn">确认添加</button>
</body>
</html>
<!-- 执行jQuery对数据的操作 -->
<script>
	$(function(){
		$("button:eq(0)").click(function(){
			//得到表单的数据
			var jobs = $("input[name=jobs]").val();
			var basePay = $("input[name=basePay]").val();
			var subsidy = $("input[name=subsidy]").val();
			var grossPay = $("input[name=grossPay]").val();
			if(jobs !="" && basePay !="" && subsidy !="" && grossPay !=""){
				//执行ajax请求
				 $.ajax({
					url:'<%=contextPath %>/addJobs',
					method:'POST',
					data:{"jobs":jobs,"basePay":basePay,"subsidy":subsidy,"grossPay":grossPay},
					dataType:'text',
					success:function(data){
						if(data == "success") {
	                       alert('添加成功！')
	                            window.location.href = "<%=contextPath%>/kaoqin/JobsTable.jsp";
	                    } else {
	                        alert("签到失败！" + data);
	                    }
	                },
	                error: function (errorMsg) {
	                    alert("数据异常！" + errorMsg);
	                }
				}); 
			}else{
				alert("表单为空，不能添加");
			}
		});
	});	
</script>
