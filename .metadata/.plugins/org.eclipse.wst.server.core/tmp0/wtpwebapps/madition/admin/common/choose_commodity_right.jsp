<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/jquery-1.7.1.min.js"></script>
<script language="javascript">
$(function(){
	init();		//初始化
});

/**
 * 关闭弹出窗口
 */
function closeWindow(id,name,cc_id,cc_name,cd_no,unit){
	//window.parent.closeWindow();
	window.returnValue = id+";"+name+";"+cc_id+";"+cc_name+";"+cd_no+";"+unit;
	window.close();
}
	
function init(){
	var existStr = getUrlPara("existStr");
	var arr = existStr.split(";");
	for(var i=0; i<arr.length;i++){
		changeTr(arr[i]);		//改变已选择行
	}
}

function getUrlPara(paraName){  
	var sUrl  =  top.location.href; 
	var sReg  =  "(?:\\?|&){1}"+paraName+"=([^&]*)";
	var re=new RegExp(sReg,"gi"); 
	re.exec(sUrl); 
	return RegExp.$1; 
}

function changeTr(existID){
	$("#tbody").find("tr").each(function(tr_index){
		var cd_id = $(this).find("td").eq(1).find("input").eq(0).val();
		if(parseInt(existID) == parseInt(cd_id)){
			$(this).css({"background-color": "green" });
			$(this).attr("ondblclick","javascript:alert('该商品已经添加了，不能添加重复的商品！');");
			$(this).find("td").eq(0).find("a").attr("onclick","javascript:alert('该商品已经添加了，不能添加重复的商品！');");
		}
	});
}
</script>
<style type="text/css">
	div.content_wrap {
		width: 900px;
		height: 900px;
	}
	
	div.content_wrap div.left {
		float: left;
		width: 250px;
	}
	
	div.content_wrap div.right {
		float: right;
		width: 650px;
	}
	</style>
			<style type="text/css">
	.ztree li span.button.add {
		margin-left: 2px;
		margin-right: -1px;
		background-position: -144px 0;
		vertical-align: top; *
		vertical-align: middle
	}
</style>
</head>
<body>
	<form action="<%=basePath%>bss/basicdata/cate_selBssCommodity.action" method="post">
		<div class="searchTab">
				<table>
					<tr align="left">
						<td>商品名称</td>
						<td>
							<input type="text" size="20" name="bssCommodity.cd_name" value="${bssCommodity.cd_name}"/>
						</td>
						<td>
							<span class="btn">
								<input type="hidden" size="20" name="bssCommodity.cc_id" value="${bssCommodity.cc_id}"/>
								<input type="submit" value="查询"/>
							</span>
						</td>
					</tr>
				</table>
			</div>
			<div class="listTab">
				<table>
					<thead>
						<tr>
							<td>选择</td>
							<td>商品名称</td>
							<td>商品类别</td>
						</tr>
					</thead>
					<tbody id="tbody">
						<s:iterator value="%{pm.list}">
							<tr onclick="closeWindow('${cd_id}','${cd_name}','${cc_id}','${cc_name}','${cd_no}','${unit}');">
								<td>
							    	<a href="javascript:void(0);" class="choose" title="点击选择" 
							    		onclick="closeWindow('${cd_id}','${cd_name}','${cc_id}','${cc_name}','${unit}');">选择</a>
							    </td>
								<td class="tdLeft"><input type="hidden" name="" value="${cd_id }"/> ${cd_name } </td>
								<td>${cc_name }</td>
							</tr>
						</s:iterator>
						
					</tbody>
				</table>
			</div>
			<jsp:include page="/admin/common/pagemodel.jsp"></jsp:include>
	</form>
</body>
</html>
