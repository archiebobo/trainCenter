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

<%-- function add(){
	window.location.href = "<%=basePath%>manager/manager-tblCheckInputInfo/tblCheckInputInfo-add.jsp";
}
function update(id){
	window.location.href = "<%=basePath%>manager/manager-tblCheckInputInfo/tblCheckInputInfo-update.jsp?id="+id;
}
function del(id){
	var parms={};
	parms["tblCheckInputInfo.batchno"] = id;
	$.getJSON("<%=basePath%>hos/tblCheckInputInfo_delete.action", parms, function(json){
		if(json.resultCode == '0'){
			alert('操作成功');
			window.location.reload();
		}else{
			alert("操作失败!");
		}
	});
} --%>
$(function (){
	loadData();
	$("#status").val($("#statu").val());
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
				$("#batchno").val($("#bat").val());
			}
		});		
	}
function update(id,batchno){
	window.location.href = "<%=basePath%>manager/manager-tblCheckInputDtl/tblCheckInputDtl-update.jsp?id="+id+"&batchno="+batchno;
}
function check(id,batchno){
	window.location.href = "<%=basePath%>manager/manager-tblCheckInputDtl/tblCheckInputDtl-check.jsp?id="+id+"&batchno="+batchno;
}
function changeStatus(){
	$("#statu").val($("#status").find("option:selected").val());
}
</script>
</head>
<body>
<form action="<%=basePath%>hos/tblCheckInputInfo_updateQuery.action" id="form1" method="post">
<div class="searchTab">
  <table>
    <tr>
      <th><font>*</font>批次</th>
					<td>
					<select name="tblCheckInputInfo.batchno" id="batchno">
    					<option value="">-请选择-</option>
    				</select>
    				<input type="hidden" name="" id="bat" value="${tblCheckInputInfo.batchno}"/>
      姓名<input type="text" name="tblCheckInputInfo.custname" id="custname" value="${tblCheckInputInfo.custname}"/>
                   学工号<input type="text" name="tblCheckInputInfo.stuempno" id="stuempno" value="${tblCheckInputInfo.stuempno}"/>
                   学院<input type="text" name="tblCheckInputInfo.unit" id="unit" value="${tblCheckInputInfo.unit}"/>
                   班级<input type="text" name="tblCheckInputInfo.addr" id="addr" value="${tblCheckInputInfo.addr}"/>
                  状态 <select name="tblCheckInputInfo.status" id="status" onchange="changeStatus();">
    					<option value="">-请选择-</option>
    					<option value="0">已导入</option>
    					<option value="1">第一次录入</option>
    					<option value="2">第二次录入</option>
    					<option value="3">已审核</option>
    				</select>
    				<input type="hidden" name="" id="statu" value="${tblCheckInputInfo.status}"/>
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
        <td>体检批次</td>
        <td>姓名</td>
        <td>学院</td>
        <td>专业</td>
        <td>班级</td>
        <td>学工号</td>
        <td>状态</td>
        <td>操作</td>
      </tr>
    </thead>
    <s:iterator value="%{pm.list}" status="list">
    <s:if test="%{flag==2}">
		<tr style="color: red">
    	<td>${custid }</td>
    	<td style="display: none;">${batchno }</td>
    	<td>${batchname }</td>
      	<td>${custname }</td>
      	<td>${unit }</td>
      	<td>${majo }</td>
      	<td>${addr }</td>
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
       <td>
        <s:if test="%{status==2}">
        <a href="javascript:update('${stuempno}','${batchno}');" class="update" title="点击修改信息">修改</a>
        </s:if>
        </td>
      </tr>
	 </s:if>
    <s:if test="%{flag==1}">
		<tr>
    	<td>${custid }</td>
    	<td style="display: none;">${batchno }</td>
    	<td>${batchname }</td>
      	<td>${custname }</td>
      	<td>${unit }</td>
      	<td>${majo }</td>
      	<td>${addr }</td>
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
       <td>
        <s:if test="%{status==2}">
        <a href="javascript:update('${stuempno}','${batchno}');" class="update" title="点击修改信息">修改</a>
        </s:if>
        </td>
      </tr>
	 </s:if>
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
