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
	window.location.href = "<%=basePath%>manager/manager-tblCheckCustomer/tblCheckCustomer-add.jsp";
}
function update(id){
	window.location.href = "<%=basePath%>manager/manager-tblCheckCustomer/tblCheckCustomer-update.jsp?id="+id;
}
function del(id){
	var parms={};
	parms["tblCheckCustomer.batchno"] = id;
	$.getJSON("<%=basePath%>hos/tblCheckCustomer_delete.action", parms, function(json){
		if(json.resultCode == '0'){
			alert('操作成功');
			window.location.reload();
		}else{
			alert("操作失败!");
		}
	});
}
</script>
</head>
<body>
<form action="<%=basePath%>hos/tblCheckCustomer_query.action" id="form1" method="post">
<div class="searchTab">
  <table>
    <tr>
      <th>姓名</th>
      <td><input type="text" name="tblCheckCustomer.custname" id="custname" value="${tblCheckCustomer.custname}"/>
                   学工号<input type="text" name="tblCheckCustomer.stuempno" id="stuempno" value="${tblCheckCustomer.stuempno}"/>
                   学院<input type="text" name="tblCheckCustomer.unit" id="unit" value="${tblCheckCustomer.unit}"/>
		<span class="btn"><input type="submit" value="查询"/></span>
	  </td>
    </tr>
  </table>
</div>
<!--查询条件表格-->

<div class="listTab">
  <table>
    <thead>
      <tr>
        <td>人员ID</td>
        <td>姓名</td>
        <td>校区</td>
        <td>学院</td>
        <td>专业</td>
        <td>学工号</td>
        <td>状态</td>
        <td>证件号码</td>
        <td>性别</td>
        <td>国家</td>
        <td>民族</td>
        <td>email</td>
        <td>电话或手机号</td>
        <td>出生日期</td>
        <td>入学日期</td>
        <td>备注</td>
      </tr>
    </thead>
    <s:iterator value="%{pm.list}" status="list">
    <tr>
    	<td>${custid }</td>
      	<td>${custname }</td>
      	<td>${area }</td>
      	<td>${unit }</td>
      	<td>${majo }</td>
      	<td>${stuempno }</td>
      	<td>
      	<c:choose>
      		<c:when test="${status eq 0}">已导入</c:when>
    		<c:when test="${status eq 1}">第一次录入</c:when>
    		<c:when test="${status eq 2}">第二次录入</c:when>
    		<c:when test="${status eq 3}">已审核</c:when>
    		<c:otherwise>未配置</c:otherwise>
    	</c:choose>
    	</td>
    	<td>${idno }</td>
    	<td>
      	<c:choose>
    		<c:when test="${sex eq 1}">男</c:when>
    		<c:when test="${sex eq 2}">女</c:when>
    		<c:otherwise>未配置</c:otherwise>
    	</c:choose>
    	</td>
      	<td>${country }</td>
      	<td>${nation }</td>
      	<td>${email }</td>
      	<td>${mobile }</td>
      	<td>${csdate }</td>
    	<td>${impdate }</td>
      	<td>${remark }</td>
      </tr>
      </s:iterator>
      <s:if test="%{pm.list.size==0}">
		<tr>
			<td colspan="17"><font>暂时没有内容信息</font></td>
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
