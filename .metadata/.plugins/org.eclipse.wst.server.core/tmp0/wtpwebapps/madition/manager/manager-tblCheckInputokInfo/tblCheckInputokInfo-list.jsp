<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
function dtl(inputid){
	 $.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckInputokInfo_findMemo.action?tblCheckInputokInfo.inputid='+inputid,
			dataType:'json',
			success: function(json){
				if(json.resultCode=='0'){
					var _html1="";
						var _html2="";
						if(json.list.length>0){
							for ( var i = 0; i < json.list.length; i++) {
									
									_html1+="<td id='a'>"+json.list[i].projname+"</td>";
									
									_html2+="<td id='b'>"+json.list[i].memo+"</td>";
									//style=\"color: red\"
							}
							for(var i = 0; i < 100; i++){
  								$("#a").remove();
  								//$("#b").remove();
  								}
  								$("#projname").after(_html1);
  								$("#"+inputid+"").after(_html2);
  							}
							}
				}
		});		
	}
function del(){
	for(var i = 0; i < 100; i++){
			$("#a").remove();
			$("#b").remove();
			}
}
function loadData(){
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
				$("#batchno").val($("#bat").val());
			}
		});		
	}
function changge(){
	$("#bat").val($("#batchno").find("option:selected").val());
}
function expor(){
	var batchno=$("#batchno").val();
	var stuempno=$("#stuempno").val();
	var custname=$("#custname").val();
	var unit=$("#unit").val();
	var time=$("#time").val();
	 	$.ajax({
			type : 'POST',
			url: '<%=basePath%>hos/tblCheckInputokInfo_judgeListLength.action?tblCheckInputokInfo.batchno='+batchno+'&tblCheckInputokInfo.stuempno='+stuempno+'&tblCheckInputokInfo.custname='+custname+'&tblCheckInputokInfo.unit='+unit,
			dataType:'json',
			beforeSend:function(){
				   $('body').showLoading({'addClass': 'loading-indicator'});
			   },
			   complete:function(){
				   $('body').hideLoading();
			   },
			success: function(json){
				if (json.resultCode==0) {
					var url="<%=basePath%>hos/tblCheckInputokInfo_expor.action?tblCheckInputokInfo.batchno="+batchno+"&tblCheckInputokInfo.stuempno="+stuempno+"&tblCheckInputokInfo.custname="+custname+"&tblCheckInputokInfo.unit="+unit+"&tblCheckInputokInfo.time="+time;
					window.location.href=url;
				} else {
					alert(json.resultMsg);
				}
			}
		});	  
	}
function update(id,stuempno){
	window.location.href = "<%=basePath%>manager/manager-tblCheckInputokInfo/tblCheckInputokDtl-dtl.jsp?id="+id+"&stuempno="+stuempno;
}
function gotoExpor(){
	var batchno=$("#batchno").val();
	var stuempno=$("#stuempno").val();
	var custname=$("#custname").val();
	var unit=$("#unit").val();
	var time=$("#time").val();
	var url="<%=basePath%>hos/tblCheckInputokInfo_gotoExpor.action?tblCheckInputokInfo.batchno="+batchno+"&tblCheckInputokInfo.stuempno="+stuempno+"&tblCheckInputokInfo.custname="+custname+"&tblCheckInputokInfo.unit="+unit+"&tblCheckInputokInfo.time="+time;
		window.location.href=url;
	}
</script>
</head>
<body>
<form action="<%=basePath%>hos/tblCheckInputokInfo_query.action" id="form1" method="post">
<div class="searchTab">
  <table>
    <tr>
      <th> 学工号</th>
      <td>
     <input type="text" name="tblCheckInputokInfo.stuempno" id="stuempno" value="${tblCheckInputokInfo.stuempno}"/>
     姓名<input type="text" name="tblCheckInputokInfo.custname" id="custname" value="${tblCheckInputokInfo.custname}"/>
     学院<input type="text" name="tblCheckInputokInfo.unit" id="unit" value="${tblCheckInputokInfo.unit}"/>
      	批次号<select name="tblCheckInputokInfo.batchno" id="batchno" onchange="changge()">
    					<option value="">-请选择-</option>
    				</select>
   <input type="hidden" name="" id="bat" value="${tblCheckInputokInfo.batchno}"/>
  体检时间<input type="text" name="tblCheckInputokInfo.time" id="time" value="${tblCheckInputokInfo.time}"/>
		 <span class="btn"><input type="submit" value="查询"/></span> 
		 <span class="btn"><input type="button" value="导出pdf" onclick="expor()"/></span>
		 <span class="btn"><input type="button" value="导出excel" onclick="gotoExpor()"/></span>
	  </td>
    </tr>
  </table>
</div>
<!--查询条件表格-->

<div class="listTab">
  <table>
    <thead>
      <tr>
      	<td style="display: none">序号</td>
        <td>学工号</td>
        <td>姓名</td>
        <td>学院</td>
        <td>批次名称</td>
        <td>审核人员</td>
        <td>审核日期</td>
        <td>审核时间</td>
        <td id="projname">审核意见</td>
        <td>操作</td>
      </tr>
    </thead>
    <s:iterator value="%{pm.list}" status="list">
    <tr>
    	<td style="display: none">${inputid }</td>
    	<td>${stuempno }</td>
    	<td>${custname }</td>
    	<td>${unit }</td>
      	<td>${batchname }</td>
      	<td>${name }</td>
      	<td>${chkdate }</td>
      	<td>${chktime }</td>
      	<td id="${inputid }">${doctormemo }</td>
        <td>
        <a href="javascript:update('${inputid}','${stuempno}');" class="modi" title="点击收回">修改</a>
        <a href="javascript:dtl('${inputid}');" class="modi" title="点击展开">展开</a>
        <a href="javascript:del();" class="modi" title="点击收回">收回</a>
        </td>
      </tr>
      </s:iterator>
      <s:if test="%{pm.list.size==0}">
		<tr>
			<td colspan="7"><font>暂时没有内容信息</font></td>
		</tr>
	 </s:if>
  </table>
</div>

<s:if test="%{pm!=null}">
<!--查询列表格（点击行查看详细信息，并有查看详细信息提示，及行信息鼠标成手型）-->
<jsp:include page="/admin/common/pagemodel.jsp"></jsp:include>
</s:if>
</form>
</body>
</html>
