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
		enable: false,
		chkStyle: "checkbox",
	},
	view: {
		dblClickExpand: dblClickExpand ,
		selectedMulti: false
	},
	callback: {                 
		beforeDrag: false
	}
};
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
$(function (){
	loadData();
});
function loadData(){
	 //if(_id == '')return;
	 $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckBatchset_findBatch.action?ct='+new Date(),
			dataType:'json',
			success: function(json){
				if(json.resultCode=='0'){
					for(var i=0;i<json.list.length;i++){
						var obj = json.list[i];
						$("#batchno").append("<option value=" + obj.batchno + ">" + obj.batchname + "</option>");
					}
				}
			}
		});		
	}

//--------------------添加关联-----------------
function addRoleMenu(){
	/* if($("#roleid").val()==""){
		alert("请选择角色");
		return false;
	} */
	if($("#batchno").val()==null||$("#batchno").val()==""){
		alert("请选择批次！");
		return false;
	}
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var nodes_sel = treeObj.getSelectedNodes();
   if(nodes_sel.length==0){
		alert("请选择体检项目");
		return false;
   }
   var batchno = $("#batchno").val();
   /* var ary='';
   for(var i= 0 ; i < nodes.length ; i++){	
   	ary+=nodes[i].merchid+',';
   } */
   var b = false;
  /*  $("input[name=projidS]").each(function(){
   	if($(this).val()==nodes_sel[0].projid){
   		alert("已存在，无需添加");
   		b = true;
   		return;
   	}
   }) */
   if(b) return;
  if(nodes_sel[0].projtype=="0"){
	  alert("请关联末级项目！");
	  return ;
  }
   var parms = {};
   parms["tblCheckProjbatch.projid"]=nodes_sel[0].projid;
   parms["tblCheckProjbatch.batchno"]=batchno;
   //alert(nodes_sel[0].projid);
   //alert(batchno);
    $.ajax({
		type : 'POST',
		url: '<%=basePath%>hos/tblCheckProjbatch_insertbatch.action',
		data:parms,
		dataType : 'json',
		success : function(json) {
			if (json.resultCode == '0') {
				alert("操作成功");
				serch();
			} else {
				alert("操作失败:" + json.resultMsg);
			}
		}
	});	
}
function del(projid){
	var parms={};
	parms["tblCheckProjbatch.projid"] = projid;
	parms["tblCheckProjbatch.batchno"]=$("#batchno").val();
	$.getJSON("<%=basePath%>hos/tblCheckProjbatch_deleteBybatch.action", parms, function(json){
		if(json.resultCode == '0'){
			alert('操作成功');
			//$("#"+merchid).remove();
			serch();
		}else{
			alert("操作失败!");
		}
	});
}
function serch(){
	/* if($("#roleid").val()==""){
		alert("请选择角色");
		return false;
	} */
	if($("#batchno").val()==null||$("#batchno").val()==""){
		alert("请选择批次！");
		return false;
	}
	$("#tbody").empty();
	var batchno = $("#batchno").val();
	 $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckProjbatch_queryBybatchno.action?tblCheckProjbatch.batchno='+batchno,
			dataType:'json',
			success: function(json){
				if(json.resultCode=='0'){
					if(json.list.length==0){
						alert("该批次号未关联体检项目！");
					}else{
						var _tbody = "";
						for(var i=0;i<json.list.length;i++){
							var obj = json.list[i];
							var _tr ="<tr id="+obj.projid+">"+
											"<td>"+obj.projid+"<input type=\"hidden\" name=\"projidS\" value=\""+obj.projid+"\"/></td>"+
											"<td>"+obj.projname+"</td>"+
											"<td>  <a  class=\"del\" onclick=\"del("+obj.projid+")\">删除</a> </td>"+
										"</tr>";
							_tbody= _tbody+_tr
						}
						$("#tbody").append(_tbody);
					}
					
				}
			}
		});
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
<div class="content_wrap" style="width: 95%">
		<div class="left" style="margin-left: 10px;width: 20%">
			<ul id="treeDemo" class="ztree" style="width: 100%;height: 400px"></ul>
		</div>
		<div class="right" id="right" style="height: 100%;width: 75%">
			<form action="<%=basePath%>hos/tblCheckProjbatch_query.action" id="form1" method="post">
			<div class="searchTab" style="width: 100%;">
  <table>
    <tr>
      <td>
      	<%-- <select name="tRole.roleid" class="notNull_V"  id="roleid" onchange="changeOper()">
    		<option value="-1">-请选择-</option>
    	</select> --%>
    	批次<select name="tblCheckProjbatch.batchno" id="batchno" class="notNull_V" >
    		<option value="">-请选择-</option>
    	</select>
		<span class="btn"><input type="button" value="查询" onclick="serch()"/></span>
	 	<span class="btn"><input type="button" value="添加" onclick="addRoleMenu()"/></span>
	  </td>
    </tr>
  </table>
</div>
				<div class="listTab" style="width: 100%;">
					<table>
						<thead>
							<tr>
								<td>体检项目序号</td>
								<td>体检项目名称</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody id="tbody">
						
						</tbody>
					</table>
				</div>

			</form>
		</div>
		</div>
</body>
</html>
