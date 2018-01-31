<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/jquery-1.7.1.min.js"></script>
<script>
function toggle(tid){
	var tbody = $('#' + tid);
	var img = $('#' + tid + '1');
	
	tbody.toggle();
	if(tbody.css('display') == 'none'){
		img.attr('src', '<%=basePath%>style/images/ico_collapse.jpg');
	}else{
		img.attr('src', '<%=basePath%>style/images/ico_expand.jpg');
	}
}

function handle(url, title){
	
}
//-------订单详细---------------
function openpage(url_,title, width_, height_){
	var w = window.screen.width;
	var h = window.screen.height;
	if(width_ == undefined)width_ = w;
	if(height_ == undefined)height_ = h;
	window.showModalDialog('<%=basePath%>' + url_ + "?time=" + new Date(),
				title, 'dialogWidth:' + width_ + 'px; dialogHeight:' + height_
						+ 'px; status:0; resizable:yes; status:no;');
}
</script>
</head>

<body>
	<div class="title">个人工作台</div>
	<div class="listTab">
	<table>
		<thead>
			<tr>
				<td>单据编号</td>
				<td>发起单位/说明</td>
				<td>创建人</td>
				<td>创建时间</td>
				<td>审批时间</td>
				<td>状态</td>
			</tr>
		</thead>
		<tr>
			<td colspan="6" style="text-align: left;">
				<a href="javascript:toggle('sx');">
					<img id="sx1" src="<%=basePath%>style/images/ico_expand.jpg"/>采购订单
				</a>
			</td>
		</tr>
		<tbody id="sx">
			<tr>
				<td>
					<a href="admin/fund/gather/apply2.jsp">PO2011120001</a></td>
				<td>红岩煤矿</td>
				<td>露西</td>
				<td>2011-10-03 10:59</td>
				<td></td>
				<td>起草中</td>
			</tr>
		</tbody>
		<tr>
			<td colspan="6" style="text-align: left;">
				<a href="javascript:toggle('tx');">
					<img id="tx1" src="<%=basePath%>style/images/ico_expand.jpg"/>销售订单
				</a>
			</td>
		</tr>
		<tbody id="tx">
			<tr>
				<td>
					<a href="admin/fund/draw/apply_xiugai.jsp">IAB-201112300001</a></td>
				<td>红岩煤矿</td>
				<td>王五</td>
				<td>2011-10-05 06:38</td>
				<td></td>
				<td>已提交</td>
			</tr>
			<tr>
				<td>
					<a href="admin/fund/draw/apply_chaxun.jsp">IAB-201112300002</a></td>
				<td>南桐煤矿</td>
				<td>王五</td>
				<td>2011-10-08 08:09</td>
				<td>2011-10-11 12:40</td>
				<td>未执行出库</td>
			</tr>
		</tbody>
	</table>
	</div>
</body>
</html>