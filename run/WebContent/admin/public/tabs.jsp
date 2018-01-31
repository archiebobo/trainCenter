<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>style/icon.css"/>
<jsp:include page="/admin/common/css/style_easyui_tabs.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	tabCloseEvent();
	/*$(".tabs-inner:first").removeClass().addClass('tabFirst');*/
});

function tabClose(){
    /*双击关闭TAB选项卡*/
    var temp = $(".tabs-inner:not(:first)");
    temp.unbind('dblclick');
    temp.dblclick(function(){
        var subtitle = $(this).children("span").text();
		if("我的桌面"==subtitle) return;
        $('#tabs').tabs('close',subtitle);
    });
	/*右键事件*/
	temp = $(".tabs-inner:not(:first)");
	temp.unbind('contextmenu');
	temp.bind('contextmenu',function(e){
		var subtitle =$(this).children("span").text();
		if("我的桌面"==subtitle) return;
        $('#mm').menu('show', {
            left: e.pageX,
            top: e.pageY
        });
		$('#tabs').tabs('select',subtitle);
        $('#mm').data("currtab",subtitle);
        return false;
    });
	temp = $(".icon-reload");
	temp.unbind('click');
	temp.click(function(e){//刷新页面
		var subtitle =$(this).prev().text();
		var tab=$('#tabs').tabs('getTab', subtitle); 
		for(var i=0;i<tab.find("iframe").length;i++){
			var _refresh_ifram =tab.find("iframe")[i];
			_refresh_ifram.contentWindow.location.href=_refresh_ifram.src;
		}
    });
}

//绑定右键菜单事件
function tabCloseEvent(){
    //关闭当前
    $('#mm-tabclose').click(function(){
        var currtab_title = $('#mm').data("currtab");
        $('#tabs').tabs('close',currtab_title);
    });
    
    //全部关闭
    $('#mm-tabcloseall').click(function(){
        $('.tabs-inner span:not(:first)').each(function(i,n){
            var t = $(n).text();
            $('#tabs').tabs('close',t);
        });    
    });
    
    //关闭除当前之外的TAB
    $('#mm-tabcloseother').click(function(){
        var currtab_title = $('#mm').data("currtab");
        $('.tabs-inner span:not(:first)').each(function(i,n){
            var t = $(n).text();
            if(t!=currtab_title){
            	$('#tabs').tabs('close',t);
            }
        });    
    });
    
    //关闭当前右侧的TAB
    $('#mm-tabcloseright').click(function(){
        var nextall = $('.tabs-selected').nextAll();
        if(nextall.length==0){
            return false;
        }
        nextall.each(function(i,n){
            var t=$('a:eq(0) span',$(n)).text();
            $('#tabs').tabs('close',t);
        });
        return false;
    });
    
    //关闭当前左侧的TAB
    $('#mm-tabcloseleft').click(function(){
        var prevall = $('.tabs-selected').prevAll();
        if(prevall.length==1){
            return false;
        }
		prevall.length=prevall.length-1;
        prevall.each(function(i,n){
            var t=$('a:eq(0) span',$(n)).text();
            $('#tabs').tabs('close',t);
        });
        return false;
    });
}
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
		<div id="tabs" class="easyui-tabs" fit="true">
			<div title="我的桌面" iconCls="myDesktopIco">
				<iframe scrolling="auto" frameborder="0" style="width:100%;height:100%;" src="<%=basePath%>admin/public/desktop.jsp"></iframe>
			</div>
		</div>
	</div>
	
	<div id="mm" class="easyui-menu" style="width:150px; display:none">
	    <div id="mm-tabclose">关闭</div>
	    <div id="mm-tabcloseall">全部关闭</div>
	    <div id="mm-tabcloseother">除此之外全部关闭</div>
	    <div class="menu-sep"></div>
	    <div id="mm-tabcloseright">当前页右侧全部关闭</div>
	    <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
	</div>
</body>
</html>