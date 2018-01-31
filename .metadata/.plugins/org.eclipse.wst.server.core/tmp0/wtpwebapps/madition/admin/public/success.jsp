<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>
<script language="javascript">

</script>
</head>
<body>
	<div class="msgSuccess">
		<dl>
			<dt>操作成功</dt>
			<dd>
				<s:if test="%{closeWindow == true}">
					<script type="text/javascript">
						setTimeout("closeWindow();", 5000);
						function closeWindow(){
							window.parent.location.href = window.parent.location.href;
							if(window.parent.$('#popupWin') != null && 
									window.parent.$('#popupWin') != undefined && 
									window.parent.$('#popupWin').length > 0){
								window.parent.$('#popupWin').window('close');
							}else{
								window.close();
							}
						}
					</script>
				</s:if>
				<s:elseif test="%{backUrl == null || backUrl.length() == 0}">
					<script type="text/javascript">
						setTimeout("goback();", 5000);
						function goback(){
							history.back();
						}
					</script>
				</s:elseif>
				<s:else>
					<script type="text/javascript">
						setTimeout("goback();", 5000);
						function goback(){
							window.location.href = '<%=basePath%>${backUrl}';
						}
					</script>
				</s:else>
				
				<s:if test="%{closeWindow == true}">
					页面将在<font id="span_dt_dt"></font>秒后自动关闭．．．
				</s:if>
				<s:else>
					页面将在<font id="span_dt_dt"></font>秒后自动返回．．．
				</s:else>
				
				<script type="text/javascript">
				<!--
					var mm = 6;
					function show_date_time() {
						if (mm > 0) {
							window.setTimeout("show_date_time()", 1000);
							mm = mm - 1;
						}
						span_dt_dt.innerHTML = mm;
					}
					show_date_time();
				//-->
				</script>
			</dd>
			<dd>
				<s:if test="%{closeWindow == true}">
					<span class="btn"><input type="button" class="button" value="关闭" onclick="closeWindow();" /></span>
				</s:if>
				<s:else>
					<span class="btn"><input type="button" class="button" value="返回" onclick="goback();" /></span>
				</s:else>
			</dd>
		</dl>
	</div>
</body>
</html>
