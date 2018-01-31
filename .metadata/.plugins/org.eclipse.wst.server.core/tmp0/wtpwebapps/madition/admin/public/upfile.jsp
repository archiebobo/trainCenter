<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String type=request.getParameter("type");
	if(type==null || type.equals("")){
	  type="public";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传附件</title>
<jsp:include page="/admin/common/css/style_index.jsp"></jsp:include>
<style type="text/css">
body{ font-size:14px;}
input{ vertical-align:middle; margin:0; padding:0}
.file-box{ position:relative; width:340px; margin:0 auto;}
.txt{ height:22px; border:1px solid #cdcdcd; width:180px;}
.file0{ position:absolute; top:5; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
.file1{ position:absolute; top:35px; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
.file2{ position:absolute; top:60px; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
.file3{ position:absolute; top:90px; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
.file4{ position:absolute; top:120px; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
.file5{ position:absolute; top:150px; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
</style>
<script type="text/javascript">
 //上传成功处理(用div方式)
 var yuan = window.dialogArguments;
 var filestr;
 
 function chuli(){
   test();
   window.returnValue=filestr;
   filestr="";
   window.close();
 }
</script>
<style type="text/css">
#shadowDiv {
 display: none;
 top: 0px : left : 0px;
 background-color: #FFF;
 filter: alpha(opacity = 70);
 opacity: 0.7;
 z-index: 65534
}
</style>
<script >
function test(){
  document.getElementById("shadowDiv").style.width ='100%';
  document.getElementById("shadowDiv").style.height ='100%';
  document.getElementById("shadowDiv").style.position ='absolute';
  document.getElementById("shadowDiv").style.top ='0px';
  document.getElementById("shadowDiv").style.left ='0px';
  document.getElementById("shadowDiv").style.display ='block';
} 
function flag(){
	var up=document.getElementsByName("upload");
	var flag=false;
	for(i=0;i<up.length;i++){
		if(up[i].value!=null && up[i].value!=""){
			document.getElementById("shadowDiv").style.width ='100%';
  			document.getElementById("shadowDiv").style.height ='100%';
  			document.getElementById("shadowDiv").style.position ='absolute';
  			document.getElementById("shadowDiv").style.top ='0px';
  			document.getElementById("shadowDiv").style.left ='0px';
  			document.getElementById("shadowDiv").style.display ='block';
 	 		flag=true;
			break;
		}
	}
		if(!flag){
		alert("请选择上传文件");
		}
	return flag;
}
</script>
</head>

<body >
<div class="file-box">
<form action="<%=basePath %>basic/sys/sysfileup_upload.action" name="form" method="post" enctype="multipart/form-data" target="ok" onsubmit="return flag();">
<table border="0" cellpadding="0" cellspacing="5">
<tr>
<td>
<input type='text' name='upload' id='up0' class='txt' />  
 <input type='button' class='btnStyle78PX' value='浏览...' />
 <input type="file" name="upload" class="file0" id="upload" size="28" onchange="document.getElementById('up0').value=this.value" />
</td>
</tr>
<tr>
<td>
<input type='text' name='upload' id='up1' class='txt' readonly/>  
 <input type='button' class='btnStyle78PX' value='浏览...' />
 <input type="file" name="upload" class="file1" id="upload" size="28" onchange="document.getElementById('up1').value=this.value" />
</td>
</tr>
<tr>
<td>
<input type='text' name='upload' id='up2' class='txt' readonly/>  
 <input type='button' class='btnStyle78PX' value='浏览...' />
 <input type="file" name="upload" class="file2" id="upload" size="28" onchange="document.getElementById('up2').value=this.value" />
</td>
</tr>
<tr>
<td>
<input type='text' name='upload' id='up3' class='txt' readonly/>  
 <input type='button' class='btnStyle78PX' value='浏览...' />
 <input type="file" name="upload" class="file3" id="upload" size="28" onchange="document.getElementById('up3').value=this.value" />
</td>
</tr>
<tr>
<td>
<input type='text' name='upload' id='up4' class='txt' readonly/>  
 <input type='button' class='btnStyle78PX' value='浏览...' />
 <input type="file" name="upload" class="file4" id="upload" size="28" onchange="document.getElementById('up4').value=this.value" />
</td>
</tr>
<tr>
<td height="30" align="center">
 <input type="hidden" name="filetype" value="<%=type %>" />
 <span class="btn"><input type="submit" name="submit" value="上传" /></span>
 <span class="btn"><input type="button" name="button" value="关闭窗口" onclick="window.close();" /></span>
</td>
</tr>
</table>
</form>
<iframe name="ok" id="ok" style="display:none;"></iframe>
</div>
<div id="shadowDiv">
<div  style='margin-top:150px;margin-left:200px;' >
</div>
</body>
</html>