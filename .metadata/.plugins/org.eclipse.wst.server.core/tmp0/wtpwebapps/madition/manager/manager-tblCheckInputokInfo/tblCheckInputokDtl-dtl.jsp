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
var _id = "${param.id}";
var _stuempno = "${param.stuempno}";
//返回列表
function reset(){
	window.location.href = "<%=basePath%>manager/manager-tblCheckInputDtl/tblCheckInputDtl-add.jsp";
}
$(function (){
	/* loadData();
	findMuban(); */
	SpanGrid(table1,0);
	findDtl();
	/* SpanGrid(table2,0); */
});
<%-- function loadData(){
	 //if(_id == '')return;
	 $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckBatchset_findBatch.action',
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
function findMuban(){
	 //if(_id == '')return;
	 $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckDoctorSumary_findMuban.action?ct='+new Date(),
			dataType:'json',
			success: function(json){
				if(json.resultCode=='0'){
					for(var i=0;i<json.list.length;i++){
						var obj = json.list[i];
						$("#bat").append("<option value=" + obj.dcsummaryid + ">" + obj.summaryname + "</option>");
						}
				}
			},error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }

		});		
	}
function changeMuban(){
	var dcsummaryid = $("#bat").val();
	 //if(_id == '')return;
	 $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckDoctorSumary_findById.action?tblCheckDoctorSumary.dcsummaryid='+dcsummaryid,
			dataType:'json',
			success: function(json){
				if(json.resultCode=='0'){
					$("#doctormemo").val(json.data.memo);
				}
			},error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
		});		
	} --%>
function findDtl(){
	 //if(_id == '')return;
	 // var stuempno = $("#stuempno").val();
	   	$.ajax({
	   			type : 'POST',
	   			url: '<%=basePath%>hos/tblCheckCustomer_findByStuempno.action?tblCheckCustomer.stuempno='+_stuempno,
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
	   				}
	   			 var parms={};
	   		  parms["tblCheckInputokDtl.inputid"] = _id;
	   			 $.ajax({
	   				type : 'POST',
	   				url: '<%=basePath%>hos/tblCheckInputokDtl_findDtl.action',
	   				dataType:'json',
	   				data: parms,
	   				success: function(json){
	   					if(json.resultCode=='0'){
	   						var _html1="";
	   						if(json.list.length>0){
	   							for ( var i = 0; i < json.list.length; i++) {
	   									_html1+="<tr id='a'><th>"+json.list[i].fprojname+"</th><th>"+json.list[i].projname+"</th><td><input id='"+i+"' name='memos1' value='"+json.list[i].memo.trim()+"'/><input type='hidden' name='projids1' value='"+json.list[i].projid+"'/></td></tr>";
	   							}
	   							for(var i = 0; i < 100; i++){
	   								$("#a").remove();
	   								}
	   							
	   								$("#tr1").after(_html1);
	   								SpanGrid(table1,0);
	   								/* change(); */
	   							}
	   						else{
	   							for(var i = 0; i < 100; i++){
	   								$("#a").remove();
	   								}
	   							}
	   					}
	   				}
	   				,error: function(XMLHttpRequest, textStatus, errorThrown) {
	   					alert("dtl");
	   	                alert(XMLHttpRequest.status);
	   	                alert(XMLHttpRequest.readyState);
	   	                alert(textStatus);
	   	            }
	   			});	
	   			}
	   			,error: function(XMLHttpRequest, textStatus, errorThrown) {
	                alert(XMLHttpRequest.status);
	                alert(XMLHttpRequest.readyState);
	                alert(textStatus);
	            }
	   		});
		
	}
/* function change() {
	var valus = document.getElementsByName("memos1");
	var valu = document.getElementsByName("memos2");
	  if(valus.length!=0){
		  if(valu.length!=0){
	  		var str1 = "";
	  		var str2 = "";
	  	for(var i=0;i<valus.length;i++){
	  		if(valu[i].value!=valus[i].value){
	  			document.getElementById(2*i).style.color="red";
	  			document.getElementById(2*i+1).style.color="red";
	  		}
	   	  }
		  }
	  }
	  
} */
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
	
function update() {
	 //alert($("input[name='flag']:checked").val());
	var valus = document.getElementsByName("memos1");
	  if(valus.length!=0){
	  var str1 = "";
	  for(var i=0;i<valus.length;i++){
	  str1+= valus[i].value+",";
   	  }
	  }
	  var valu = document.getElementsByName("projids1");
	  if(valu.length!=0){
	  var str3 = "";
	  for(var i=0;i<valus.length;i++){
	  str3+= valu[i].value+",";
   	  }
	  }
	 /*  var b = valus.length-1;
	  alert(b);
	  var a = document.getElementById(b);
	  alert(a); */
	  var parms={};
	  parms["tblCheckInputokDtl.inputid"] = _id;
	  parms["tblCheckInputokDtl.memos"] = str1;
	  parms["tblCheckInputokDtl.projids"] = str3;
	  $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckInputokDtl_updateDtl.action',
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
//返回列表
function tolist(){
	window.location.href = "<%=basePath%>hos/tblCheckInputokInfo_query.action";
}
</script>
</head>
<body>
	<form  id="form" method="post" onsubmit="return validData()">
	<div class="searchTab" style="width: 90%">
  <table>
  </table>

	<div class="editorTab" style="width: 50%;float: left;">
		<table id="table1">
			<tbody>
				<tr id="tr1">
					<th>体检信息修改</th>
					</tr>
				
			</tbody>
		</table>
	<div class="btns" style="float: right;">
		<span class="btn"><input type="button" value="提交" onclick="update();"/></span>
		<span class="btn"><input type="button" value="返回" onclick="javascript:history.go(-1)"/></span>
	</div>
	</div>
	</div>
	</form>
</body>
</html>
