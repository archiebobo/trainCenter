<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	window.location.href = "<%=basePath%>manager/manager-opertor/tOperator-add.jsp";
}
function update(id){
	window.location.href = "<%=basePath%>manager/manager-opertor/tOperator-update.jsp?id="+id;
}
function del(id){
	if(!confirm("确定要删除操作?")) return;
	var parms={};
	parms["tblOper.operid"] = id;
	$.getJSON("<%=basePath%>hos/tblOper_delete.action", parms, function(json){
		if(json.resultCode == '0'){
			alert('操作成功');
			window.location.reload();
		}else{
			alert("操作失败!");
		}
	});
}
<%-- function permi(id){
	window.location.href = "<%=basePath%>manager/manager-opertor/tOperator-permi.jsp?id="+id;
} --%>
</script>
</head>
<body>
<form action="<%=basePath%>hos/tblOper_query.action" id="form1" method="post">
<div class="searchTab">
  <table>
    <tr>
      <td>
      	 名称<input type="text" name="tblOper.name" id="name" value="${tblOper.name}"/>
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
        <td>序号</td>
        <td>性别</td>
        <td>名称</td>
        <td>电话</td>
        <td>地址</td>
        <td>邮编</td>
        <td>使用标志</td>
        <td>状态</td>
        <td>权限菜单</td>
        <td>角色</td>
        <td>备注</td>
        <td>操作</td>
      </tr>
    </thead>
    <s:iterator value="%{pm.list}" status="list">
    <tr>
    	<td>${operid }</td>
    	<td>
    	<c:choose>
    		<c:when test="${sex eq 1}">男</c:when>
    		<c:when test="${sex eq 2}">女</c:when>
    		<c:otherwise>&nbsp;</c:otherwise>
    	</c:choose>
    	</td>
      	<td>${name }</td>
      	<td>${tel }</td>
      	<td>${addr }</td>
      	<td>${zipno }</td>
      	<td>
      	<c:choose>
    		<c:when test="${used eq 1}">正常</c:when>
    		<c:when test="${used eq 2}">停用</c:when>
    		<c:otherwise>&nbsp;</c:otherwise>
    	</c:choose>
    	</td>
      	<td>
      	<c:choose>
    		<c:when test="${status eq 0}">未登陆</c:when>
    		<c:when test="${status eq 1}">已登陆</c:when>
    		<c:otherwise>&nbsp;</c:otherwise>
    	</c:choose>
    	</td>
    	<td>${menuids }</td>
    	<td>${rolename }</td>
    	<td>${filler }</td>
        <td>
           <!-- 
           <a  class="del" onclick="del('${roleid }')">删除</a>
           -->
           <a href="javascript:update('${operid}');" class="modi" title="点击修改信息">修改</a>
           <%-- <a href="javascript:permi('${operid}');" class="modi" title="点击修改信息">权限</a> --%>
        </td>
      </tr>
      </s:iterator>
      <s:if test="%{pm.list.size==0}">
		<tr>
			<td colspan="11"><font>暂时没有内容信息</font></td>
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
