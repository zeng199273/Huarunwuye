<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工信息</title>
<link rel="stylesheet" href="<%=contextPath %>/layui-v2.4.5/layui/css/layui.css"  media="all">
<script src="<%=contextPath %>/layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script src="<%=contextPath %>/js/jquery-2.1.1.js"></script> 
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	    <legend style="text-align: center">员工基本信息界面</legend>
	</fieldset>
	<!-- 数据表格 -->
	<table class="layui-hide" id="test" lay-filter="test"></table>
	<script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-sm" lay-event="add">添加</a>
		<a class="layui-btn layui-btn-warm layui-btn-sm" lay-event="edit">编辑</a>
  		<a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
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
                                 class="layui-input">
                      </div>
                  </div>
            	<div class="layui-inline">
                    <label class="layui-form-label">员工名</label>
                    <div class="layui-input-inline">
                        <input id="name" type="text" name="name" lay-verify="required" autocomplete="off"
                               placeholder="请输入员工名"
                               class="layui-input">
                    </div>
                 </div>
                 <div class="layui-form-item">
				  	 <label class="layui-form-label">性别</label>
					 <div class="layui-input-block">
					      <input type="radio" name="sex" value="男" title="男" checked>
					      <input type="radio" name="sex" value="女" title="女">
					 </div>
				  </div>
                  <div class="layui-inline">
                      <label class="layui-form-label">年龄</label>
                      <div class="layui-input-inline">
                          <input id="age" type="text" name="age" lay-verify="required" autocomplete="off"
                                 placeholder="请输入年龄"
                                 class="layui-input">
                      </div>
                  </div>
                  <div class="layui-inline">
                      <label class="layui-form-label">入职时间</label>
                      <div class="layui-input-inline">
                          <input id="entryDate" type="text" name="entryDate" lay-verify="required" autocomplete="off"
                                 placeholder="请输入入职时间"
                                 class="layui-input">
                      </div>
                  </div>
                  <div class="layui-inline">
                      <label class="layui-form-label">联系电话</label>
                      <div class="layui-input-inline">
                          <input id="phone" type="text" name="phone" lay-verify="required" autocomplete="off"
                                 placeholder="请输入联系电话"
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
                     <label class="layui-form-label">职务Id</label>
                     <div class="layui-input-inline">
                         <input id="jobsId" type="text" name="jobsId" lay-verify="required" autocomplete="off"
                                placeholder="请输入职务Id"
                                class="layui-input">
                     </div>
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
	    ,url:'<%=contextPath %>/findAllEmployees'  //数据接口
	    ,toolbar: '#toolbarDemo'   //开启表格头部工具栏区域
	    ,title: '员工表'  //标题 
	    ,totalRow: true   //是否开启合计行区域
	    ,defaultToolbar: ['filter', 'print', 'exports']  //自由配置头部工具栏右侧的图标
	    ,cols: [[   //设置表头。值是一个二维数组。方法渲染方式必填
	      {type: 'checkbox', fixed: 'left'}
	      ,{field:'id', title:'编号', width:80, 
	    	  fixed: 'left', unresize: true, sort: true}
	      ,{field:'name', title:'员工名', width:120}
	      ,{field:'sex', title:'性别', width:80}
	      ,{field:'age', title:'年龄', width:80}
	      ,{field:'entryDate', title:'入职时间', width:160}
	      ,{field:'phone', title:'联系电话', width:160}
	      ,{field:'staffId', title:'员工号', width:80}
	      ,{field:'jobsId', title:'职务Id', width:80}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
	    ]]
	    ,page: true //分页
	  });
	  //监听行工具事件 
	  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'add'){  //添加数据
	    	//跳转到签到的页面 
	    	 window.location.href="<%=contextPath%>/kaoqin/addEmployees.jsp";	 
	    } else if(obj.event === 'del'){  //删除数据
	    	layer.confirm('真的删除员工 \t' + data.name + "\t吗！", function (index) {
                //异步像服务器发送删除请求
                $.ajax({
                    url: '<%=contextPath%>/delEmployees',
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
                title: "更新员工",
                area: ['400px', '500px'],
                content: $("#popUpdateEmp"),
                success: function () {
                    //回显数据
                    $("#id").val(data.id);
                    $("#name").val(data.name);
                    $("#age").val(data.age);  
                    $("#entryDate").val(data.entryDate); 
                    $("#phone").val(data.phone); 
                    $("#staffId").val(data.staffId); 
                    $("#jobsId").val(data.jobsId); 
                },
            });
	     }
	  });
	//更新操作
      form.on('submit(updateFormBtn)', function (data) {
          //发送ajax请求
          $.ajax({
              url: '<%=contextPath%>/upEmployees',
              data: {"id":data.field.id,"name":data.field.name,"sex":data.field.sex,
            	  "age":data.field.age,"entryDate":data.field.entryDate,"phone":data.field.phone,
            	  "staffId":data.field.staffId,"jobsId":data.field.jobsId},
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