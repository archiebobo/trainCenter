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

/**
 * 关闭弹出窗口
 */
function closeWindow(){
	window.parent.$('#popupWin').window('close');
}	
</script>
</head>
<body>
	<div class="searchTab">
		<table>
			<tr>
				<th>商品类别</th>
				<td>
					<input type="text" size="20"/>
				</td>
				<th>商品名称</th>
				<td>
					<input type="text" size="20"/>
				</td>
			</tr>
			<tr>
				<th>商品编号</th>
				<td>
					<input type="text" size="20"/>
				</td>
				<th></th>
				<td>
					<span class="btn"><input type="button" value="查询"/></span>
				</td>
			</tr>
		</table>
	</div>
	<div class="title">查询结果</div>
	<div class="listTab">
		<table>
			<thead>
				<tr>
					<td>商品编号</td>
					<td>商品名称</td>
					<td>商品类别</td>
					<td>数量</td>
					<td>单位</td>
					<td>批发价</td>
					<td>零售价</td>
					<td>成本价</td>
					<td>入库时间</td>
				</tr>
			</thead>
			<tbody>
				<tr ondblclick="closeWindow();">
					<td class="tdLeft">A0011110</td>
					<td class="tdLeft">联想笔记本</td>
					<td class="tdLeft">T系列</td>
					<td class="tdRight">1</td>
					<td>台</td>
					<td class="tdRight">2000</td>
					<td class="tdRight">2000</td>
					<td class="tdRight">2000</td>
					<td>2012-08-01 09:00</td>
				</tr>
				<tr ondblclick="closeWindow();">
					<td class="tdLeft">A0011111</td>
					<td class="tdLeft">联想笔记本</td>
					<td class="tdLeft">T系列</td>
					<td class="tdRight">1</td>
					<td>台</td>
					<td class="tdRight">2000</td>
					<td class="tdRight">2000</td>
					<td class="tdRight">2000</td>
					<td>2012-08-01 09:00</td>
				</tr>
				<tr ondblclick="closeWindow();">
					<td class="tdLeft">A0011111</td>
					<td class="tdLeft">联想笔记本</td>
					<td class="tdLeft">T系列</td>
					<td class="tdRight">1</td>
					<td>台</td>
					<td class="tdRight">2000</td>
					<td class="tdRight">2000</td>
					<td class="tdRight">2000</td>
					<td>2012-08-01 09:00</td>
				</tr>
			</tbody>
		</table>
	</div>
	<jsp:include page="/admin/common/pagemodel.jsp"></jsp:include>
	
	<div class="btns">
		<span class="btn"><input type="button" value="确定" onclick="closeWindow();"/></span>
		<span class="btn"><input type="button" value="取消" onclick="closeWindow();"/></span>
	</div>
	
	<div class="title">已选商品</div>
	<div class="listTab">
		<table>
			<thead>
				<tr>
					<td>商品编号</td>
					<td>商品名称</td>
					<td>商品类别</td>
					<td>成本价</td>
					<td>数量</td>
					<td>单位</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<tr ondblclick="closeWindow();">
					<td class="tdLeft">A0011110</td>
					<td class="tdLeft">联想笔记本</td>
					<td class="tdLeft">T系列</td>
					<td class="tdRight">2000</td>
					<td class="tdRight">1</td>
					<td class="tdRight">台</td>
					<td><a href="#" class="del" title="点击删除信息">删除</a></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
