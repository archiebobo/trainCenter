<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="loginTopColor"></div>
	<div class="loginBg">
		<form  id="form" method="post">
			<div class="loginContent">
	    		<input type="text" class="userBox" id="account" name="user.username" maxlength="50" value="admin"   onkeydown="onkeydownEnter();" />
      			<input type="password" class="passworkBox" id="password" name="user.password" maxlength="50" value="admin"  onkeydown="onkeydownEnter();"/>
				<a href="javascript:void(0);" onclick="javascript:login();" class="loginBtn" title="点击登录系统"></a>
			</div>
			<span id="message">${user.remark}</span>
		</form>
	</div>
</body>
</html>