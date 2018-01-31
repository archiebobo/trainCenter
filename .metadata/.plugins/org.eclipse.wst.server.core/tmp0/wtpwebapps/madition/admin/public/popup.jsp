<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<link rel="Shortcut Icon" href="<%=basePath%>style/jx.ico" type="image/x-icon" />-->
<title>欢迎登录lenovo联想乡镇开发商规范管理平台</title>
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>
<jsp:include page="/admin/common/css/style_easyui.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(function(){
	
});

function openWindow(){
	$('#win').window({  
	    width:600,  
	    height:400,  
	    modal:true,
	    content: '<iframe id="innerWin" frameborder="0" name="content" width="100%" height="100%" scrolling="auto" src="infoTips.jsp"></iframe>'
	});
}

function closeWindow(){
	$('#win').window('close');
}


</script>
</head>
<body>
	<a href="javascript:void(0)" class="link-button" onclick="openWindow();">打开弹出窗口</a>
	
	<div id="win"></div>
</body>
</html>