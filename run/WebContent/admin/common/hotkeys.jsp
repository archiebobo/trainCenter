<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link href="<%=basePath%>js/lib/jquery/jquery.hotkeys-0.7.9/AccessKeyHighlighter/AccessKeyHighlighter.css" type="text/css" rel="stylesheet">
<%-- 
<script src="<%=basePath%>js/lib/jquery/jquery-1.7.1.min.js"  type="text/javascript" ></script>
--%>
<script src="<%=basePath%>js/lib/jquery/jquery.hotkeys-0.7.9/jquery.hotkeys.js" type="text/javascript"></script>
<script src="<%=basePath%>js/lib/jquery/jquery.hotkeys-0.7.9/AccessKeyHighlighter/jquery.AccessKeyHighlighter.js" type="text/javascript"></script>
<script src="<%=basePath%>js/lib/jquery/jquery.hotkeys-0.7.9/hotbind.js"></script>
