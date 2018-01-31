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
<link rel="stylesheet" href="<%=basePath%>js/lib/jquery/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/zTree/js/jquery.ztree.core-3.3.js"></script>
<script type="text/javascript">
var setting = {	};

var zNodes =[
	{ name:"部门1", open:true,
		children: [
			{ name:"部门11",
				children: [
					{ name:"部门111"},
					{ name:"部门112"},
					{ name:"部门113"},
					{ name:"部门114"}
				]},
			{ name:"部门12",
				children: [
					{ name:"部门121"},
					{ name:"部门122"},
					{ name:"部门123"},
					{ name:"部门124"}
				]},
			{ name:"部门13", isParent:true}
		]},
	{ name:"部门2",
		children: [
			{ name:"部门21", open:true,
				children: [
					{ name:"部门211"},
					{ name:"部门212"},
					{ name:"部门213"},
					{ name:"部门214"}
				]},
			{ name:"部门22",
				children: [
					{ name:"部门221"},
					{ name:"部门222"},
					{ name:"部门223"},
					{ name:"部门224"}
				]},
			{ name:"部门23",
				children: [
					{ name:"部门231"},
					{ name:"部门232"},
					{ name:"部门233"},
					{ name:"部门234"}
				]}
		]}
];

$(document).ready(function(){
	$.fn.zTree.init($("#treeDemo"), setting, zNodes);
});

/**
 * 关闭弹出窗口
 */
function closeWindow(){
	window.parent.$('#popupWin').window('close');
}	
</script>
<style type="text/css">
html,body{
	height:100%; overflow:hidden;
}
ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #f0f6e4;width:220px;height:280px;overflow-y:scroll;overflow-x:auto;}
</style>
</head>
<body>
	<div class="struLeft">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div class="struRight" style="width:500px;">
		<div class="searchTab">
			<table>
				<tr align="left">
					<th>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</th>
					<td>
						<input type="text" size="20"/>
					</td>
					<th>所在部门</th>
					<td>
						<input type="text" size="20"/>
					</td>
					
				</tr>
				<tr>
					<th></th>
					<td colspan="3">
						<span class="btn"><input type="button" value="查询"/></span>
						<span class="btn"><input type="button" value="确定" onclick="closeWindow();"/></span>
					</td>
				</tr>
			</table>
		</div>
		<div class="listTab">
			<table>
				<thead>
					<tr>
						<td>选择</td>
						<td>姓名</td>
						<td>所在部门</td>
					</tr>
				</thead>
				<tbody>
					<tr ondblclick="closeWindow();">
						<td><input type="radio" name="cfs"/></td>
						<td>
							刘洋
						</td>
						<td class="tdLeft">销售部</td>
					</tr>
					<tr ondblclick="closeWindow();">
						<td><input type="radio"  name="cfs"/></td>
						<td>
							王榕
						</td>
						<td class="tdLeft">软件部</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
