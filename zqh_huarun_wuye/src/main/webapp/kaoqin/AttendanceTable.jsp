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
	    <legend style="text-align: center">考勤界面</legend>
	</fieldset>
	<!-- 数据表格 -->
	<table class="layui-hide" id="test" lay-filter="test"></table>
	<script type="text/html" id="barDemo">
  		<a class="layui-btn" lay-event="add">签到</a>
		<a class="layui-btn layui-btn-warm" lay-event="edit">编辑</a>
  		<a class="layui-btn layui-btn-danger" lay-event="del">删除</a>
	</script>                   	 
<%--隐藏编辑弹窗表单--%>
<div class="layui-row" id="popUpdateEmp" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px">
            <div class="layui-form-item">
            	<div class="layui-inline">
                    <label class="layui-form-label">编号</label>
                    <div class="layui-input-inline">
                        <input id="id" type="text" name="id" disabled="disabled" lay-verify="required" autocomplete="off"
                               placeholder="请输入编号"
                               class="layui-input">
                    </div>
                </div>     
                <div class="layui-inline">
                    <label class="layui-form-label">员工号</label>
                    <div class="layui-input-inline">
                        <input id="staffId" type="text" name="staffId" lay-verify="required" autocomplete="off"
                               placeholder="请输入员工号"
                               class="layui-input">
                    </div>
                </div>                     
                <div class="layui-inline">
                    <label class="layui-form-label">打卡时间</label>
                    <div class="layui-input-inline">
                        <input type="text" id="clockIn" name="clockIn" lay-verify="required" autocomplete="off"
                               placeholder="请输入打卡时间"
                               class="layui-input">
                    </div>
                </div>              
            <button class="layui-btn" lay-submit lay-filter="updateFormBtn"
                    style="margin-left: 120px">确认更新
            </button>
        </form>
    </div>
</div>

<script>
	layui.use(['table','form'], function(){
	  var table = layui.table;
	  var form = layui.form;
	  
	  table.render({
	    elem: '#test'  //指定原始 table 容器的选择器或 DOM，方法渲染方式必填
	    ,url:'<%=contextPath %>/findAllAttendance'  //数据接口
	    ,toolbar: '#toolbarDemo'   //开启表格头部工具栏区域
	    ,title: '员工考勤表'  //标题 
	    ,totalRow: true   //是否开启合计行区域
	    ,defaultToolbar: ['filter', 'print', 'exports']  //自由配置头部工具栏右侧的图标
	    ,cols: [[   //设置表头。值是一个二维数组。方法渲染方式必填
	      {type: 'checkbox', fixed: 'left'}
	      ,{field:'id', title:'编号', width:220, 
	    	  fixed: 'left', unresize: true, sort: true}
	      ,{field:'staffId', title:'员工号', width:240}
	      ,{field:'clockIn', title:'打卡时间', width:240}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:260}
	    ]]
	    ,page: true //分页
	  });
	  //监听行工具事件 
	  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'add'){  //添加数据
	    	//跳转到签到的页面 
	    	 window.location.href="<%=contextPath%>/kaoqin/addAttendance.jsp";	 
	    } else if(obj.event === 'del'){  //删除数据
	    	layer.confirm('真的删除员工号\t' + data.staffId + "\t吗！", function (index) {
                //异步像服务器发送删除请求
                $.ajax({
                    url: '<%=contextPath%>/delAttendance',
                    type: 'GET',
                    data: {'id': data.id},
                    success: function (result) {
                        if (result == "success") {
                            layer.msg("删除成功!", {icon: 6});
                            obj.del();
                            layer.close(index);

                        } else {
                            layer.msg("删除失败!" + result, {icon: 5});
                            layer.close(index);
                        }
                    },
                    error: function (errorMsg) {
                        layer.msg("数据异常!" + errorMsg, {icon: 5});
                        layer.close(index);
                        location.reload();
                    },
                });
	    	});
	    } else if(obj.event === 'edit'){  //修改数据
	    	layer.open({
                type: 1,
                title: "更新考勤",
                area: ['400px', '300px'],
                content: $("#popUpdateEmp"),
                success: function () {
                    //回显数据
                    $("#id").val(data.id);
                    $("#staffId").val(data.staffId);
                    $("#clockIn").val(data.clockIn);  
                },
            });
	     }
	  });
	//更新操作
      form.on('submit(updateFormBtn)', function (data) {
    	  //得到表单的数据
    	 	var id = data.field.id ;
    	 	var staffId = data.field.staffId ;
    	 	var clockIn = data.field.clockIn ;
          //发送ajax请求
          $.ajax({
              url: '<%=contextPath%>/upAttendance',
              data: {"id":id,"staffId":staffId,"clockIn":clockIn},
              method: 'post',
              dataType: 'text',  //数据类型格式
              success: function (result) {
                  if (result == "success") {
                      layer.closeAll();
                      layer.msg('更新成功', {time: 1 * 1000}, function () {
                          location.reload();
                      });
                  } else {
                      layer.closeAll();
                      layer.msg('更新失败', {time: 1 * 1000}, function () {
                          location.reload();
                      });
                  }
              },
              error: function (errorMsg) {
                  alert("数据异常！" + errorMsg);
                  location.reload();
              },
          });
          return false;
      });
	});
</script>	
</body>
</html>