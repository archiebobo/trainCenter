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
	window.location.href = "<%=basePath%>manager/manager-tblCheckDoctorSumary/tblCheckDoctorSumary-add.jsp";
}
function update(id){
	window.location.href = "<%=basePath%>manager/manager-tblCheckDoctorSumary/tblCheckDoctorSumary-update.jsp?id="+id;
}
function del(id){
	var parms={};
	parms["tblCheckDoctorSumary.dcsummaryid"] = id;
	$.getJSON("<%=basePath%>hos/tblCheckDoctorSumary_delete.action", parms, function(json){
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
<form action="<%=basePath%>hos/tblCheckDoctorSumary_query.action" id="form1" method="post">
<div class="searchTab">
  <table>
    <tr>
      <th>意见模板名称</th>
      <td><input type="text" name="tblCheckDoctorSumary.summaryname" id="summaryname" value="${tblCheckDoctorSumary.summaryname}"/>
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
        <td>意见模板序号</td>
        <td>意见模板名称</td>
        <td>使用标志</td>
        <td>项目模板内容</td>
        <td>备注</td>
        <td>操作</td>
      </tr>
    </thead>
    <s:iterator value="%{pm.list}" status="list">
    <tr>
    	<td>${dcsummaryid }</td>
      	<td>${summaryname }</td>
      	<td>
      	<c:choose>
    		<c:when test="${status eq 1}">正常</c:when>
    		<c:when test="${status eq 2}">停用</c:when>
    		<c:otherwise>未配置</c:otherwise>
    	</c:choose>
    	</td>
      	<td>${memo }</td>
      	<td>${remark }</td>
        <td>
        <a href="javascript:update('${dcsummaryid}');" class="update" title="点击修改信息">修改</a>
        <s:if test="%{dcsummaryid>2}">
        <a href="javascript:del('${dcsummaryid}');" class="del" title="点击删除">删除</a>
        </s:if>
        </td>
      </tr>
      </s:iterator>
      <s:if test="%{pm.list.size==0}">
		<tr>
			<td colspan="6"><font>暂时没有内容信息</font></td>
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
