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
	findRole();
	//loadData();
	
});
function findRole(){
	 $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblRole_findAll.action',
			dataType:'json',
			success: function(json){
				if(json.resultCode=='0'){
					for(var i=0;i<json.list.length;i++){
						$("#roleid").append(" <option  value='"+json.list[i].roleid+"'>"+json.list[i].rolename+"</option>");
					}
				}
				$.ajax({
					type : 'POST',
					url: '<%=basePath%>hos/tblOper_findById.action?tblOper.operid='+_id,
					dataType:'json',
					success: function(json){
						$("#operid").val(json.data.operid);
						$("#name").val(json.data.name);
						$("#sex").val(json.data.sex);
						$("#passwd").val(json.data.passwd);
						$("#passwd1").val(json.data.passwd);
						$("#status").val(json.data.status);
						$("#menuids").val(json.data.menuids);
						$("#zipno").val(json.data.zipno);
						$("#used").val(json.data.used);
						$("#menuids").val(json.data.menuids);
						$("#filler").val(json.data.filler);
						$("#roleid").val(json.data.roleid);
						$("#tel").val(json.data.tel);
						
					}
				});	
				
			}
		});	
}
<%-- function loadData(){
 if(_id == '')return;
 $.ajax({
		type : 'POST',
		url: '<%=basePath%>hos/tblOper_findById.action?tblOper.operid='+_id,
		dataType:'json',
		success: function(json){
			$("#operid").val(json.data.operid);
			$("#name").val(json.data.name);
			$("#sex").val(json.data.sex);
			$("#passwd").val(json.data.passwd);
			$("#passwd1").val(json.data.passwd);
			$("#status").val(json.data.status);
			$("#menuids").val(json.data.menuids);
			$("#zipno").val(json.data.zipno);
			$("#used").val(json.data.used);
			$("#menuids").val(json.data.menuids);
			$("#filler").val(json.data.filler);
			$("#roleid").val(json.data.roleid);
			$("#tel").val(json.data.tel);
			
		}
	});		
} --%>
//--------------------更新-----------------
function save(){
if(!validData()){
return;
}else{
var parms={};
if($("#passwd").val()!=$("#passwd1").val()){
	parms["tblOper.passwd"] = $("#passwd").val();
}else{
	parms["passwd1"] = $("#passwd1").val();
}
parms["tblOper.operid"] = $("#operid").val();
parms["tblOper.name"] = $("#name").val();
parms["tblOper.sex"] = $("#sex").val();
parms["tblOper.status"] = $("#status").val();
parms["tblOper.menuids"] = $("#menuids").val();
parms["tblOper.zipno"] = $("#zipno").val();
parms["tblOper.used"] = $("#used").val();
parms["tblOper.menuids"] = $("#menuids").val();
parms["tblOper.filler"] = $("#filler").val();
parms["tblOper.tel"] = $("#tel").val();
parms["tblOper.roleid"] = $("#roleid").val();
$.ajax({
	   type: "post",
	   url: '<%=basePath%>hos/tblOper_updateById.action',
	   data: parms,
	   beforeSend:function(){
		   $('body').showLoading({'addClass': 'loading-indicator'});
	   },
	   complete:function(){
		   $('body').hideLoading();
	   },
	   success: function(json){
		   if(json.resultCode == "0"){
			   alert("操作成功");
		   }else{
		   		alert("操作失败:"+json.resultMsg);
		   }
	   }
	});
}
}
//返回列表
function tolist(){
	window.location.href = "<%=basePath%>hos/tblOper_query.action";
	}//
</script>
</head>
<body>
	<div class="title">修改</div>
	<form action="<%=basePath%>hos/tblOper_update.action" id="form"
		method="post" onsubmit="return validData()">
		<div class="editorTab">
			<table>
				<tbody>
					<tr>
					<th><font>*</font>序号</th>
					<td>
						<input type="text" name="tblOper.operid" id="operid" value="${tblOper.operid}" class="notNull_V"/>
					</td>
				</tr>
				<tr>
					<th><font>*</font>登陆账号</th>
					<td>
						<input type="text" name="tblOper.name" id="name" value="${tblOper.name}" class="notNull_V"/>
					</td>
				</tr>
				<tr>
					<th>状态</th>
					<td>
						<select name="tblOper.sex" id="sex">
							<option value="1">男</option>
							<option value="2">女</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><font>*</font>电话</th>
					<td>
						<input type="text" name="tblOper.tel" id="tel" value="${tblOper.tel}" class="notNull_V"/>
					</td>
				</tr>
				<tr>
					<th><font>*</font>密码</th>
					<td>
						<input type="password" name="tblOper.passwd" id="passwd" value="${tblOper.passwd}" class="notNull_V"/>
						<input type="hidden" name="" id="passwd1" value="" class="notNull_V" />
					</td>
				</tr>
				<tr>
					<th>地址</th>
					<td>
						<input type="text" name="tblOper.menuids" id="menuids" value="${tblOper.menuids}" class="notNull_V"/>
					</td>
				</tr>
				<tr>
					<th>邮编</th>
					<td>
						<input type="text" name="tblOper.zipno" id="zipno" value="${tblOper.zipno}" class="notNull_V"/>
					</td>
				</tr>
				<tr>
					<th>权限菜单</th>
					<td>
						<input type="text" name="tblOper.menuids" id="menuids" value="1,11," class="notNull_V"/>
					</td>
				</tr>
				<tr>
					<th><font>*</font>角色</th>
					<td>
						<select  name="tblOper.roleid"  id="roleid" class="notNull_V">
							<option value="">--请选择--</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>备注说明</th>
					<td>
						<input name="tblOper.filler" value="${tblOper.filler}" id="filler" class="notNull_V"/>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
		<div class="btns">
			<span class="btn"><input type="button" value="提交" onclick="save();"/></span> 
			<span class="btn"><input type="button" value="返回" onclick="tolist();" /></span>
		</div>
	</form>
</body>
</html>
