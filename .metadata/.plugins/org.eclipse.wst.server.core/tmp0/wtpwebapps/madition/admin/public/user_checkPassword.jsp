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
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/lib/validation/css/livevalidation.css"/>
<script type="text/javascript" src="<%=basePath%>js/lib/validation/livevalidation.js"></script>
<script type="text/javascript" src="<%=basePath%>js/md5-min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/jquery-1.7.1.min.js"></script>
<script language="javascript">
	$(function(){
	$("#oldpwd").blur(function(){
		var oldpwd=hex_md5($("#oldpwd").val());
		var params = {
			ct: (new Date()).getTime()
		};
		params["tblOper.passwd"] = oldpwd;
		$.getJSON("<%=basePath%>hos/tblOper_checkPwd.action", params, function(json){
			if(json.resultCode == '0'){
			}else{
				alert(json.resultMsg);
			}
		});
	});
	
	$("#button").click(function(){
		if ($("#newpwd").val()==""||$("#newpwd").val()==null) {
			alert("新设密码不能为空");
			return ;
		}
		if ($("#pword").val()==""||$("#pword").val()==null) {
			alert("确认密码不能为空");
			return ;
		}
		if ($("#newpwd").val()!=$("#pword").val()) {
			alert("你输入的两次新密码不一致!");
			return ;
		}
		$("#newpwd").val(hex_md5($("#newpwd").val()));
		$("#pword").val(hex_md5($("#pword").val()));
		$("#form1").submit();
	});
});
function updatepwd(){
	if(confirm("确定要将当前用户的密码重置为111111吗？")){
		$.post('<%=basePath%>basic/sys/user_resetPwd.action',{ct:new Date()},function(json){
		       var resultMsg=json.resultMsg;
		       alert(resultMsg);
		 });
	}
}
</script>
</head>
<body>
<div class="title">修改密码</div>
<form action="<%=basePath%>hos/tblOper_updatePwd.action" method="post" name="form1" id="form1">
<div class="editorTab">
<table>
<thead>
  <tr>
    <th><font>*</font>历史密码</th>
    <td><input type="password"  name="oldpwd" id="oldpwd"/></td>
   </tr>
   <tr> 
    <th><font>*</font>新设密码</th>
    <td><input type="password"  name="newpwd" id="newpwd"/></td>
   </tr>
   <tr>  
    <th><font>*</font>确认密码</th>
    <td><input type="password"  name="tblOper.passwd" id="pword" /></td>
    </tr>
</thead>
</table>
</div>

 <div class="btns">  <span class="btn"><input type="button" name="button" id="button" value="提交"/></span>
  <!-- <span class="btn"><input type="reset" value="重置密码" class="reset" onclick="updatepwd();"/></span> --></div>
  </form>

</body>
</html>
