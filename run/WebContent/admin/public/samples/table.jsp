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
<script language="javascript">
	
</script>
</head>
<body>
<div class="tabBtns">
  <span class="btn"><input type="button" value="添加" /></span>
  <span class="btn"><input type="button" name="button4" id="button4" value="修改" /></span>
  <span class="btn"><input type="button" name="button3" id="button3" value="删除" /></span>
</div>
<!--操作表格按钮-->
<div class="listTab">
  <table>
    <thead>
      <tr>
        <td><input type="checkbox" name="checkbox" id="checkbox" /></td>
        <td>文字很多，而且不整齐（比如地址、题目、内容）</td>
        <td>年月日</td>
        <td>金额数</td>
        <td>计量数字</td>
        <td>姓名</td>
        <td>部门</td>
        <td>电话</td>
        <td>操作</td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="checkbox" name="checkbox2" id="checkbox2" /></td>
        <td class="tdLeft">重庆市南桐矿业有限责任公</td>
        <td>2012-5-6</td>
        <td class="tdRight">23015.00</td>
        <td class="tdRight">6000</td>
        <td>王强</td>
        <td><a href="javascript:void(0);">财务科</a></td>
        <td><a href="javascript:void(0);">15243089531</a></td>
        <td>
        	<a href="javascript:void(0);" class="add" title="点击添加信息">添加</a>
        	<a href="javascript:void(0);" class="del" title="点击删除信息">删除</a>
        	<a href="javascript:void(0);" class="modi" title="点击修改信息">修改</a>
        	<a href="javascript:void(0);" class="audit" title="点击审核信息">审核</a>
        	<a href="javascript:void(0);" class="accept" title="点击受理信息">受理</a>
        	<a href="javascript:void(0);" class="set" title="点击设置">设置</a>
        	<a href="javascript:void(0);" class="return" title="点击回访">回访</a>
        	<a href="javascript:void(0);" class="choose" title="点击选择">选择</a>
        	<a href="javascript:void(0);" class="feedback" title="点击回馈">回馈</a>
        	<a href="javascript:void(0);" class="report" title="点击上报系统">上报系统</a>
        </td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox3" id="checkbox3" /></td>
        <td class="tdLeft">万盛经开区</td>
        <td>2012-10-12</td>
        <td class="tdRight">685755555.00</td>
        <td class="tdRight">85</td>
        <td>张笑</td>
        <td><a href="javascript:void(0);">人事部</a></td>
        <td><a href="javascript:void(0);">16325879621</a></td>
        <td>
        	<a href="javascript:void(0);" class="view" title="点击查看信息">查看</a>
        	<a href="javascript:void(0);" class="disc" title="点击禁用">禁用</a>
        	<a href="javascript:void(0);" class="enable" title="点击启用">启用</a>
        	<a href="javascript:void(0);" class="exec" title="点击执行">执行</a>
        	<a href="javascript:void(0);" class="work" title="点击派工">派工</a>
        	<a href="javascript:void(0);" class="authorized" title="点击授权">授权</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<!--列信息表格-->
<jsp:include page="/admin/common/pagemodel.jsp"></jsp:include>
<!--表格分页-->
<div class="listTab">
  <table>
    <thead>
      <tr>
        <td><input type="checkbox" name="checkbox" id="checkbox" /></td>
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
        <td colspan="8"><font>很抱歉，没有找到您要的数据</font></td>
      </tr>
    </tbody>
  </table>
</div>
<!--无信息显示的表格-->
<div class="listTab">
  <table>
    <thead>
      <tr>
        <td><input type="checkbox" name="checkbox" id="checkbox" /></td>
        <td><font>*</font>文字很多，而且不整齐（比如地址、题目、内容）</td>
        <td><font>*</font>年月日</td>
        <td><font>*</font>金额数</td>
        <td>计量数字</td>
        <td>姓名</td>
        <td>性别</td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="checkbox" name="checkbox2" id="checkbox2" /></td>
        <td><input name="textfield" type="text" id="textfield" value="重庆市南桐矿业有限责任公 " size="40" /></td>
        <td><input name="textfield2" type="text" id="textfield2" value="2012-5-6 " size="10" /></td>
        <td><input name="textfield3" type="text" id="textfield3" value="23015.00" size="10" class="textboxRight"/></td>
        <td><input name="textfield4" type="text" id="textfield4" value="6000" size="10" class="textboxRight"/></td>
        <td><input name="textfield5" type="text" id="textfield5" value="王强" size="10" /></td>
        <td><select name="select" id="select">
            <option>---请选择---</option>
          </select></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox3" id="checkbox3" /></td>
        <td><input name="textfield6" type="text" id="textfield6" value="万盛经开区" size="40" /></td>
        <td><input name="textfield7" type="text" id="textfield7" value="2012-10-12 " size="10" /></td>
        <td><input name="textfield8" type="text" id="textfield8" value="685755555.00 " size="10" class="textboxRight" /></td>
        <td><input name="textfield9" type="text" id="textfield9" value="85" size="10"  class="textboxRight"/></td>
        <td><input name="textfield10" type="text" id="textfield10" value="张笑" size="10" /></td>
        <td><select name="select2" id="select2">
            <option>---请选择---</option>
          </select></td>
      </tr>
    </tbody>
  </table>
</div>
<div class="infoTips">加“<font>*</font>”的为必选或必填项</div>
<!--编辑信息的表格-->
<div class="tabBtns">
  <span class="btn"><input type="button" value="添加" /></span>
  <span class="btn"><input type="button" value="修改" /></span>
  <span class="btn"><input type="button" value="删除" /></span>
</div>
<!--操作表格按钮-->
<div class="muchInfoTab">
  <table>
    <thead>
      <tr>
        <td><input type="checkbox" name="checkbox" id="checkbox" /></td>
        <td>文字很多，而且不整齐（比如地址、题目、内容）</td>
        <td>年月日</td>
        <td>金额数</td>
        <td>文字很多，而且不整齐（比如地址、题目、内容）</td>
        <td>年月日</td>
        <td>金额数</td>
        <td>文字很多，而且不整齐（比如地址、题目、内容）</td>
        <td>年月日</td>
        <td>金额数</td>
        <td>计量数字</td>
        <td>文字很多，而且不整齐（比如地址、题目、内容）</td>
        <td>年月日</td>
        <td>金额数</td>
        <td>计量数字</td>
        <td>计量数字</td>
        <td>计量数字</td>
        <td>姓名</td>
        <td>部门</td>
        <td>电话</td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="checkbox" name="checkbox2" id="checkbox2" /></td>
        <td class="tdLeft">重庆市南桐矿业有限责任公</td>
        <td>2012-5-6</td>
        <td class="tdRight">23015.00</td>
        <td class="tdLeft">重庆市南桐矿业有限责任公</td>
        <td>2012-5-6</td>
        <td class="tdRight">23015.00</td>
        <td class="tdLeft">重庆市南桐矿业有限责任公</td>
        <td>2012-5-6</td>
        <td class="tdRight">23015.00</td>
        <td class="tdRight">6000</td>
        <td class="tdLeft">重庆市南桐矿业有限责任公</td>
        <td>2012-5-6</td>
        <td class="tdRight">23015.00</td>
        <td class="tdRight">6000</td>
        <td class="tdRight">6000</td>
        <td class="tdRight">6000</td>
        <td>王强</td>
        <td><a href="javascript:void(0);">财务科</a></td>
        <td><a href="javascript:void(0);">15243089531</a></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox3" id="checkbox3" /></td>
        <td class="tdLeft">万盛经开区</td>
        <td>2012-10-12</td>
        <td class="tdRight">685755555.00</td>
        <td class="tdLeft">万盛经开区</td>
        <td>2012-10-12</td>
        <td class="tdRight">685755555.00</td>
        <td class="tdLeft">万盛经开区</td>
        <td>2012-10-12</td>
        <td class="tdRight">685755555.00</td>
        <td class="tdRight">85</td>
        <td class="tdLeft">万盛经开区</td>
        <td>2012-10-12</td>
        <td class="tdRight">685755555.00</td>
        <td class="tdRight">85</td>
        <td class="tdRight">85</td>
        <td class="tdRight">85</td>
        <td>张笑</td>
        <td><a href="javascript:void(0);">人事部</a></td>
        <td><a href="javascript:void(0);">16325879621</a></td>
      </tr>
    </tbody>
  </table>
</div>
<!--字段太多的表格-->
<div class="tabPaging">
<jsp:include page="/admin/common/pagemodel.jsp"></jsp:include>
</div>
<!--表格分页-->
</body>
</html>
