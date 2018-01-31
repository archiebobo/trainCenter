<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>
<script language="javascript">
	
</script>
</head>
<body>
	<div class="msgBan">
		<dl>
			<dt>无权限访问</dt>
			<dd>你没有权限访问</dd>
			<dd>
				<span class="btn"><input type="button" class="button" value="返回" onclick="history.back()" /></span>
			</dd>
		</dl>
	</div>
</body>
</html>
