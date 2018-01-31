<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>
<script src="<%=basePath%>js/lib/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script language="javascript">
	
</script>
</head>
<body>
<div class="title">表格内容提目</div>
<div class="editorTab">
<table>
<thead>
  <tr>
    <th>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</th>
    <td><a href="javascript:void(0);" title="点击选择信息" ><input type="text" name="textfield" id="textfield"/><img src="<%=basePath%>style/images/ico_11.gif" /></a></td>
    <th><font>*</font>家庭住址</th>
    <td><input type="text" name="textfield2" id="textfield2" /></td>
    <th><font>*</font>事业单位部门</th>
    <td><input type="text" name="textfield4" id="textfield4" /></td>
    </tr>
</thead>
<tbody>
  <tr>
    <th><font>*</font>订&nbsp;&nbsp;单&nbsp;&nbsp;号</th>
    <td ><input type="text" name="textfield5" id="textfield5" /></td>
    <th>部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门</th>
    <td ><select name="select" id="select" class="downMenu">
      <option>---请选择---</option>
    </select></td>
    <th>订单日期</th>
    <td><a href="javascript:void(0);" title="点击选择日期" ><input name="time1" type="text" id="textfield3" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></a></td>
    </tr>
      <tr>
    <th>添加附件</th>
    <td colspan="5"><form method="post" action="" enctype="multipart/form-data">
<p class="fileDomainShow">
<input type="text" id="txt" name="txt" class="fileTextbox" />
<span class="btn"><input id="ii" type="button" value="浏览..."/></span>
</p>
<p class="fileDomainHide" >
<input type="file" onchange="txt.value=this.value" size="45"/>
</p>
</form></td>
    </tr>
  <tr>
    <th>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</th>
    <td colspan="5"><textarea name="textfield6" rows="5" id="textfield6" class="manyLineTextbox"></textarea></td>
    </tr>
</tbody>
</table>
</div>
<!--编辑信息表格1-->


<div class="infoTips">加“<font>*</font>”的为必选或必填项</div>
 <div class="btns">  <span class="btn"><input type="button" value="提交"/></span>
  <span class="btn"><input type="button" value="取消" /></span>
  <span class="btn"><input type="button" value="点击删除信息"/></span></div>
<!--操作按钮-->
  

 <div class="editorTab">
<table>
<thead>
  <tr>
    <th>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</th>
    <td><input name="textfield" type="text" id="textfield" value="张笑"/></td>
    <th><font>*</font>家庭住址</th>
    <td><input name="textfield2" type="text" id="textfield2" value="清溪桥八十七号" readonly="readonly" class="unenterTextbox"/></td>
    <th><font>*</font>事业单位部门</th>
    <td><input name="textfield4" type="text" id="textfield4" value="税务局人事部" readonly="readonly" class="unenterTextbox" /></td>
    </tr>
</thead>
<tbody>
  <tr>
    <th><font>*</font>订&nbsp;&nbsp;单&nbsp;&nbsp;号</th>
    <td ><input name="textfield5" type="text" id="textfield5" value="123456" readonly="readonly" class="unenterTextbox" /></td>
    <th>部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门</th>
    <td ><select name="select" id="select" class="downMenu">
      <option>---请选择---</option>
    </select></td>
    <th>订单日期</th>
    <td><input type="text" id="textfield3" value="2012-5-8"/></td>
    </tr>
  <tr>
    <th>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</th>
    <td colspan="5"><textarea name="textfield6" rows="5" id="textfield6" class="manyLineTextbox">备注说明信息</textarea></td>
    </tr>
</tbody>
</table>
</div>
<!--编辑信息表格2-->
</body>
</html>
