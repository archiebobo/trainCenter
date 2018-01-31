<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>
<script src="<%=basePath%>js/lib/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script language="javascript">
	
</script>
<style type="text/css">
html,body{
	height:100%;
	overflow:hidden;
}
</style>
</head>
<body onload="setContainerSize()">
<div id="struTopL">左上</div>
<div id="struTopR">右上</div>
<div id="struBottomL">左下</div>
<div id="struBottomR">右下</div>
<script type="text/javascript">
		function setContainerSize() {
			widthSize = window['innerWidth'] || document.documentElement.clientWidth; 
			widthSize = widthSize - 810; 
			heightSize = window['innerHeight'] || document.documentElement.clientHeight; 
			heightSize = heightSize - 320; 
			document.getElementById('struTopR').style.width = widthSize + "px";
			document.getElementById('struBottomR').style.width = widthSize + "px";
			document.getElementById('struBottomL').style.height = heightSize + "px";
			document.getElementById('struBottomR').style.height = heightSize + "px";
		}
		window.onresize = setContainerSize; 
		//动态改变div的高度和宽度
</script>
</body>
</html>
