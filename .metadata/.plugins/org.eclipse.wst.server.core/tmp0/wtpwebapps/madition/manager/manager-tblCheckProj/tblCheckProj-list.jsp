<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/lib/jquery/zTree/css/demo.css"/>
<link rel="stylesheet" href="<%=basePath%>js/lib/jquery/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>

<script type="text/javascript" src="<%=basePath%>js/lib/jquery/zTree/js/jquery.ztree.core-3.3.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/zTree/js/jquery.ztree.excheck-3.3.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/zTree/js/jquery.ztree.exedit-3.3.js"></script>
<script type="text/javascript">
var zTree, rMenu,setRemoveBtn,setRenameBtn,BeforeRemove,BeforeRename;
var _treeNode;
var _id = "${param.id}";
//部门树配置
var setting = {
	data: {
		key: {
			title: 'projname',
			name: 'projname'
		},
		simpleData: {
			enable: true,
			idKey: 'projid',
			pIdKey: 'fprojid'				
		}
	},
	check: {
		enable: false
	},
	view: {
		dblClickExpand: dblClickExpand ,
		selectedMulti: false
	},
	callback: {                 
		beforeDrag: false,
		onClick: onClick,
		onRightClick: zTreeOnRightClick
	}
};

function zTreeOnRightClick(event, treeId, treeNode) {
	_treeNode = treeNode;
    if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
		zTree.cancelSelectedNode();
		showRMenu("root", event.clientX, event.clientY);
	} else if (treeNode && !treeNode.noR) {
		zTree.selectNode(treeNode);
		showRMenu("node", event.clientX, event.clientY);
	}
};
function showRMenu(type, x, y) {
	$("#rMenu ul").show();
	$("#m_add").show();
	$("#m_update").show();
	if (_treeNode.projtype=="0") {
		$("#m_add").show();
		$("#m_update").show();
	} else {
		$("#m_add").hide();
		$("#m_update").show();
	}
	rMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});

	$("body").bind("mousedown", onBodyMouseDown);
}
function hideRMenu() {
	if (rMenu) rMenu.css({"visibility": "hidden"});
	$("body").unbind("mousedown", onBodyMouseDown);
}
function onBodyMouseDown(event){
	if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
		rMenu.css({"visibility" : "hidden"});
	}
}
$(function(){
	var params = {
		ct: (new Date()).getTime()
	};
	$.getJSON("<%=basePath%>hos/tblCheckProj_findProject.action", params, function(json){
		if(json.resultCode == '0'){
			if(json.list.length > 0){
				json.list[0].open = true;
				json.list[0].nocheck = true;
			}
			zTree = $.fn.zTree.init($("#treeDemo"), setting, json.list);
			rMenu = $("#rMenu");
		}else{
			alert("加载信息失败!");
		}
	});
});

function dblClickExpand(treeId, treeNode) {
	return treeNode.level_no > 0;
}

function onClick(event, treeId, treeNode,clickFlag) {
	var _treeNode = treeNode;
	if(treeNode.merchid == 0){
		return;
	}
	showDetail(treeNode.projid, treeNode.projname);
}
//------
function showDetail(nodeid,nodename){
	$("#rightpage").attr("src","<%=basePath%>manager/manager-tblCheckProj/tblCheckProj-list-index.jsp?id="+nodeid+"&action=view");
}
//------添加结点---
function addTreeNode(){
	var _url= "<%=basePath%>manager/manager-tblCheckProj/tblCheckProj-list-index.jsp?id="+_treeNode.projid+"&action=add&projname="+_treeNode.projname;
	$("#rightpage").attr("src",encodeURI(_url));
	rMenu.css({"visibility" : "hidden"});
}
//---------更新结点---
function updateTreeNode(){
	$("#rightpage").attr("src","<%=basePath%>manager/manager-tblCheckProj/tblCheckProj-list-index.jsp?id="+_treeNode.projid+"&action=update");
	rMenu.css({"visibility" : "hidden"});
}
</script>
<style type="text/css">
div.left{float: left;width: 250px;}
div#rMenu {position:absolute; visibility:hidden; top:0; background-color: #555;text-align: left;padding: 2px;}
div#rMenu ul li{
	margin: 1px 0;
	padding: 0 5px;
	cursor: pointer;
	list-style: none outside none;
	background-color: #DFDFDF;
}
</style>
</head>
<body>
		<div class="left" style="margin-left: 10px;width: 20%;height: 400px">
			<ul id="treeDemo" class="ztree" style="height: 100%;width: 90%"></ul>
		</div>
		<div id="right1">
			<iframe name="rightpage" id="rightpage" width="70%" height=550 border="0" frameborder="0" src=""  allowTransparency="true"></iframe> 
		</div>
<div id="rMenu">
	<ul>
		<li id="m_add" onclick="addTreeNode();">增加子节点</li>
		<li id="m_update" onclick="updateTreeNode();">修改节点</li>
	</ul>
</div>
</body>
</html>
