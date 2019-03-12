<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>绿化负责人表格详细信息</title>
<link rel="stylesheet" href="<%=contextPath %>/layui-v2.4.5/layui/css/layui.css"  media="all">
<script src="<%=contextPath %>/layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script src="<%=contextPath %>/js/jquery-2.1.1.js"></script> 
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	    <legend style="text-align: center">绿化负责人界面</legend>
	</fieldset>
	<!-- 数据表格 -->
	<table class="layui-hide" id="test" lay-filter="test"></table>	 
	
	<script type="text/html" id="toolbarDemo">
  		<div class="layui-btn-container">
    		<button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    		<button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    		<button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
  		</div>
	</script>
	<script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-xs" lay-event="add">添加</a>
		<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="edit">修改</a>
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>                   
<script>
	layui.use('table', function(){
	  var table = layui.table;
	  
	  table.render({
	    elem: '#test'  //指定原始 table 容器的选择器或 DOM，方法渲染方式必填
	    ,url:'<%=contextPath %>/findFuzeren'  //数据接口
	    ,toolbar: '#toolbarDemo'   //开启表格头部工具栏区域
	    ,title: '绿化负责人数据表'  //标题 
	    ,totalRow: true   //是否开启合计行区域
	    ,defaultToolbar: ['filter', 'print', 'exports']  //自由配置头部工具栏右侧的图标
	    ,cols: [[   //设置表头。值是一个二维数组。方法渲染方式必填
	      {type: 'checkbox', fixed: 'left'}
	      ,{field:'id', title:'编号', width:180, 
	    	  fixed: 'left', unresize: true, sort: true}
	      ,{field:'name', title:'负责人名称', width:180}
	      ,{field:'phone', title:'联系电话', width:180}
	      ,{field:'jobs', title:'职务', width:180}
	      ,{field:'scwxsj', title:'维护时间', width:180}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:180}
	    ]]
	    ,page: true //分页
	  });
	//头工具栏事件
	  table.on('toolbar(test)', function(obj){
	    var checkStatus = table.checkStatus(obj.config.id);
	    switch(obj.event){
	      case 'getCheckData':
	        var data = checkStatus.data;
	        layer.alert(JSON.stringify(data));
	      break;
	      case 'getCheckLength':
	        var data = checkStatus.data;
	        layer.msg('选中了：'+ data.length + ' 个');
	      break;
	      case 'isAll':
	        layer.msg(checkStatus.isAll ? '全选': '未全选')
	      break;
	    };
	  });
	  //监听行工具事件 
	  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'add'){  //添加数据
	    	//跳转到添加数据的页面 
	    	 window.location.href="<%=contextPath %>/luhua/addFuzeren.jsp";
	    	/* layer.open({
				  type: 2, 
				  title:'添加数据'   //标题 
				  ,area:['400px','500px']    //宽高
				  ,content:['addLuhua.jsp','no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
				});  */
	    } else if(obj.event === 'del'){  //删除数据
	    	layer.confirm('真的删除负责人\t' + data.name + "\t吗！", function (index) {
                //异步像服务器发送删除请求
                $.ajax({
                    url: '<%=contextPath %>/delFuzeren',
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
	    	//跳转到修改数据的页面 
	    	window.location.href='<%=contextPath %>/findByIdFuzeren?id='+data.id ;
	    	/* layer.open({
				  type: 2, 
				  title:'添加数据'   //标题 
				  ,area:['400px','550px']    //宽高
				  ,content:['${pageContext.request.contextPath}/findByIdGreenarea?id='+data.id,'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
				});  */
	     }
	  });
	});
</script>	
</body>
</html>