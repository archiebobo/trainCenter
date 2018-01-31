<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/admin/common/css/style_sub.jsp"></jsp:include>

<script type="text/javascript">
var _projid = "${param.id}";
var _action = "${param.action}";
var _projname = GetQueryString("projname");
$(function(){
	if(_action=='add'){
		$("#edit").html("请填写体检项目信息");
		document.getElementById("ok").style.display="block";
		$("#fprojid").val(_projid);
		$("#fprojname").val(_projname);
		$("#form").attr("action","<%=basePath%>hos/tblCheckProj_insert.action");
	}
	if(_action=='update'){
		$("#edit").html("体检项目信息");
		document.getElementById("ok").style.display="block";
		$("#form").attr("action","<%=basePath%>hos/tblCheckProj_update.action");
	}
	if(_projid == ''||_action=='add')return;
	$.ajax({
		type : 'POST',
		url: '<%=basePath%>hos/tblCheckProj_findById.action?tblCheckProj.projid='+_projid,
		dataType:'json',
		success: function(json){
			$("#projid").val(json.data.projid);
			$("#projname").val(json.data.projname);
			$("#status").val(json.data.status);
			$("#unit").val(json.data.unit);
			$("#memo").val(json.data.memo);
			$("#projtype").val(json.data.projtype);
			$("#fprojid").val(json.data.fprojid);
			$("#fprojname").val(json.data.fprojname);
			$("#seqno").val(json.data.seqno);
			$("#remark").val(json.data.remark);
			}
	});	
});
</script>
</head>
<body>
	<div class="content_wrap">
		<div class="right" id="right_edit">
				<form action="<%=basePath%>score/tblCheckProj_update.action" id="form" method="post" onsubmit="return validData();">
					<div class="title" id="edit">体检项目</div>
					<div class="editorTab" style="width: 500px;">
						<table>
							<tbody>
			<tr>
						
						<th><font>*</font>体检项目名称</th>
						<td>
						<input type="hidden" name="tblCheckProj.projid" id="projid" readonly="readonly"/>
						<input type="text" name="tblCheckProj.projname" id="projname" value="${tblCheckProj.projname}" class="notNull_V" />
						</td>
						
						<th>状态</th>
						<td><select name="tblCheckProj.status" id="status">
								<option value="1">正常</option>
								<option value="2">停用</option>
						</select></td>
						</tr>
					<tr>
						<th>单位</th>
						<td><input type="text" name="tblCheckProj.unit" id="unit" value="${tblCheckProj.unit}"/>
						</td>
						
						
					<th>项目标志</th>
						<td><select name="tblCheckProj.projtype" id="projtype">
								<option value="0">非末级</option>
								<option value="1">末级</option>
						</select></td>
					</tr>
					<tr>
						<th><font>*</font>父项目名称</th>
						<td>
						<input type="text" id="fprojname" value="" readonly="readonly"/>
						<input type="hidden" name="tblCheckProj.fprojid" id="fprojid" value="${tblCheckProj.fprojid}"/></td>
						
						<th>备注</th>
						<td><input name="tblCheckProj.remark" value="${tblCheckProj.remark}" id="remark" maxlength="100" /></td>
						</tr>
					<tr>
						<th>排序级别</th>
						<td><input type="text" name="tblCheckProj.seqno" id="seqno" value="${tblCheckProj.seqno}"/>
						</td>
					</tr>
						<tr>
						<th>项目模本内容</th>
						<td colspan="6" >
						<div id="">
						<textarea rows="10" cols="50" name="tblCheckProj.memo" id="memo" value="${tblCheckProj.memo}"></textarea>
						</div>
						</td>
					</tr>
					<tr>
						<td colspan="6" align="center">
						
						<div id="ok" style="display:none">
						<span class="btn"><input type="submit" value="提交"/></span>
						</div>
						</td>
					</tr>
				</tbody>
					</table>
				</div>
			</form>
		</div>
		 
	 	
		
	</div>
</body>
</html>
