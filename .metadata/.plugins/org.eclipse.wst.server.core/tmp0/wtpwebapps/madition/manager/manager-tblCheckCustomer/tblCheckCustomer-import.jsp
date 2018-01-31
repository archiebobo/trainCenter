<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>
<script type="text/javascript">
 $(function (){
 	$("#areasub").click(function(){
		var uploadfile= $("#fileID");
		if(uploadfile.val()==""){
			alert("请选择要上传的文件");
			return false;
		}
		if(!/[.](xls)$/.test(uploadfile.val().toLowerCase())){
		 	alert("暂只支持后缀为.xls文件");
		 	return false;
		}
		$("#areasub").off("click");
		 $("#form1").submit(); 
	});
 });
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="content_wrap">
<div class="left">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<div class="right" id="right">
	<form  id="form1" enctype="multipart/form-data" action="<%=basePath%>hos/tblCheckCustomer_importExcel.action" method="post" >
		<div class="searchTab" style="width: 900px;">
  			<table>
    			<tr>
    			<th></th>
     			<td>选择文件<input type="file" name="file" value="" class="form-control" id="fileID"/> </td>
      			<td><input type="button" id="areasub" value="提交" /></td>
    			</tr>
  			</table>
		</div>
	</form>
	</div>
</div>
</body>
</html>
