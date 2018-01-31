<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="UTF-8" >
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订餐系统</title>
<link rel="stylesheet" href="css/order_base.css" />
<link rev="stylesheet" media="all" href="<%=basePath%>js/loading/showLoading.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/lib/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/loading/jquery.showLoading.js"></script>
<script type="text/javascript" src="js/map.js"></script>
<object classid="clsid:F1317711-6BDE-4658-ABAA-39E31D3704D3" id="idcard" name='rdcard' codebase="SDRdCard.cab#version=1,0,98,0"/>

<script type="text/javascript">
	$(function (){
		 var date=new Date();
		 var year=date.getFullYear();
		 var mon = date.getMonth() + 1;
		 var day = date.getDate();
		 $("#nowdate").html(year+"-"+mon+"-"+day);
		 $("#nowdate").css({"width":"100%","background":"#E5F7FF","color":"#333","font-size":"22"});
		 setInterval(timeser,1000);		 
		 $("#clickButton").click(function (){
			  closePort(); 
			 var session_key;
			$("#body").css({"height":$(window).height(),"width":$(window).width()});
			 $('#body').showLoading({'addClass': 'loading-indicator'});
		 	$.ajax({
				  url:"https://localhost:8787/v4/device/open?port=100&psam_card_position=3",//打开端口
				  type: 'get',
			      dataType: "jsonp",
			      jsonp: "callback",
			      timeout:3000,
			      success:function(){
			    	  $.ajax({
			    		  url:"https://localhost:8787/v4/auth?termid=100",//授权
						  type: 'get',
					      dataType: "jsonp",
					      jsonp: "callback",
					      jsonpCallback:"test",
					      timeout:3000,
					      success:function(data){
					    	  session_key=data.session_key;
					    	  $.ajax({
								  url:"https://localhost:8787/v4/requestcard?session_key="+session_key,//寻卡
								  type: 'get',
							      dataType: "jsonp",
							      jsonp: "callback",
							      timeout:3000,
							      success:function(data){
							    	  $.ajax({
							    		  url:"https://localhost:8787/v4/readcard/"+data.cardphyid+"?session_key="+session_key+"&fields=CF_NAME%3BCF_STUEMPNO%3BCF_DEPTCODE%3BCF_CUSTID%3B",//寻卡
										  type: 'get',
									      dataType: "jsonp",
									      jsonp: "callback",
									      timeout:5000,
									      success:function(datas){
									    	  $("#departId").val(datas.CF_DEPTCODE);
									    	  $("#custid").val(datas.CF_CUSTID);
									    	  $("#user").submit();
									      },error:function(){
									    	  $("#tips").text("读卡失败，请查看是否读卡器出现损坏");
									    	  $('#body').hideLoading();
									      }
							    	  });
							      },error:function(){
							    	  $("#tips").text("请确保卡片已摆放读卡器上");
							    	  $('#body').hideLoading();
							      }
							});
					      },error:function(){
					    	  $("#tips").text("读卡失败，请查看是否读卡器出现损坏");
					    	  $('#body').hideLoading();
					      }
			    	  });
			      }
			});
	});
	});
	
	 function closePort(){
		 $.ajax({
				url:"https://localhost:8787/v4/device/close",//关闭端口
				type:"get",
				 dataType: "jsonp",
				jsonp:"callback",
				timeout:1000
				,error:function(){
					 $('#body').hideLoading();
				}
			});	
	 }
	 var backwards=61;
	 var register=30;
	 var lookTime=11;
	 function timeser(){
		 var timer=$("#detail").find("input[name='tblUser.stuempno']");
		if (timer.length>0) {
			if (backwards==0) {
				window.location.href = "<%=basePath%>";
			}else{
				backwards-=1;
				$("#clock").text("您本次操作时间还剩下："+backwards+"秒");
			}
		} else {
			var flag=$("#flag");
			var flags=$("#flags").val();
			if (flag.val()==1&&flags!=3) {
				if (register==0) {
					window.location.href = "<%=basePath%>";
				} else {
					register-=1;
					$("#clock").text("您本次操作时间还剩下："+register+"秒");
					var read=document.getElementById("idcard");
					var ret=read.readcard2();
					if(ret==0){
						if (!read.CardNo=="") {
							 $("#cardNo").val(read.CardNo);
							 read.ClearAll();
							 $("#user").submit(); 
						} 
					}
				}
			}else{
				if(flags!=""){
					if (lookTime==0) {
						window.location.href = "<%=basePath%>";
					}else{
						lookTime-=1;
						$("#clock").text("您本次操作时间还剩下："+lookTime+"秒");
					}
				}
			}
		}
	 }
	 
	function submitMeal(size,playId){
		var StringMessage="";
		for ( var i = 0; i < playId; i++) {
			if ($("#playList"+(i+1)).attr("checked")=="checked") {//最前面有选择
					 $("#tr"+(i+1)).find("input[name='tr"+ (i+1) +"']").each(function(io,val){
						 if ($("#tr"+(i+1)).attr("class")=="nodec"||$("#tr"+(i+1)).attr("class")=="") {
							if (io==0) {
								if ($(this).attr("checked")=="checked") {
									StringMessage+=$("#date"+i).val()+","+$(this).val(); 
								}else{
									StringMessage+=$("#date"+i).val()+","; 
								}
							}else if(io==size-1){
								if ($(this).attr("checked")=="checked"&&($("#tr"+(i+1)).attr("class")==""||$("#tr"+(i+1)).attr("class")=="nodec")) {
									StringMessage+=","+$(this).val()+";"; 
								}else{
									StringMessage+=";"; 
								}
							}else{
								if ($(this).attr("checked")=="checked"&&($("#tr"+(i+1)).attr("class")==""||$("#tr"+(i+1)).attr("class")=="nodec")) {
									StringMessage+=","+$(this).val(); 
								}
							}
						}else{
							if (io==0) {
								if ($(this).attr("checked")=="checked") {
									StringMessage+=$("#date"+i).val()+","+$(this).val(); 
								}else{
									StringMessage+=$("#date"+i).val(); 
								}
							}else if(io==size-1){
								if ($(this).attr("checked")=="checked") {
									StringMessage+=","+$(this).val()+";"; 
								}else{
									StringMessage+=";"; 
								}
							}else{
								if ($(this).attr("checked")=="checked") {
									StringMessage+=","+$(this).val(); 
								}
							}
						}
					}); 
			}else{
				 $("#tr"+(i+1)).find("input[name='tr"+ (i+1) +"']").each(function(io,val){
					 if ($("#tr"+(i+1)).attr("class")==""&&$(this).attr("checked")=="checked") {
						 if (io==0) {
							StringMessage+=$("#date"+i).val()+","+$(this).val(); 
						}else if(io==size-1){
							if ($(this).attr("checked")=="checked") {
								StringMessage+=","+$(this).val()+";"; 
							}else{
								StringMessage+=";"; 
							}
						}else{
							StringMessage+=","+$(this).val(); 
						}
					}else{
						if (io==0) {
							if ($("#tr"+(i+1)).attr("class")!=""&&$(this).attr("checked")=="checked") {
								StringMessage+=$("#date"+i).val()+","+$(this).val(); 
							} else {
								StringMessage+=$("#date"+i).val(); 
							}
						}else if (io==size-1) {
							if ($(this).attr("checked")=="checked") {
								StringMessage+=","+$(this).val()+";"; 
							} else {
								StringMessage+=";"; 
							}
						} else {
							if ($(this).attr("checked")=="checked") {
								StringMessage+=","+$(this).val();
							}
						}
					}
				});
			}
		}
		/* alert(StringMessage); */
		   if (StringMessage.length>0) {
			$("#message").val(StringMessage);
			$("#form").submit(); 
		}  
		
	}
	
	function clickAllCheckBox(max){
				for ( var i = 0; i < max; i++) {
				 if ($("#selectAll").attr("checked")=="checked") {
					 $("#tr"+(i+1)).find("input[name='tr"+ (i+1) +"']").each(function(){
						 if ($("#tr"+(i+1)).attr("class")!="nodec_c") {
							 $("#playList"+(i+1)).attr("checked",true);
							 $(this).attr("checked",true);
						}
					 });
				 }else {
					 $("#tr"+(i+1)).find("input[name='tr"+ (i+1) +"']").each(function(){
						 if ($("#tr"+(i+1)).attr("class")==""||$("#tr"+(i+1)).attr("class")=="nodec") {
							 $("#playList"+(i+1)).attr("checked",false);
							 $(this).attr("checked",false);
						}
					 });
				 }
				}
	}
	function clickChekcBox(index){
			 if ($("#playList"+(index+1)).attr("checked")=="checked") {
				 $("#tr"+(index+1)).find("input[name='tr"+ (index+1) +"']").each(function(){
					 $(this).attr("checked",true);
				 });
			 }else{
				 $("#tr"+(index+1)).find("input[name='tr"+ (index+1) +"']").each(function(){
					 $(this).attr("checked",false);
				 });
		}
	}
	function removeDisabled(index){
		 $("#tr"+index).find("input[name='tr"+ index +"']").each(function(){
			$(this).removeAttr("disabled");
			$("#tr"+index).removeClass("nodec_c");
			$("#playList"+index).removeAttr("disabled");
		}); 
		$("#tr"+index).find("span[name='spans"+ index + "']").each(function(){
			$(this).removeClass("nod ec");
			$(this).addClass("nodec");
		});
	}
</script>
</head>

<body id="body">
	<div class="hd">欢迎您！使用光宇个人订餐系统，多谢合作</div>
	<form action="dingchan/tblUser_queryUser.action" id="user"
		method="post" name="tcard">
		<div class="id_content">
			卡号&nbsp;<input type="text" readonly="readonly" name="custid" id="custid" value="${custid}" />&nbsp;&nbsp;
			工号&nbsp;<input type="text" readonly="readonly" value="${tblUser.stuempno}" name="tblUser.stuempno"
				id="workId" />&nbsp;&nbsp; 姓名&nbsp;<input type="text"
				readonly="readonly" name="tblUser.name" value="${tblUser.name }" id="name" />&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="hidden" name="tblUser.depart_id"  id="departId" />
			<input  type="hidden" value="${flag}" id="flags"/>
			<input type="hidden" name="cardNo" id="cardNo"  />
			<button class="btnn1" type="button" id="clickButton">读工卡</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="tip" id="tips" style="font-size: 15px;color: red;">${messageTips}</span>
		</div>
	</form>
	<div class="clock" style="height: 30px;"><span id="clock"></span></div>
	<div class="order_content">
		<div class="left">
			<form action="dingchan/tblOrderMeal_saveUserOrder.action" id="form"
				method="post">
				<fieldset>
					<legend>订餐/退餐</legend>
					<div class="detail">
						<table id="detail">
							<c:choose>
								<c:when test="${!empty tblUser }">
									<c:forEach var="c" items="${list}" varStatus="lists">
										<c:if test="${lists.first }">
											<tr class="all">
												<td colspan="5"><input type="hidden"
													name="tblUser.stuempno" value="${custid }" /> <input
													type="hidden" name="message" id="message" /> <input
													type="checkbox" id="selectAll"
													onclick="clickAllCheckBox(${fn:length(list)})" />全选</td>
											</tr>
										</c:if>
										<c:choose>
											<c:when test="${c.flag==0}">
												<tr id="tr${lists.index+1}" class="nodec">
													<td><input id="playList${lists.index+1}"
														onclick="clickChekcBox(${lists.index})"
														type="checkbox" /></td>
													<td><span
														style="background: #E5F7FF; width: 100%; font-size: 16px; color: black;">${c.date}</span></td>
													<td>${c.weekOfDay}</td>
													<td><input type="hidden" id="date${lists.index}"
														value="${c.date}" /> <c:forEach items="${c.list }"
															var="l" varStatus="status">
				 	 						${l.meal_name }
				 	 						 <input name="tr${lists.index+1}" id="break${l.mealid}${ lists.index}"
																		value="${l.mealid }" type="checkbox" />&nbsp;&nbsp;
														</c:forEach></td>
													<td><span  class="nodec">修改</span></td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr id="tr${lists.index+1}" class="nodec_c">
													<td><input id="playList${lists.index+1}" disabled
														onclick="clickChekcBox(${lists.index})"
														type="checkbox" /></td>
													<td><span
														style="background: #E5F7FF; width: 100%; font-size: 16px; color: black;">${c.date}</span></td>
													<td>${c.weekOfDay}</td>
													<td><input type="hidden" id="date${lists.index}"
														value="${c.date}" /> <c:forEach items="${c.list}" var="l"
															varStatus="status">
				 	 						${l.meal_name }
				 	 						 <input name="tr${lists.index+1}" id="break${l.mealid}${lists.index}" disabled
																value="${l.mealid }" type="checkbox" 
																<c:if test="${l.checked==1}">
																	checked=checked
																</c:if>
																
																/>&nbsp;&nbsp;
														</c:forEach></td>
													<td><span class="nod ec" name="spans${lists.index+1}"
														id="span${c.size}${lists.index+1}"
														onclick="removeDisabled(${lists.index+1})">修改</span></td>
												</tr>
											</c:otherwise>
										</c:choose>
										<c:if test="${lists.last}">
											<tr>
												<td colspan="6"><button type="button" id="checkSubmit"
														onclick="submitMeal(${c.size},${lists.index+1})">确定订餐</button></td>
											</tr>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="all">
										<td colspan="5"><input type="checkbox" id="selectAll" />全选</td>
									</tr>
									<tr>
										<td><input id="playList" name="playList" type="checkbox" /></td>
										<td><span id="nowdate" style="font-size: 22px"></span></td>
										<td>星期一</td>
										<td><label for="break1">早餐</label><input id="break"
											type="checkbox" />&nbsp;&nbsp; <label for="lunch1">午餐</label><input
											id="lunch" type="checkbox" />&nbsp;&nbsp; <label
											for="dinner1">晚餐</label><input id="dinner" type="checkbox" />
										</td>
										<td><span class="nodec">修改</span></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="right">
			<form >
				 <fieldset  style="background: #E5F7FF;">
				  <legend>订单详情</legend>
				 <table border="0" cellspacing="0" style="margin:10px 0px;"  id="orderList">
				<thead>
					<tr>
						<td>编号</td>
						<td>姓名</td>
						<td>日期</td>
						<td>星期</td>
						<td>订餐情况</td>
						<td>部门</td>
					</tr>
				</thead>
				<tbody >
				<c:choose>
					<c:when test="${!empty tblUser }">
						<input type="hidden" id="flag" value="1"/>
					</c:when>
					<c:otherwise>
						<input type="hidden" id="flag" value="2"/>
					</c:otherwise>
				</c:choose>
					<c:forEach items="${listUser}" var="l" varStatus="list">
						<c:if test="${list.first}"></c:if>
						<tr>
							<td>${l. stuempno }</td>
							<td>${l. name}</td>
							<td>${l.accdate }</td>
							<td>${l. weekName}</td>
							<td>${l. meal_name}</td>
							<td>${l. depart_name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</fieldset>
	</form>
	</div>
</body>
</html>