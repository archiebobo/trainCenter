<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
	<div class="msgFalse" >
		<dl>
		    <dt>操作失败</dt>
		    <dd>
		    	<s:if test="%{message == null || message.length() == 0}">
		    		系统出现错误，请联系管理员！	
		    	</s:if>
		    	<s:else>
		    		${message}
		    	</s:else>
		    </dd>
		    <dd><span class="btn"><input type="button" class="button" value="返回" onclick="javascript:goback();" /></span></dd>
		    <s:if test="%{backUrl == null || backUrl.length() == 0}">
				<script type="text/javascript">
					function goback(){
						history.back();
					}
				</script>
			</s:if>
			<s:else>
				<script type="text/javascript">
					function goback(){
						window.location.href = '<%=basePath%>${backUrl}';
					}
				</script>
			</s:else>
		</dl>
	</div>
</body>
</html>
