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
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>添加员工</legend>
</fieldset>
<form class="layui-form" method="post">
    <div background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">员工名</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="name" lay-verify="required" autocomplete="off"
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
                                    <input type="text" name="age" lay-verify="required" autocomplete="off"
                                           placeholder="请输入年龄"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">入职时间</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="entryDate" lay-verify="required" autocomplete="off"
                                           placeholder="请输入入职时间"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">联系电话</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="phone" lay-verify="required" autocomplete="off"
                                           placeholder="请输入联系电话"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">员工号</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="staffId" lay-verify="required" autocomplete="off"
                                           placeholder="请输入员工号"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">职务Id</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="jobsId" lay-verify="required" autocomplete="off"
                                           placeholder="请输入职务Id"
                                           class="layui-input">
                                </div>
                            </div>                           
                        </div>
                        <button class="layui-btn" lay-submit lay-filter="formDemo"
                                style="margin-left: 120px">立即添加
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
        //监听提交点击事件
        form.on('submit(formDemo)', function (data) {
            //像服务端发送请求
            $.ajax({
                url: '<%=contextPath%>/addEmployees',
                method: 'POST',
                data: {"name":data.field.name,"sex":data.field.sex,"age":data.field.age,
                		"entryDate":data.field.entryDate,"phone":data.field.phone,
                		"staffId":data.field.staffId,"jobsId":data.field.jobsId},
                dataType: 'text',  //数据类型格式
                success: function (result) {
                    if (result == "success") {
                        layer.msg('添加成功！', {time: 1 * 1000}, function () {
                            window.location.href="<%=contextPath%>/kaoqin/EmployeesTable.jsp";
                        });
                    } else {
                        layer.msg("添加失败！" + result, {icon: 5});
                    }
                },
                error: function (errorMsg) {
                    alert("数据异常！" + errorMsg);
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
