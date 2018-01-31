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
<script language="javascript">

/**
 * 关闭弹出窗口
 */
function closeWindow(){
	window.parent.$('#popupWin').window('close');
}	
</script>
</head>
<body>
	<div class="searchTab">
		<table>
			<tr align="left">
				<th>商家名称</th>
				<td>
					<input type="text" size="20"/>
				</td>
				<th>联&nbsp;&nbsp;系&nbsp;&nbsp;人</th>
				<td>
					<input type="text" size="20"/>
				</td>
				<td>
					<span class="btn"><input type="button" value="查询"/></span>
				</td>
			</tr>
		</table>
	</div>
	<div class="tabBtns">
		<font>通过双击数据行，以选中供货商</font>
	</div>
	<div class="listTab">
		<table>
			<thead>
				<tr>
					<td>商家名称</td>
					<td>联系人</td>
					<td>联系电话</td>
				</tr>
			</thead>
			<tbody>
				<tr ondblclick="closeWindow();">
					<td class="tdLeft">重庆竺月科技有限公司</td>
					<td>何伟</td>
					<td>15215095311 </td>
				</tr>
				<tr ondblclick="closeWindow();">
					<td class="tdLeft">重庆九红科技公司</td>
					<td>张明</td>
					<td>15215095311</td>
				</tr>
				<tr ondblclick="closeWindow();">
					<td class="tdLeft">重庆欧翔科技</td>
					<td>邓晓霞 </td>
					<td>15215095311 </td>
				</tr>
			</tbody>
		</table>
	</div>
	<jsp:include page="/admin/common/pagemodel.jsp"></jsp:include>
</body>
</html>
