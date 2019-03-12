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
<h1>考勤签到</h1>
	<div class="layui-form-item">
    <label class="layui-form-label">员工号</label>
    <div class="layui-input-block">
      <input type="text" name="staffId" required  lay-verify="required" placeholder="请输入员工号" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">打卡时间</label>
    <div class="layui-input-block">
      <input type="text" name="clockIn" required  lay-verify="required" placeholder="请输入打卡时间" autocomplete="off" class="layui-input">
    </div>
  </div>
  <button class="layui-btn">签到</button>
</body>
</html>
<!-- 执行jQuery对数据的操作 -->
<script>
	$(function(){
		$("button:eq(0)").click(function(){
			//得到表单的数据
			var staffId = $("input[name=staffId]").val();
			var clockIn = $("input[name=clockIn]").val();
			if(staffId !="" && clockIn !=""){
				//执行ajax请求
				 $.ajax({
					url:'<%=contextPath %>/addAttendance',
					method:'POST',
					data:{"staffId":staffId,"clockIn":clockIn},
					dataType:'text',
					success:function(data){
						if(data == "success") {
	                       alert('签到成功！')
	                            window.location.href = "<%=contextPath%>/kaoqin/AttendanceTable.jsp";
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
