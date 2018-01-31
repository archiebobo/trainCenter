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
var _batchno = "${param.batchno}";
//返回列表
function reset(){
	window.location.href = "<%=basePath%>manager/manager-tblCheckInputDtl/tblCheckInputDtl-add.jsp";
}
$(function (){
	//alert(_batchno);
	$("#stuempno").val(_id);
	$("#batc").val(_batchno);
	loadData();
	findMuban();
	SpanGrid(table1,0);
	SpanGrid(table2,0);
	findDtl();
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
					$("#batchno").val($("#batc").val());
					$("#batchno1").val($("#batchno").find("option:selected").text());
				}
			}
			
		});		
	}
function findMuban(){
	 //if(_id == '')return;
	 $("#bat").empty();
	 $("#bat1").empty();
	 $("#doctormemo").val("");
	 $("#doctormemo1").val("");
	 $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckDoctorSumary_findMuban.action?ct='+new Date(),
			dataType:'json',
			success: function(json){
				if(json.resultCode=='0'){
					//alert(json.list.length);
					$("#bat").append("<option value=" + " " + ">" + "-请选择-" + "</option>");
					$("#bat1").append("<option value=" + " " + ">" + "-请选择-" + "</option>");
					for(var i=0;i<json.list.length;i++){
						var obj = json.list[i];
						$("#bat").append("<option value=" + obj.dcsummaryid + ">" + obj.summaryname + "</option>");
						$("#bat1").append("<option value=" + obj.dcsummaryid + ">" + obj.summaryname + "</option>");
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
					
					if($("#doctormemo").val()!=""&&dcsummaryid!=""){
						//alert($("#doctormemo").val());
						$("#doctormemo").val($("#doctormemo").val()+json.data.memo);
					}else{
						$("#doctormemo").val(json.data.memo);
					}
					
				}
			}
		});		
	}
function changeMuban1(){
	var dcsummaryid = $("#bat1").val();
	 //if(_id == '')return;
	$.ajax({
		type : 'POST',
		url: '<%=basePath%>hos/tblCheckDoctorSumary_findById.action?tblCheckDoctorSumary.dcsummaryid='+dcsummaryid,
		dataType:'json',
		success: function(json){
			if(json.resultCode=='0'){
				if($("#doctormemo1").val()!=""&&dcsummaryid!=""){
					//alert($("#doctormemo").val());
					$("#doctormemo1").val($("#doctormemo1").val()+json.data.memo);
				}else{
					$("#doctormemo1").val(json.data.memo);
				}
			}
		}
	});		
	}
    
function findDtl(){
	 //if(_id == '')return;
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
	   	   				$("#addr").html(json.data.addr);
	   	   				$("#unit").html(json.data.unit);
		   				$("#majo").html(json.data.majo);
		   				$("#custid1").val(json.data.custid);
	   	   				$("#custname1").html(json.data.custname);
	   	   				$("#addr1").html(json.data.addr);
	   	   				$("#unit1").html(json.data.unit);
		   				$("#majo1").html(json.data.majo);
	   				}
	   			 var parms={};
	   		  parms["tblCheckInputDtl.stuempno"] = $("#stuempno").val();
	   		  parms["tblCheckInputDtl.batchno"] = $("#batc").val();
	   			 $.ajax({
	   				type : 'POST',
	   				url: '<%=basePath%>hos/tblCheckInputDtl_findDtl.action',
	   				dataType:'json',
	   				data: parms,
	   				success: function(json){
	   					if(json.resultCode=='0'){
	   						var _html1="";
	   						var _html2="";
	   						if(json.list.length>0){
	   							for ( var i = 0; i < json.list.length; i++) {
	   								if(json.list[i].inputcnt=="1"){
	   									
	   									_html1+="<tr id='a'><th>"+json.list[i].fprojname+"</th><th>"+json.list[i].projname+"</th><td><input id='"+i+"' name='memos1' value='"+json.list[i].memo+"'/><input type='hidden' name='projids1' value='"+json.list[i].projid+"'/></td></tr>";
	   									
	   								}else{
	   									_html2+="<tr id='b'><th>"+json.list[i].fprojname+"</th><th>"+json.list[i].projname+"</th><td><input id='"+i+"' name='memos2' value='"+json.list[i].memo+"'/><input type='hidden' name='projids2' value='"+json.list[i].projid+"'/></td></tr>";
	   									//style=\"color: red\"
	   								}
	   									
	   							}
	   							for(var i = 0; i < 100; i++){
	   								$("#a").remove();
	   								$("#b").remove();
	   								}
	   							
	   								$("#tr1").after(_html1);
	   								$("#tr2").after(_html2);
	   								SpanGrid(table1,0);
	   								SpanGrid(table2,0);
	   								change();
	   							}
	   						else{
	   							for(var i = 0; i < 100; i++){
	   								$("#a").remove();
	   								$("#b").remove();
	   								}
	   							}
	   					}
	   				},error: function(XMLHttpRequest, textStatus, errorThrown) {
	   	                alert(XMLHttpRequest.status);
	   	                alert(XMLHttpRequest.readyState);
	   	                alert(textStatus);
	   	            }
	   				
	   			});	
	   			}
	   		});
		
	}
function change() {
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
	
function check() {
	 //alert($("input[name='flag']:checked").val());
	var valus = document.getElementsByName("memos1");
	  if(valus.length!=0){
	  var str1 = "";
	  for(var i=0;i<valus.length;i++){
	  str1+= valus[i].value+",";
   	  }
	  }
	  var valu = document.getElementsByName("memos2");
	  if(valu.length!=0){
	  var str2 = "";
	  for(var i=0;i<valus.length;i++){
	  str2+= valu[i].value+",";
   	  }
	  }
	  var valu = document.getElementsByName("projids1");
	  if(valu.length!=0){
	  var str3 = "";
	  for(var i=0;i<valus.length;i++){
	  str3+= valu[i].value+",";
   	  }
	  }
	  var valu = document.getElementsByName("projids2");
	  if(valu.length!=0){
	  var str4 = "";
	  for(var i=0;i<valus.length;i++){
	  str4+= valu[i].value+",";
   	  }
	  }
	  //alert($("#doctormemo").val());
	  
	  var parms={};
	  parms["tblCheckInputokInfo.custid"] = $("#custid").val();
	  parms["tblCheckInputokInfo.batchno"] = $("#batchno").val();
	  parms["tblCheckInputokInfo.chk1or2"] = $("input[name='flag']:checked").val();
	  if($("input[name='flag']:checked").val()==1){
		  parms["tblCheckInputokInfo.memos"] = str1;
		  parms["tblCheckInputokInfo.projids"] = str3;
		  if($("#doctormemo").val()==""){
			  alert("请输入医师意见！");
			  return ;
		  }else{
			  parms["tblCheckInputokInfo.doctormemo"] = $("#doctormemo").val();
		  }
		  parms["tblCheckInputokInfo.remark"] = $("#remark").val();
	  }else if($("input[name='flag']:checked").val()==2){
		  parms["tblCheckInputokInfo.memos"] = str2;
		  parms["tblCheckInputokInfo.projids"] = str4;
		  if($("#doctormemo1").val()==""){
			  alert("请输入医师意见！");
			  return ;
		  }else{
			  parms["tblCheckInputokInfo.doctormemo"] = $("#doctormemo1").val();
		  }
		  //parms["tblCheckInputokInfo.doctormemo"] = $("#doctormemo1").val();
		  parms["tblCheckInputokInfo.remark"] = $("#remark1").val();
	  }
	  $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckInputokInfo_insert.action',
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
function re(){
	window.location.href = "<%=basePath%>hos/tblCheckInputInfo_query.action";
}
function findNextStu(){
	//window.location.reload();
     var id = $("#stuempno").val();
     var id2 = $("#batchno").val();
	 $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckInputInfo_findNextStu.action?id='+id+'&id2='+id2,
			dataType:'json',
			beforeSend:function(){
				   $('body').showLoading({'addClass': 'loading-indicator'});
			   },
			   complete:function(){
				   $('body').hideLoading();
			   },
			success: function(json){
				if(json.resultCode=='0'){
					$("#stuempno").val(json.data.stuempno);
					$("#batchno").val(json.data.batchno);
					findDtl();
					findMuban();
				}else{
					alert("已经是最后一个学生了！");
				}
			}
		});
}
</script>
</head>
<body>
	<div class="title">体检信息审核</div>
	<form action="<%=basePath%>hos/tblCheckInputDtl_insert.action" id="form" method="post" onsubmit="return validData()">
	<div class="searchTab" style="width: 90%">
  <table>
    <tr>	
					<td style="display: none;">
					<select name="tblCheckInputDtl.batchno" id="batchno">
    					<option value="">-请选择-</option>
    				</select>
    				</td>
    				<td>
    				<input type="hidden" name="tblCheckInputDtl.batchno" id="batc" value="${tblCheckInputDtl.batchno}"/>
    				批次<input type="text" name="" id="batchno1" value="" readonly="readonly"/>
    				<font>*</font>学工号<input type="text" name="tblCheckInputDtl.stuempno" id="stuempno" value="${tblCheckInputDtl.stuempno}" readonly="readonly"/>
					
					<%-- <span class="btn"><input type="button" value="查询" onclick="findDtl();"/></span> --%>
	  </td>
    </tr>
  </table>

	<div class="editorTab" style="width: 50%;float: left;">
		<table id="table1">
			<tbody>
				<tr>
				<th>学生信息</th>
					<th>姓名</th>
					<td>
					<input type="hidden" name="tblCheckInputDtl.custid" id="custid" value="${tblCheckInputDtl.custid}"/>
					<div style="float: left; width:150px"  id="custname">
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
					<tr id="tr1">
					<th>学生信息</th>
					<th>班级</th>
					<td>
					<div style="float: left; width:40%"  id="addr">
			    	</div>
					</td>
					</tr>
				<tr>
				<th></th>
					<th>医生意见模板</th>
					<td >
						<select name="tblCheckInputDtl.bat" id="bat" onchange="changeMuban()">
    					<option value="">-请选择-</option>
    				</select>
						</td>
				</tr>
				<tr>
				<th></th>
					<th>意见</th>
					<td colspan="6" >
						<div id="">
						<textarea rows="10" cols="25" name="tblCheckInputDtl.doctormemo" id="doctormemo" value="${tblCheckInputDtl.doctormemo}"></textarea>
						</div>
						</td>
				</tr>
				<tr>
					<th></th>
					<th>备注</th>
					<td>
						<input type="text" name="tblCheckInputDtl.remark" id="remark" value="${tblCheckInputDtl.remark}"/>
					</td>
				</tr>
				
			</tbody>
		</table>
		<div class="btns">
		第一次录入<input name="flag" id="flag" type="radio" checked="checked" value="1"/>
	</div>
	<div class="btns" style="float: right;">
		<span class="btn"><input type="button" value="审核通过" onclick="check();"/></span>
		<span class="btn"><input type="button" value="返回" onclick="javascript:history.go(-1)"/></span>
		<span class="btn"><input type="button" value="下一个" onclick="findNextStu();"/></span>
	</div>
	</div>
	<div class="editorTab" style="width: 45%;float:left;">
		<table id="table2">
			<tbody>
				<tr>
				<th>学生信息</th>
					<th>姓名</th>
					<td>
					<input type="hidden" name="tblCheckInputDtl.custid" id="custid1" value="${tblCheckInputDtl.custid}"/>
					<div style="float: left; width:150px"  id="custname1">
			    	</div>
					</td>
				</tr>
				<tr>
				<th>学生信息</th>
					<th>学院</th>
					<td>
					<div style="float: left; width:40%"  id="unit1">
			    	</div>
					</td>
				</tr>
				<tr>
					<th>学生信息</th>
					<th>专业</th>
					<td>
					<div style="float: left; width:40%"  id="majo1">
			    	</div>
					</td>
					</tr>
					<tr id="tr2">
					<th>学生信息</th>
					<th>班级</th>
					<td>
					<div style="float: left; width:40%"  id="addr1">
			    	</div>
					</td>
					</tr>
				<tr>
				<th></th>
					<th>医生意见模板</th>
					<td >
						<select name="tblCheckInputDtl.bat" id="bat1" onchange="changeMuban1()">
    					<option value="">-请选择-</option>
    				</select>
						</td>
				</tr>
				<tr>
				<th></th>
					<th>医生意见</th>
					<td colspan="6" >
						<div id="">
						<textarea rows="10" cols="25" name="tblCheckInputDtl.doctormemo" id="doctormemo1" value="${tblCheckInputDtl.doctormemo}"></textarea>
						</div>
						</td>
				</tr>
				<tr>
					<th></th>
					<th>备注</th>
					<td>
						<input type="text" name="tblCheckInputDtl.remark" id="remark1" value="${tblCheckInputDtl.remark}"/>
					</td>
				</tr>
				
			</tbody>
		</table>
		<div class="btns">
		第二次录入<input name="flag" id="flag2" type="radio" value="2"/>
	</div>
	</div>
	</div>
	</form>
</body>
</html>
