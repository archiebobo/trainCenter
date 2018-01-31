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
	
</script>
</head>
<body>
<form action="<%=basePath%>hos/area_query.action" id="sf" method="post">
<div class="searchTab">
  <table>
    <tr>
      <th>区域编号</th>
      <td><input type="text" name="inpayArea.areacode" id="areacode" value="${inpayArea.areacode }"/></td>
      <th>区域名称</th>
      <td><input type="text" name="inpayArea.areaname" id="areaname" value="${inpayArea.areaname }"/></td>
      <td>
		<span class="btn">
			<input type="submit" value="查询"/>
		</span>
	 </td>
    </tr>
  </table>
</div>
<!--查询条件表格-->

<div class="listTab">
  <table>
    <thead>
      <tr>
      	<td>区域编号</td>
      	<td>区域名称</td>
        <td>操作</td>
      </tr>
    </thead>
     <s:iterator value="%{pm.list}" status="list">
    <tr>
      	<td>${areacode }</td>
      	<td>${areaname }</td>
        <td>
           <a  class="view">查看</a>
           <a  class="del">删除</a>
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
<!--查询列表格（点击行查看详细信息，并有查看详细信息提示，及行信息鼠标成手型）-->
<jsp:include page="/admin/common/pagemodel.jsp"></jsp:include>
</form>
</body>
</html>
