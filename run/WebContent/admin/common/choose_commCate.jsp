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
<link rel="stylesheet" href="<%=basePath%>js/lib/jquery/zTree/css/demo.css" type="text/css"/>
<link rel="stylesheet" href="<%=basePath%>js/lib/jquery/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/zTree/js/jquery.ztree.core-3.3.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/zTree/js/jquery.ztree.excheck-3.3.js"></script>
<!--
<script type="text/javascript" src="../../../js/jquery.ztree.exedit-3.3.js"></script>
-->
<script type="text/javascript">
var setting = {
	check: {
		enable: true,
		chkStyle: "radio",
		radioType: "all"
	},
	data: {
		simpleData: {
			enable: true
		}
	}
};

var zNodes =[
	{ id:1, pId:0, name:"类别 1", open:true},
	{ id:11, pId:1, name:"类别 1-1", open:true},
	{ id:111, pId:11, name:"类别 1-1-1"},
	{ id:112, pId:11, name:"类别 1-1-2"},
	{ id:12, pId:1, name:"类别 1-2", open:true},
	{ id:121, pId:12, name:"类别 1-2-1"},
	{ id:122, pId:12, name:"类别 1-2-2"},
	{ id:2, pId:0, name:"类别 2", open:true},
	{ id:21, pId:2, name:"类别 2-1"}
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
</head>
<body>
	<div class="tabBtns">
		<span class="btn"><input type="button" onclick="closeWindow();" value="确定"/></span>
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</body>
</html>
