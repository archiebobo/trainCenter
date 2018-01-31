<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>选择商品类别</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/lib/jquery/zTree/css/demo.css"/>
<link rel="stylesheet" href="<%=basePath%>js/lib/jquery/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/zTree/js/jquery.ztree.core-3.3.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/zTree/js/jquery.ztree.excheck-3.3.js"></script>
<script type="text/javascript">
var theOpener = window.top.dialogArguments;
function changeOrgan(cc_id, cc_name){
	theOpener.callback(cc_id, cc_name);
	window.close();
}

var setting = {
	data: {
		key: {	
				title:"cc_name",
				name:"cc_name"
				},
				simpleData: {
					enable: true,
					idKey: "cc_id",
					pIdKey: "parent_id"				
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
		onClick: onClick
	}
};

$(function(){
	var params = {
		ct: (new Date()).getTime()
	};
	$.getJSON("<%=basePath%>bss/basicdata/cate_categoryListJSON.action", params, function(json){
		if(json.resultCode == 'success'){
			if(json.list.length > 0){
				json.list[0].open = true;
				json.list[0].nocheck = true;
			}
			$.fn.zTree.init($("#treeDemo"), setting, json.list);
		}else{
			alert("加载商品类别信息失败!");
		}
	});
});

function dblClickExpand(treeId, treeNode) {
	return treeNode.o_level > 0;
}

function onClick(event, treeId, treeNode,clickFlag) {
	if(treeNode.id == 0){
		return;
	}
	changeOrgan(treeNode.cc_id, treeNode.cc_name);
}
</script>
<style type="text/css">
.ztree li ul.level0 {padding:0; background:none;}
</style>
</head>
<body>
		<div class="left" style="margin-left: 10px;">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
</body>
</html>
