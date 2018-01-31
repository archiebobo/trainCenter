<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String skin = (String)session.getAttribute("skin");
	
	if(skin == null){
		skin = "blue";
	}
	Cookie[] cookie = request.getCookies();
	if(cookie!=null&&cookie.length!=0)
	for (int i = 0; i < cookie.length; i++) {
		if ("skin".equals(cookie[i].getName())&&cookie[i].getValue()!=null) {
			skin = cookie[i].getValue();
		}
	}
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>style/<%=skin%>/css/sub.css"/>
<link rev="stylesheet" media="all" href="<%=basePath%>/js/loading/showLoading.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>/js/lib/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/loading/jquery.showLoading.js"></script>
<!-- 验证库 -->
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/lib/validation/css/livevalidation.css"/>
<script type="text/javascript" src="<%=basePath%>js/lib/validation/livevalidation.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validCommon.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/public.js"></script>
<!-- 表单post提交 -->
<script type="text/javascript" src="<%=basePath%>/js/lib/jquery/easyui/plugins/jquery.form.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/lib/My97DatePicker/WdatePicker.js"></script>	
