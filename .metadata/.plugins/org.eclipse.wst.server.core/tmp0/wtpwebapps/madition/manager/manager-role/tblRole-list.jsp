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
function add(){
	window.location.href = "<%=basePath%>manager/manager-role/tblRole-add.jsp";
}
function update(id){
	window.location.href = "<%=basePath%>manager/manager-role/tblRole-update.jsp?id="+id;
}
function del(id){
	var parms={};
	parms["tblRole.roleid"] = id;
	$.getJSON("<%=basePath%>hos/tblRole_delete.action", parms, function(json){
		if(json.resultCode == '0'){
			alert('操作成功');
			window.location.reload();
		}else{
			alert("操作失败!");
		}
	});
}
function permi(id){
	window.location.href = "<%=basePath%>manager/manager-role/tblRole-permi.jsp?id="+id;
}
</script>
</head>
<body>
<form action="<%=basePath%>hos/tblRole_query.action" id="form1" method="post">
<div class="searchTab">
  <table>
    <tr>
      <th>角色名</th>
      <td><input type="text" name="tblRole.rolename" id="rolename" value="${tblRole.rolename}"/>
		<span class="btn"><input type="submit" value="查询"/></span>
	 	<span class="btn"><input type="button" value="添加" onclick="add()"/></span>
	  </td>
    </tr>
  </table>
</div>
<!--查询条件表格-->

<div class="listTab">
  <table>
    <thead>
      <tr>
        <td>角色ID</td>
        <td>角色名称</td>
        <td>备注</td>
        <td>操作</td>
      </tr>
    </thead>
    <s:iterator value="%{pm.list}" status="list">
    <tr>
    	<td>${roleid }</td>
      	<td>${rolename }</td>
      	<td>${remark }</td>
        <td>
        <!-- 
           <a  class="del" onclick="del('${roleid }')">删除</a>
           -->
           <a href="javascript:update('${roleid}');" class="modi" title="点击修改信息">修改</a>
           <a  class="del" onclick="permi('${roleid }')">权限</a>
        </td>
      </tr>
      </s:iterator>
      <s:if test="%{pm.list.size==0}">
		<tr>
			<td colspan="7"><font>暂时没有内容信息</font></td>
		</tr>
	 </s:if>
  </table>
</div>

<s:if test="%{pm!=null}">
<!--查询列表格（点击行查看详细信息，并有查看详细信息提示，及行信息鼠标成手型）-->
<jsp:include page="/admin/common/pagemodel.jsp"></jsp:include>
</s:if>
</form>
</body>
</html>
