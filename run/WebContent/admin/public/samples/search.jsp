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
<div class="searchTab">
  <table>
    <tr>
      <th>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</th>
      <td><input type="text" name="textfield" id="textfield" /></td>
      <th>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</th>
      <td><select name="select" id="select" class="downMenu">
          <option>---请选择---</option>
        </select></td>
      <th>单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</th>
      <td><select name="select2" id="select2" class="downMenu">
          <option>---请选择---</option>
        </select></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <th>日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期</th>
      <td><a href="javascript:void(0);" title="点击选择日期" ><input name="time1" type="text" id="textfield4" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></a></td>
      <th>起止日期</th>
      <td><a href="javascript:void(0);" title="点击选择日期" ><input name="textfield4" type="text" id="textfield5" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="timeTextbox" />
        到
        <input name="textfield5" type="text" id="textfield6" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="timeTextbox" /></a></td>
      <th>订&nbsp;&nbsp;单&nbsp;&nbsp;号</th>
      <td><input type="text" name="textfield3" id="textfield3" /></td>
      <td><span class="btn"><input type="button" value="查询"/></span></td>
    </tr>
  </table>
</div>
<!--查询条件表格-->

<div class="searchListTab">
  <table>
    <thead>
      <tr>
        <td>文字很多，而且不整齐（比如地址、题目、内容）</td>
        <td>年月日</td>
        <td>金额数</td>
        <td>计量数字</td>
        <td>姓名</td>
        <td>部门</td>
        <td>电话</td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="tdLeft">重庆市南桐矿业有限责任公</td>
        <td>2012-5-6</td>
        <td class="tdRight">23015.00</td>
        <td class="tdRight">6000</td>
        <td>王强</td>
        <td>财务科</td>
        <td>15243089531</td>
      </tr>
      <tr>
        <td class="tdLeft">万盛经开区</td>
        <td>2012-10-12</td>
        <td class="tdRight">685755555.00</td>
        <td class="tdRight">85</td>
        <td>张笑</td>
        <td>人事部</td>
        <td>16325879621</td>
      </tr>
    </tbody>
  </table>
</div>
<!--查询列表格（点击行查看详细信息，并有查看详细信息提示，及行信息鼠标成手型）-->
</body>
</html>
