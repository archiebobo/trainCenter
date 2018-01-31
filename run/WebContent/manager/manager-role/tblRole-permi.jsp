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

var _id = "${param.id}";
//部门树配置
var setting = {
	data: {
		key: {
			title: 'name',
			name: 'name'
		},
		simpleData: {
			enable: true,
			idKey: 'menuid',
			pIdKey: 'fatherid'				
		}
	},
	check: {
		enable: true,
		chkStyle: "checkbox"
	},
	view: { 
		selectedMulti: false
	},
	callback: {                 
		beforeDrag: false
	}
};

$(function (){
	loadData();
	initTree();
});
function initTree(){
	//加载初始化组织部门树
	var params = {
		ct: (new Date()).getTime()
	};
	params["roleID"] = _id;
	$.getJSON("<%=basePath%>hos/tblMenu_findAllMenuByRoleID.action", params, function(json){
		if(json.resultCode == '0'){
			if(json.list.length > 0){
				for(var i=0;i<json.list.length;i++){
					json.list[i].open = true;
					if(json.list[i].isChecked=='2'){
						json.list[i].checked = true;
					}
				}
			}
			$.fn.zTree.init($("#treeDemo"), setting, json.list);
		}else{
			alert("加载组织信息失败!");
		}
	});
	
	//初始化验证规则
	//checkAll();
}

function loadData(){
 if(_id == '')return;
 $.ajax({
		type : 'POST',
		url: '<%=basePath%>hos/tblRole_queryByRoleid.action?tblRole.roleid='+_id,
		dataType:'json',
		success: function(json){
			$("#rolename").html(json.data.rolename);
			$("#remark").html(json.data.remark);
			
		}
	});		
}

//--------------------添加关联-----------------
function addRoleMenu(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var nodes = treeObj.getCheckedNodes(true);
    if(nodes.length==0){
		alert("请选择权限");
		return false;
    }
    var ary='';
    for(var i= 0 ; i < nodes.length ; i++){	
    	ary+=nodes[i].menuid+',';
    }
     var parms = {};
     parms["tblRole.roleid"]=_id;
     parms["tblRole.permis"]=ary;
     $.ajax({
 		type : 'POST',
 		url: '<%=basePath%>hos/tblRole_addMenuRole.action',
 		data:parms,
 		dataType:'json',
 		success: function(json){
 			if(json.resultCode=='0'){
 				alert("操作成功");
 			}else{
 				alert("操作失败:"+json.resultMsg);
 			}
 		}
 	});		
       	 	//window.location="admin/roleMenu_addMenuRole.action?roleId="+<s:property  value='roleId'/>+"&menuArray="+ary;
}

</script>
<style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
.ztree li span.button.switch.level0 {visibility:hidden; width:1px;}
.ztree li ul.level0 {padding:0; background:none;}
</style>
</head>
<body>
	<div class="content_wrap">
		<div class="left">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		 
		<div class="right" id="right" >
			<form action="<%=basePath%>score/tblRole_queryByRoleid.action" id="form" method="post">
				<div class="title">角色信息</div>
				<div class="editorTab" style="width: 500px;">
					<table>
						<tbody>
							
					<tr>
						<th><font>*</font>角色名称</th>
						<td><span id="rolename"></span> </td>
					</tr>
					<tr>
						<th>详细描述</th>
						<td><span id="remark"></span> </td>
					</tr>
							<tr>
								<td colspan="2" align="center">
									<span class="btn"><input type="button" value="提交" onclick="addRoleMenu()"/></span>
									<span class="btn"><input type="button" value="返回" onclick="javascript:history.go(-1)"/></span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
		
	</div>
</body>
</html>
