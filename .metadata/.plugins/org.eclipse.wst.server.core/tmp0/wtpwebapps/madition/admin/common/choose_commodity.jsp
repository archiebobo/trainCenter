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
				<th>商品名称</th>
				<td>
					<input type="text" size="20"/>
				</td>
				<th></th>
				<td>
					<span class="btn"><input type="button" value="查询"/></span>
				</td>
			</tr>
		</table>
	</div>
	<div class="tabBtns">
		<font>通过双击商品行，以选中商品</font>
	</div>
	<div class="listTab">
		<table>
			<thead>
				<tr>
					<td>商品名称</td>
					<td>商品类别</td>
				</tr>
			</thead>
			<tbody>
				<tr ondblclick="closeWindow();">
					<td class="tdLeft">
						康柏CQ40
					</td>
					<td>CQ系列</td>
				</tr>
				<tr ondblclick="closeWindow();">
					<td class="tdLeft">
						华硕X43E
					</td>
					<td>X系列</td>
				</tr>
			</tbody>
		</table>
	</div>
	<jsp:include page="/admin/common/pagemodel.jsp"></jsp:include>
</body>
</html>
