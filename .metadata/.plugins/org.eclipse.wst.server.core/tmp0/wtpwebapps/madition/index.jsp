<%@page import="com.ektong.hos.vo.SysUser"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SysUser user=(SysUser)session.getAttribute("currentUser");
String skin = request.getParameter("skin");
if(skin != null && skin.length()>0){
	session.setAttribute("skin", skin);
	Cookie cookie = new Cookie("skin", skin);
	response.addCookie(cookie);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<title></title>
<jsp:include page="/admin/common/css/style_index.jsp"></jsp:include>
<jsp:include page="/admin/common/css/style_easyui.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/lib/jquery/zTree/css/demo.css"/>
<link rel="stylesheet" href="<%=basePath%>js/lib/jquery/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/cookie.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/zTree/js/jquery.ztree.core-3.3.js"></script>

<style type="text/css">
html,body {
	overflow: hidden;
}
ul.ztree {margin:10px 0 0 10px;border: 1px solid #70C1FA;background: #fff;width:250px;height:400px;overflow-y:scroll;overflow-x:auto;}
</style>

<script type="text/javascript">

//部门树配置
var setting = {
	data: {
		key: {
			title: 'name',
			name: 'name'
		},
		simpleData: {
			enable: true,
			idKey: 'menuid',
			pIdKey: 'fatherid'				
		}
	},
	check: {
		enable: false
	},
	view: { 
		selectedMulti: false
	},
	callback: {                 
		beforeDrag: false,
		onClick:onClick
	}
};
function onClick(event, treeId, treeNode,clickFlag) {
	var _treeNode = treeNode;
	if(treeNode.menutype == '0'){
		return;
	}
	addTab(treeNode.name, treeNode.menu_idc);
}
//----初始化加载树---
function initTree(){
	$.ajax({
		   type: "post",
		   url: '<%=basePath%>hos/tblMenu_findMenuByRoleid.action',
		   success: function(json){
			   if(json.resultCode == "0"){
				   $.fn.zTree.init($("#treeDemo"), setting, json.list);
			   }else{
			   		alert("加载菜单失败:"+json.resultMsg);
			   }
		   }
		});
	
}

$(function(){
	load();
	/* lodata(); */
});

function load(){
	var session="<%=user%>".toString();
	if (session=="null"||session==null) {
	}else{
		initTree();
	}
}
<%-- function lodata(){
	$.ajax({
		   type: "post",
		   url: '<%=basePath%>manager/inpaySyspara_findById.action',
		   success: function(json){
			   if(json.resultCode == "0"){
				   $("#para").html(json.data.paraval);
			   }else{
			   		alert("加载系统参数失败:"+json.resultMsg);
			   }
		   }
		});
	
} --%>
function addTab(title, url){
	var tabs = window.frames['content'].$('#tabs');
	url = '<%=basePath%>' + url;
	var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
	if (tabs.tabs('exists', title)){
		tabs.tabs('select', title);  
	}else if(tabs.tabs('tabs').length == 11){
		$.messager.alert('提示信息', '打开的窗口过多，请先关闭一些窗口！', 'info');
	}else{
		tabs.tabs('add', {
			title: title,
			content: content,
			closable: true,
			iconCls: 'icon-reload'
		});
	}
	window.frames['content'].tabClose();
}

function logout(){
	var url = '<%=basePath%>logout.action';
	window.location.href = url;
	/*
	$.messager.confirm('确认信息', '你确认要退出当前系统吗？', function(r){
		if (r){
			window.location.href = url;
		}}
	);
	*/
}

function changeSkin() {
	var skin = $.cookie("skin");
	if(typeof skin == 'undefined' || skin == null){
		skin = 'blue';
	}
	skin = getSkin(skin);
	$.cookie("skin", skin, {expires:7});
	window.location = "<%=basePath%>index.action?skin=" + skin;
}

function updtePwd(){
   addTab('修改密码','admin/public/user_checkPassword.jsp');
}
/* var x = document.getElementById("contentBorderL");
var y = document.getElementById("treeDemo");
y.style.width=x.offsetWidth+"px"; */
</script>
</head>
<body onload="setContainerSize()">
	<div id="top">
		<div class="topColor"></div>
		<div class="indexLogo"></div>
		<div class="mainMenu">
			<ul>
				<li><a href="javascript:void(0);" id="logout" class="menuD" onclick="javascript:updtePwd();">修改密码</a></li>
				<li><a href="javascript:void(0);" id="logout" class="menuG" onclick="javascript:logout();">退出系统</a></li>
			</ul>
		</div>
		<div class="subMenuC">
          <div class="subMenuL">
          <div class="subMenuR">
          <div class="subMenu" id="subMenuBar"></div>
          </div>
          </div>
        </div>
	</div>
	<div id="center">
	    <div class="contentBorderL" style="width:20%">
			<div style="height:90%;width:80%"> 
				<ul id="treeDemo" class="ztree" style="height:100%;width: 100%"></ul>
			</div>
	    </div>
		<div class="contentMargins" style="width:80%;float:right" >
			<iframe id="content" frameborder="0" name="content" scrolling="auto" src="<%=basePath%>tabs.action"></iframe>
		</div>
		<div class="contentBorderR">
			<div></div>
   		</div>
	</div>
	<div id="bottom">
		<div class="bottomBg">
			<div class="bottomBgL">
				<div class="bottomBgR">
					<div class="msg">
					<span>当前用户：<s:property value="@com.ektong.core.common.ContextHelper@getCurrentUserName()"/></span> 
					</div>
					<%--<div class="copyright">
					<div id="para"></div>
					</div> --%>
					<%-- <div class="msg">
						<span>当前用户：超级管理员<s:property value="超级管理员"/></span>
					</div> --%>
					
				</div>
			</div>
		</div>
	</div> 
	
	<script type="text/javascript">
		//----------设定中间那个div的高度-------
		function setContainerSize() {
			size = window['innerHeight'] || document.documentElement.clientHeight; //获取浏览器高度
			size = size - 136; //去掉顶部的106和底部的30
			document.getElementById('center').style.height = size + "px"; //设置div高度
			document.getElementById('content').style.height = size + "px"; //设置框架高度
		}
		window.onresize = setContainerSize; //浏览器大小变化的时候调用
	</script>
</body>
</html>