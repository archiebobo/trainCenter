<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String skin = (String)session.getAttribute("skin");
	
	if(skin == null){
		skin = "blue";
	}
	Cookie[] cookie = request.getCookies();
	if(cookie!=null&&cookie.length!=0)
	for (int i = 0; i < cookie.length; i++) {
		if ("skin".equals(cookie[i].getName())&&cookie[i].getValue()!=null) {
			skin = cookie[i].getValue();
		}
	}
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>style/<%=skin%>/css/index.css"/>
