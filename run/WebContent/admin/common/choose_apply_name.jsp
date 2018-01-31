<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>选择服务单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>

<script language="javascript">

</script>
<style type="text/css">
	html,body{height:100%;}
	div.content_wrap {width:100%;height:100%;}
	div.content_wrap div.right{float: right;width: 100%; height: 100%}
</style>
</head>
<body>
	<div class="content_wrap">
		<div class="right">
			<iframe scrolling="auto" id="frame" frameborder="0" style="width:100%; height:100%;" src="<%=basePath%>ser/apply/apply_selApplyNum.action"></iframe>
		</div>
	</div>
</body>
</html>
