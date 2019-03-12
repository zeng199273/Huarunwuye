<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>绿化表格信息</title>
<link rel="stylesheet" href="<%=contextPath %>/layui-v2.4.5/layui/css/layui.css"  media="all">
<script src="<%=contextPath %>/layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script src="<%=contextPath %>/js/jquery-2.1.1.js"></script> 
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	    <legend style="text-align: center">绿化表格界面</legend>
	</fieldset>	   
	<table id="test" lay-filter="test"></table>
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
	    elem: '#test'
	    ,url:'<%=contextPath %>/findAll'  //数据接口
	    ,toolbar: '#toolbarDemo'
	    ,title: '绿化数据表'
	    ,totalRow: true
	    ,defaultToolbar: ['filter', 'print', 'exports']
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'}
	      ,{field:'id', title:'ID', width:140, 
	    	  fixed: 'left', unresize: true, sort: true}
	      ,{field:'name', title:'绿化名称', width:140}
	      ,{field:'price', title:'绿化价格', width:140}
	      ,{field:'areas', title:'绿化面积(亩)', width:140}
	      ,{field:'vegetation', title:'绿化植被', width:150}
	      ,{field:'imgURL', title:'链接图片', width:120,templet:'<div><img src="{{d.imgURL}}"></div>'}
	      ,{field:'plantingDate', title:'种植时间', width:150}
	      ,{field:'fuzerenId', title:'负责人ID', width:140}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:160}
	    ]]
	    ,page: true
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
	    	 window.location.href="<%=contextPath %>/luhua/addLuhua.jsp";
	    	/* layer.open({
				  type: 2, 
				  title:'添加数据'   //标题 
				  ,area:['400px','500px']    //宽高
				  ,content:['addLuhua.jsp','no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
				});  */
	    } else if(obj.event === 'del'){  //删除数据
	    	//执行ajax请求
	    	$.ajax({
	    		url:'<%=contextPath %>/delGreenarea?id='+data.id,
	    		method:'GET',
	    		dataType:'text',
	    		success:function(data){  
	    			layer.msg(data);
	    			obj.del();   //删除对应行（tr）的DOM结构，并更新缓存
	    		}
	    	});
	    } else if(obj.event === 'edit'){  //修改数据
	    	//跳转到修改数据的页面 
	    	window.location.href='<%=contextPath %>/findByIdGreenarea?id='+data.id ;
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