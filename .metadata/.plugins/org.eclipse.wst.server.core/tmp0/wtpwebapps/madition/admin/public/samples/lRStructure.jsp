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
<style type="text/css">
html,body{
	height:100%;
	overflow:hidden;
}
</style>
</head>
<body>
<div class="struLeft">左</div>
<div class="struRight">右</div>
</body>
</html>
