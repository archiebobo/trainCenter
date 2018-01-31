<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>
<script language="javascript">
$(function (){
	loadData();
});
function loadData(){
	 //if(_id == '')return;
	 $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckBatchset_findBatch.action?ct='+new Date(),
			dataType:'json',
			success: function(json){
				if(json.resultCode=='0'){
					for(var i=0;i<json.list.length;i++){
						var obj = json.list[i];
						$("#batchno").append("<option value=" + obj.batchno + ">" + obj.batchname + "</option>");
					}
				}
			}
		});		
	}
<%-- $(function(){
	$("#stuempno").each(function(){ //开始遍历
    $(this).blur(function(){
    if($(this).val().length>0){
    var stuempno = $("#stuempno").val();
   	$.ajax({
   			type : 'POST',
   			url: '<%=basePath%>hos/tblCheckCustomer_findByStuempno.action?tblCheckCustomer.stuempno='+stuempno,
   			dataType:'json',
   			success: function(json){
   				if(json.data==""){
   					alert("账号不存在，或者输入错误！");
   				}else{
   					$("#custid").val(json.data.custid);
   	   				$("#custname").html(json.data.custname);
   	   				$("#area").html(json.data.area);
   	   				$("#unit").html(json.data.unit);
	   				$("#majo").html(json.data.majo);
	   				$("#addr").html(json.data.addr);
   				}
   			}
   		});
    	//$(this).val($val)
    	} //失去焦点时进行判断，如果value值的长度等于0（也就是空的时候，//没有输入内容的清空下），将原先保存的value值写入
    	else if($(this).val().length==0){
    		alert("请输入账户号！");
    	}
    })
    });
    }) --%>
    
function findProject(){
	 //if(_id == '')return;
	  var batchno = $("#batchno").val();
	 $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckProjbatch_findProject.action?TblCheckProjbatch.batchno='+batchno,
			dataType:'json',
			success: function(json){
				if(json.resultCode=='0'){
					var _html="";
					if(json.list.length>0){
						for ( var i = 0; i < json.list.length; i++) {
								_html+="<tr id='a'><th>"+json.list[i].fprojname+"</th><th>"+json.list[i].projname+"</th><td><input name='memos' value='"+json.list[i].memo+"'/><input type='hidden' name='projids' value='"+json.list[i].projid+"'/></td></tr>";
								
						}
						for(var i = 0; i < 100; i++){
							$("#a").remove();
							}
						
							$("#tr").after(_html);
							SpanGrid(table1,0);
						}
					else{
						for(var i = 0; i < 100; i++){
							$("#a").remove();
							}
						}
				}
			}
		});		
	}
function add() {
	var valus = document.getElementsByName("memos");
	  if(valus.length!=0){
	  var str1 = "";
	  for(var i=0;i<valus.length;i++){
	  str1+= valus[i].value+",";
   	  }
	  }
	  var valu = document.getElementsByName("projids");
	  if(valu.length!=0){
	  var str2 = "";
	  for(var i=0;i<valus.length;i++){
	  str2+= valu[i].value+",";
   	  }
	  }
	  if($("#batchno").val()==""){
		  alert("请选择批次！");
		  return ;
	  }
	  if($("#custid").val()==""){
		  alert("请选择学生！");
		  return ;
	  }
	  var parms={};
	  parms["tblCheckInputInfo.memos"] = str1;
	  parms["tblCheckInputInfo.projids"] = str2;
	  parms["tblCheckInputInfo.custid"] = $("#custid").val();
	  parms["tblCheckInputInfo.batchno"] = $("#batchno").val();
	  parms["tblCheckInputInfo.remark"] = $("#remark").val();
	  $.ajax({
 			type : 'POST',
 			url: '<%=basePath%>hos/tblCheckInputInfo_insert.action',
 			data: parms,
 			dataType:'json',
 			success: function(json){
 				if(json.resultCode=='0'){
				alert(json.resultMsg);
 				}else{
 					alert(json.resultMsg);
 				}
 			}
 		});
}
function SpanGrid(tabObj,colIndex){
	if(tabObj != null){ 
		var i,j; 
		var intSpan; 
		var strTemp; 
		for(i = 0; i < tabObj.rows.length; i++){  
			intSpan = 1;  
			strTemp = tabObj.rows[i].cells[colIndex].innerText;  
			for(j = i + 1; j < tabObj.rows.length; j++){  
				if(strTemp == tabObj.rows[j].cells[colIndex].innerText){   
					intSpan++;    
					tabObj.rows[i].cells[colIndex].rowSpan  = intSpan;   
					tabObj.rows[j].cells[colIndex].style.display = "none";    
					}else{  
						break;     } 
				}    i = j - 1;   } 
		}
	}
function find(){
	var stuempno = $("#stuempno").val();
	if(stuempno==""||stuempno==null){
		alert("请输入账户号！");
		return ; 
	}
   	$.ajax({
   			type : 'POST',
   			url: '<%=basePath%>hos/tblCheckCustomer_findByStuempno.action?tblCheckCustomer.stuempno='+stuempno,
   			dataType:'json',
   			success: function(json){
   				if(json.data==""){
   					alert("账号不存在，或者输入错误！");
   				}else{
   					$("#custid").val(json.data.custid);
   	   				$("#custname").html(json.data.custname);
   	   				$("#area").html(json.data.area);
   	   				$("#unit").html(json.data.unit);
	   				$("#majo").html(json.data.majo);
	   				$("#addr").html(json.data.addr);
   				}
   			}
   		});
	}
//返回列表
function re(){
	window.location.reload();
	//window.location.href = window.location.href;
}
</script>
</head>
<body onload="SpanGrid(table1,0)">
	<div class="title">体检信息录入</div>
	<form  style="width: 40%" action="<%=basePath%>hos/tblCheckInputInfo_insert.action" id="form" method="post" onsubmit="return validData()">
	<div class="editorTab">
		<table id="table1">
			<tbody>
			<tr>	<th></th>
					<th><font>*</font>批次</th>
					<td>
					<select name="tblCheckInputInfo.batchno" id="batchno" onchange="findProject()">
    					<option value="">-请选择-</option>
    				</select>
					</td>
				</tr>
				<tr>
					<th>学生信息</th>
					<th><font>*</font>学工号</th>
					<td>
						<input type="text" name="tblCheckInputInfo.stuempno" id="stuempno" value="${tblCheckInputInfo.stuempno}"/>
					<input type="hidden" name="tblCheckInputInfo.custid" id="custid" value="${tblCheckInputInfo.custid}"/>
					<span class="btn"><input type="button" value="查询" onclick="find();"/></span>
					</td>
					</tr>
				<tr>
				<th>学生信息</th>
					<th>姓名</th>
					<td>
					<div style="float: left; width:150px"  id="custname">
			    	</div>
					</td>
				</tr>
				<tr>
					<th>学生信息</th>
					<th>校区</th>
					<td>
					<div style="float: left; width:40%"  id="area">
			    	</div>
					</td>
					</tr>
				<tr>
				<th>学生信息</th>
					<th>学院</th>
					<td>
					<div style="float: left; width:40%"  id="unit">
			    	</div>
					</td>
				</tr>
				<tr>
					<th>学生信息</th>
					<th>专业</th>
					<td>
					<div style="float: left; width:40%"  id="majo">
			    	</div>
					</td>
					</tr>
				<tr id="tr">
				<th>学生信息</th>
					<th>班级</th>
					<td>
					<div style="float: left; width:40%"  id="addr">
			    	</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btns">
		<span class="btn"><input type="button" value="提交" onclick="add();"/></span>
		<span class="btn"><input type="button" value="清空" onclick="re();"/></span>
	</div>
	</form>
</body>
</html>
