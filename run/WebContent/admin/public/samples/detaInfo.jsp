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
<!--表格信息题目-->


  <div class="editorTab">
<table>
<thead>
  <tr>
    <th>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</th>
    <td>张笑</td>
    <th>家庭住址</th>
    <td>清溪桥八十七号</td>
    <th>事业单位部门</th>
    <td>税务局人事部</td>
    </tr>
</thead>
<tbody>
  <tr>
    <th>订&nbsp;&nbsp;单&nbsp;&nbsp;号</th>
    <td >123456</td>
    <th>部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门</th>
    <td >人事部</td>
    <th>订单日期</th>
    <td>2012-5-8</td>
    </tr>
  <tr>
    <th>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</th>
    <td colspan="5">备注说明信息</td>
    </tr>
</tbody>
</table>
</div>
<!--信息显示表格-->


<div class="btns">
  <span class="btn"><input type="button" value="提交"/></span>
  <span class="btn"><input type="button" name="button2" id="button2" value="取消" /></span>
  <span class="btn"><input type="button" name="button3" id="button3" value="点击删除信息"/></span></div>
<!--操作按钮，居中显示-->  
  
  
  <div class="textDetaTab">
<table>
  <tr>
    <td class="txtTitle">文档题目</td>
    </tr>
  <tr>
    <td class="txtSubTitle" >附件：<a href="javascript:void(0);">附件题目.doc</a></td>
    </tr>
  <tr>
    <td class="txtContent"><p>战国末，日本开发北海道。18世纪起，日本及俄罗斯先后在此进行开发，1855年，两国签署日俄和亲通好条约，约定得抚岛以南的南千岛群岛归日本所有，日本先后在南千岛群岛设置行政区划。直到1945年苏联在二次大战结束前发动八月风暴军事行动，占领南千岛群岛。  北方四岛(“南千岛群岛”)</p>
      <p>在1945年雅尔塔会议当中，美英承诺苏联在战后得以取得南库页岛以及千岛群岛全部主权，并签订雅尔塔协定。在日本投降后，苏联即依据雅尔塔协定宣布拥有该地主权。在1951年签订的旧金山和约第二章“领土”中，约定日本放弃对千岛群岛和库页岛自1905年朴茨茅斯和约后取得领土之所有权利与请求权。条文中并没有约定千岛群岛的范围，但在签约当时，日本国会所通过的放弃范围包括国后岛和择捉岛。然而苏联当时并没有签署这份和约。</p>
      <p>直到1956年，苏联和日本两国签署苏日共同宣言，但由于当时两国对南千岛群岛的主权问题无法达成共识，日本国会在1956年2月也取消放弃国后岛和择捉岛的决议，不放弃南千岛群岛的主权；虽然苏联原本也同意归还齿舞群岛和色丹岛，但却无法对国后岛和择捉岛的部分取得共识，因此最后签约时，并没有对领土争议达成任何协定，宣言中也没有任何相关内容。此后，2004年俄罗斯决定归还较小的齿舞和色丹岛（占争议地区领土面积的6%），但被日本拒绝。 　　2012年3月，新当选的俄罗斯总统普京再次表示俄罗斯愿意归还北方四岛中的齿舞群岛和色丹岛，日本首相野田佳彦3月8日在众院预算委员会上就此表示：“这不是四岛归还一半就可以的问题。这两个岛的面积仅占(北方四岛总面积的)7%，其余93%不归还就谈不上公平。”</p></td>
    </tr>
</table>
</div>
<!--文本详细信息显示，比如公告详细信息等。-->
</body>
</html>
