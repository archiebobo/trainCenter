<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>
<script language="javascript">
//返回列表
function tolist(){
	window.location.href = "<%=basePath%>hos/tblRole_query.action";
}
</script>
</head>
<body>
	<div class="title">新增</div>
	<form action="<%=basePath%>hos/tblRole_insert.action" id="form" method="post" onsubmit="return validData()">
	<div class="editorTab">
		<table>
			<tbody>
				<tr>
					<th><font>*</font>角色名称</th>
					<td>
						<input type="text" name="tblRole.rolename" id="opername" value="${tblRole.rolename}" class="notNull_V"/>
					</td>
				</tr>
				<tr>
					<th>备注说明</th>
					<td>
						<input name="tblRole.remark" value="${tblRole.remark}" id="remark"/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btns">
		<span class="btn"><input type="submit" value="提交"/></span>
		<span class="btn"><input type="button" value="返回" onclick="tolist();"/></span>
	</div>
	</form>
</body>
</html>
