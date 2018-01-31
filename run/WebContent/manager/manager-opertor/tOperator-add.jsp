<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
$(function (){
	loadData();
});
function loadData(){
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
				
			}
		});	
}

//返回列表
function tolist(){
	window.location.href = "<%=basePath%>hos/tblOper_query.action";
}
</script>
</head>
<body>
	<div class="title">新增</div>
	<form action="<%=basePath%>hos/tblOper_insert.action" id="form" method="post" onsubmit="return validData()">
	<div class="editorTab">
		<table>
			<tbody>
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
					</td>
				</tr>
				<tr>
					<th><font>*</font>地址</th>
					<td>
						<input type="text" name="tblOper.addr" id="addr" value="${tblOper.addr}" class="notNull_V"/>
					</td>
				</tr>
				<tr>
					<th><font>*</font>邮编</th>
					<td>
						<input type="text" name="tblOper.zipno" id="zipno" value="${tblOper.zipno}" class="notNull_V"/>
					</td>
				</tr>
				<tr>
					<th><font>*</font>权限菜单</th>
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
					<th><font>*</font>备注说明</th>
					<td>
						<input name="tblOper.filler" value="${tblOper.filler}" id="filler" class="notNull_V"/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btns">
		<span class="btn"><input type="submit" value="提交"/></span>
		<span class="btn"><input type="button" value="返回" onclick="tolist();"/></span>
	</div>
	</form>
</body>
</html>
