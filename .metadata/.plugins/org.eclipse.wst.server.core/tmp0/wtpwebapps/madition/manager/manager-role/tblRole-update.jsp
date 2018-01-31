<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>
<script language="javascript">
var _id = "${param.id}";
$(function (){
	loadData();
});
function loadData(){
 if(_id == '')return;
 $.ajax({
		type : 'POST',
		url: '<%=basePath%>hos/tblRole_queryByRoleid.action?tblRole.roleid='+_id,
		dataType:'json',
		success: function(json){
			$("#roleid").val(json.data.roleid);
			$("#rolename").val(json.data.rolename);
			$("#remark").val(json.data.remark);
			
		}
	});		
}
//--------------------更新-----------------
function save(){
if(!validData()){
return;
}else{
var parms={};
parms["tblRole.roleid"] = $("#roleid").val();
parms["tblRole.rolename"] = $("#rolename").val();
parms["tblRole.remark"] = $("#remark").val();
$.ajax({
	   type: "post",
	   url: '<%=basePath%>score/tblRole_update.action',
	   data: parms,
	   beforeSend:function(){
		   $('body').showLoading({'addClass': 'loading-indicator'});
	   },
	   complete:function(){
		   $('body').hideLoading();
	   },
	   success: function(msg){
		   if(msg.resultCode == "0"){
			   alert("操作成功");
		   }else{
		   		alert("操作失败:"+msg.resultMsg);
		   }
	   }
	});
}
}
//返回列表
function tolist(){
	window.location.href = "<%=basePath%>hos/tblRole_query.action";
	}
</script>
</head>
<body>
	<div class="title">修改</div>
	<form action="<%=basePath%>hos/tblRole_update.action" id="form"
		method="post" onsubmit="return validData()">
		<div class="editorTab">
			<table>
				<tbody>
					<tr>
						<th><font>*</font>角色ID</th>
						<td><input type="text" name="tblRole.roleid" id="roleid"
							value="${tblRole.roleid}" readonly="readonly" /></td>
					</tr>
					<tr>
						<th><font>*</font>角色名称</th>
						<td><input type="text" name="tblRole.rolename"
							id="rolename" value="${tblRole.rolename}" class="notNull_V" />
						</td>
					</tr>
					<tr>
						<th>备注说明</th>
						<td><input name="tblRole.remark"
							value="${tblRole.remark}" id="remark" maxlength="100" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btns">
			<span class="btn"><input type="submit" value="提交" /></span> 
			<span class="btn"><input type="button" value="返回" onclick="tolist();" /></span>
		</div>
	</form>
</body>
</html>
