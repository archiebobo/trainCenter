<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 String contextPath = request.getContextPath();
%>

<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache"> 
<META HTTP-EQUIV="Expires" CONTENT="0"> 
<META http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- base jquery -->
<link rev="stylesheet" media="all" href="${pageContext.request.contextPath}/js/loading/showLoading.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/loading/jquery.showLoading.js"></script>
<script src="<%=contextPath%>js/lib/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	
<script type="text/javascript">
var rootPath = "${pageContext.request.contextPath}";
</script>
