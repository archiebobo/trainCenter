<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="<%=basePath%>js/public.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/lib/check/check.js"></script>
<script language="javascript">
//选择客户--弹出客户选择弹出框
function chooseCustomer(){
	var url = '<%=basePath%>sys/cus_selCustomer.action?time='+new Date(); 
	window.callback = fillCustomer;
	openModalWindow(url, window, 'full');
}
//回填客户信息
function fillCustomer(id, name,uname,phone,kdname,kdid,address,arname,ctype,arid,xyje,xyzq,lsxyd,syje){
	$('#id').val(id);
	$('#name').val(name);
	$('#uname').val(uname);
	$('#phone').val(phone);
	$('#kdname').val(kdname);
	$('#kdid').val(kdid);
	$('#address').val(address);
	$('#arname').val(arname);
	$('#ctype').val(ctype);
	$('#arid').val(arid);
	if(xyje==null || xyje==''){
	  $('#xyje').empty().append(0);
	}else{
	  $('#xyje').empty().append(xyje);
	}
	if(xyzq==null || xyzq==''){
	  $('#xyzq').empty().append(0);
	}else{
	  $('#xyzq').empty().append(xyzq);
	}
	if(syje==null || syje==''){
	  $('#syje').empty().append(0);
	}else{
	$('#syje').empty().append(syje);
	}
	if(lsxyd==null || syje==''){
	  $('#lsxyd').empty().append(0);
	}else{
	$('#lsxyd').empty().append(syje);
	}
}

//选择客户--弹出客户选择弹出框
function chooseCustomerByCttype(){
	var url = '<%=basePath%>sys/cus_selCustomerByCttype.action?time='+new Date(); 
	window.callback = fillCustomer;
	openModalWindow(url, window, 'full');
}
//回填客户信息
function fillCustomerByCttype(id, name,uname,phone,kdname,kdid,address,arname,ctype,arid){
	$('#id').val(id);
	$('#name').val(name);
	$('#uname').val(uname);
	$('#phone').val(phone);
	$('#kdname').val(kdname);
	$('#kdid').val(kdid);
	$('#address').val(address);
	$('#arname').val(arname);
	$('#ctype').val(ctype);
	$('#arid').val(arid);
}
//选择人员
function chooseFwUser(index,id){
   var url="<%=basePath%>ser/apply/dphwork_chooseServiceUser.action?ser_type_id="+id;  //要查询的Action 
   var backValue = openModalWindow(url,window);
   var id = backValue.split('_')[0];
   var name = backValue.split('_')[1];
   $('#staff_id'+index).val(id);
   $('#staff_name'+index).val(name);
}
/**
 * 选择业务单
 */
function addDnum(){
	//var url = '<%=basePath%>ser/apply/apply_selApplyNum.action';  
	//openWindow(url, '业务单查询');
	var url = '<%=basePath%>admin/common/choose_apply_name.jsp?time='+new Date(); 
	window.callback = backAppNum;
    openModalWindow(url, window,'custom','1000','600');
	
}
 /**
  * 回调函数(选择业务单)
  */
 function backAppNum(app_num){
 	$('#com_app_num').val(app_num);
 }
 /**
  * 销售开单打印窗口
  */
 function openOrderPrint(bussinessid){
    var url = '<%=basePath%>admin/common/print_billing_detail.jsp?bussinessid='+bussinessid+'&time='+new Date(); 
    openModalWindow(url,window,'700','500');
 }
//-----------打印-----------
function doPrint() { 
  bdhtml=window.document.body.innerHTML; 
  sprnstr="<!--startprint-->"; 
  eprnstr="<!--endprint-->"; 
  prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
  prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
  window.document.body.innerHTML=prnhtml; 
  window.print(); 
};
 /**
  * 销售订单打印窗口
  */
 function printSalesOrder(bussinessid){
    var url = '<%=basePath%>bss/sales/saleOrderLine_selDetail.action?bssSaleOrderLine.sd_id='+bussinessid+'&pageBz=print&time='+new Date(); 
    openModalWindow(url,window,'700','500');
 }
 /**
  * 销售退货打印窗口
  */
 function printSaleRejec(bussinessid){
    var url = '<%=basePath%>bss/sales/saleReje_saleRejeDetail.action?srh_id='+bussinessid+'&pageBz=print&time='+new Date(); 
    openModalWindow(url,window,'700','500');
 }
 
</script>