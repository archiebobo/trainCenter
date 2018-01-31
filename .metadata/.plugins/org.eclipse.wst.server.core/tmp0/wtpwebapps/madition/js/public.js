Global = {};
codeMap = {
	commStatus:{
		'1': '在库',
		'2': '不在库',
		'3': '调库中'
	}
};

//打开弹出窗口
function openWindow(url_, title_, sizeMode_, width_, height_){
	var config = {
		title: title_ || '弹出窗口',
		url: url_
	};
	
	if((typeof sizeMode_ != 'undefined') && sizeMode_ != 'full'){
		config.width = width_;
		config.height = height_;
		config.sizeMode = 'custom';
	}else{
		config.sizeMode = 'full';
	}
	
	Global.popupWindow = new PopupWindow(config);
	window.onresize = function(){
		Global.popupWindow.resize.call(Global.popupWindow);
	};
	Global.popupWindow.show();
	
}

//关闭弹出窗口
function closeWindow(){
	Global.popupWindow.close();
	Global.popupWindow = null;
}
//定义弹出窗口对象
function PopupWindow(c){
	this.url = c.url;
	this.title = c.title;
	this.sizeMode = c.sizeMode || 'full';
	
	//this.maskWidth = window['innerWidth'] || document.documentElement.clientWidth;
	//this.maskHeight = window['innerHeight'] || document.documentElement.clientHeight;
	
	var mask = getPageSize();
	this.maskWidth = mask.maskWidth;
	this.maskHeight = mask.maskHeight;
	
	if(this.sizeMode == 'full'){
		this.height = c.height || (window['innerHeight'] || document.documentElement.clientHeight - 35);
		this.width = c.width || (window['innerWidth'] || document.documentElement.clientWidth - 12);
	}else{
		this.height = c.height;
		this.width = c.width;
	}
	
	this.left = 0;
	this.top = 0;
	this.resize = function(w, h){
		if(this.sizeMode == 'full'){
			this.height = (window['innerHeight'] || document.documentElement.clientHeight) - 35;
			this.width = (window['innerWidth'] || document.documentElement.clientWidth) - 12;
		}else{
			this.width = w;
			this.height = h;
		}
		$('#panelWindow').css('width', this.width);
		$('#windowHeader').css('width', this.width);
		$('#windowBody').css('width', this.width - 2).css('height', this.height);
	};
	
	this.init = function(){
		var html = '<div id="panelWindow" class="panel window" style="width: ' + (this.width) + 'px; display: none; z-index: 9001; position: absolute; left: ' + this.left + 'px; top: ' + this.top + 'px; ">';
		html	+= '	<div id="windowHeader" class="panel-header panel-header-noborder window-header" style="width: ' + this.width + 'px; ">';
		html	+= '	<div id="windowTitle" class="panel-title" style="cursor: move; ">' + this.title + '</div>';
		html	+= '	<div class="panel-tool">';
		html	+= '		<a class="panel-tool-close" href="javascript:void(0)"></a>';
		html	+= '	</div>';
		html	+= '	<div id="windowBody" class="panel-body panel-body-noborder window-body" style="width: ' + (this.width-2) + 'px; height: ' + this.height + 'px; ">';
		html	+= '		<iframe id="innerWin" frameborder="0" width="100%" height="99%" scrolling="auto"  src="' + this.url + '"></iframe>';
		html	+= '	</div>';
		html	+= '</div>';
		html	+= '</div>';
		html	+= '<div id="windowMask" class="window-mask" style=" width: '+this.maskWidth+'px; height: '+this.maskHeight+'px; display: none; z-index: 9000; "></div>';		
		
		$(window.document.body).append(html);
		$('.panel-tool-close').click(this.close);
	};
	
	this.show = function(){
		$('#panelWindow').css('display', 'block');
		$('#windowMask').css('display', 'block');
		$('#panelWindow').css('z-index', 9009);
		$('#windowMask').css('z-index', 9000);
		$('#panelWindow').focus();
	};
	
	this.close = function(){
		$('#windowMask').remove();
		$('#panelWindow').remove();
	};
	
	this.setTitle = function(t){
		$('windowTitle').html(t);	
	};
	
	this.init();
}
	
//获得窗口的大小
function getPageSize() {
	var mask = {};
	if (document.documentElement && document.documentElement.clientHeight) {
		var doc = document.documentElement;
		mask.maskWidth = (doc.clientWidth > doc.scrollWidth) ? doc.clientWidth - 1: doc.scrollWidth;
		mask.maskHeight = (doc.clientHeight > doc.scrollHeight) ? doc.clientHeight: doc.scrollHeight;
	} else {
		var doc = document.body;
		mask.maskWidth = (window.innerWidth > doc.scrollWidth) ? window.innerWidth: doc.scrollWidth;
		mask.maskHeight = (window.innerHeight > doc.scrollHeight) ? window.innerHeight: doc.scrollHeight;
	}
	return mask;
}

/**
* 弹出模态窗口
* url: 弹出窗口内容url
* opener: 弹出窗口的父窗口引用 
* sizeMode: 弹出窗口大小模式 full/medium/small/custom
* 		full: 表示弹出全屏窗口
* 		medium: 表示弹出中型窗口
* 		full: 表示弹出小型窗口
* 		custom: 表示弹出自定义大小的窗口
*/
function openModalWindow(url, opener, sizeMode, width, height){
	var configs = 'center:yes; help:no; status:no; scroll:yes; resizable:no;';
	var width_ = 650, height_ = 500;
	if(sizeMode == 'full'){
		width_ = window.screen.availWidth;
		height_ = window.screen.availHeight;
	}else if(sizeMode == 'medium'){
		width_ = window.screen.width - 300;
		height_ = window.screen.height - 200;
	}else if(sizeMode == 'small'){
		width_ = 300;
		height_ = 500;
	}else if(sizeMode == 'custom'){
		width_ = width;
		height_ = height;
	}
		
	configs += 'dialogWidth=' + width_ + 'px; ';
	configs += 'dialogHeight=' + height_ + 'px; ';
	return showModalDialog(url, opener, configs);
}


/*--------计算价格最多保留四位有效数字----传入totals为Float类型的-------------*/
 function fomatFloat(totals){
   var real_price=0.0;
   var new_price='';
  if(!isNaN(totals) && totals!=null){
	   var pos=totals.toFixed(4);
	   var price=pos.split('.');  
	   var part_price=price[1].substring();
	       three_price=part_price.charAt(2);
	       four_price= part_price.charAt(3);
	       if(three_price=='0' && four_price=='0'){
	        real_price=totals.toFixed(2);
	       }else if(three_price!='0' && four_price=='0'){
	        real_price=totals.toFixed(3);   
	       }else if(four_price!='0'){
	        real_price=totals.toFixed(4);   
	     }
 }  
   return real_price;  
 }
 /*
 *判段输入的数量为保留小数点后两位
 *amount 数值
 *obj 对象
 */
function getJudgeAmountAndPrice(name,amount,obj){
        var temp=/^\d+(\.\d+)?$/;
		 if(temp.test(amount)==false){
		  alert("输入错误");
		   obj.val("");
		  return;
		 }


      var re = /^\d+(\.\d)?$/;                 
      var bol = re.test(amount); 
      if(!bol){
          var number=amount.split('.');
          var n=number[1].toString();
          if(n.length>2){
            alert(name+':请保留两位有效数字');
            obj.val("");
            return;
         }
      }
}	
 /*-----------------------获取对象,checkbox 全选/删除/修改-----------------------*/
function getobj(objtag, objname) {
	var obj = document.getElementsByTagName(objtag);
	var arrobj = new Array();
	var j = 0;
	for (var i = 0; i < obj.length; i++) { 
		if (obj[i].name != undefined && obj[i].name.length >= objname.length && obj[i].name.substring(0, objname.length) == objname) {
			arrobj[j] = obj[i];
			j = j + 1;
		}
	}
	return arrobj;
}
 //选择所有
function selCheckboxAll(key, name) {	
	var arrobj =getobj(key,name);
	for (var i = 1; i < arrobj.length; i++) {
		if(event.srcElement.checked){
			arrobj[i].checked = true;
		}else{
			arrobj[i].checked = false;
		}
	}
}

function checkBoxListener(key, name, checkAllBtnId){
	var arrobj = getobj(key,name);
	var allChecked = true;
	for (var i = 0; i < arrobj.length; i++) {
		if(arrobj[i].checked == false){
			allChecked = false;
		}
	}
	document.getElementById(checkAllBtnId).checked = allChecked ? true : false;
}
/*-----------------------获取对象,checkbox 全选/删除/修改-----------------------*/
function getobj(objtag, objname) {
	var obj = document.getElementsByTagName(objtag);
	var arrobj = new Array();
	var j = 0;
	for (var i = 0; i < obj.length; i++) { 
        //if(obj[i].name.indexOf(objname)>=0){
		if (obj[i].name != undefined && obj[i].name.length >= objname.length && obj[i].name.substring(0, objname.length) == objname) {
			arrobj[j] = obj[i];
			j = j + 1;
		}
	}
	return arrobj;
}
	
//初始化数据表格样式	  
function initTableGrid(){
	Ptr=document.getElementById("tab").getElementsByTagName("tr");
    for (var i=1; i<Ptr.length+1; i++){ 
    	Ptr[i-1].style.backgroundColor = (i%2>0)?"#fff":"#eef2ea"; 
    }
    for(var i=0; i<Ptr.length; i++) {
	    Ptr[i].onmouseover=function(){
		    this.tmpClass=this.className;
		    this.style.backgroundColor = "#e3f8fc";
	    };
	    Ptr[i].onmouseout=function(){
		    for (i=1;i<Ptr.length+1;i++) { 
		    	Ptr[i-1].style.backgroundColor = (i%2>0)?"#fff":"#eef2ea"; 
		    }
		};
	}
}

//获取客户端当前时间
function getCurrentTime(){
	return (new Date()).getTime();
}

//字符串为空判断
function isEmpty(str){
	if(str == null || str == undefined || str.length == 0){
		return true;
	}
	return false;
}

//获取编辑器Fck中内容
function getFckText(instanceName) {
    var oEditor = FCKeditorAPI.GetInstance(instanceName);
    return oEditor.GetXHTML();
};


//设置编辑器Fck中内容
function setFckText(instanceName, text) {
    var oEditor = FCKeditorAPI.GetInstance(instanceName) ;
    oEditor.SetHTML(text) ;
}

//判断指定年份是否为闰年
function isLeapYear(year){
	return !!((year & 3) == 0 && (year % 100 || (year % 400 == 0 && year)));
}

//获取指定月份的天数
function daysOfMonth(year, month){
	if(month == 1 || month==3 || month==5 ||month==7 ||month==8 ||month==10 ||month==12){
		return 31;
	}
	if(month == 4 || month==6 || month==9 ||month==11){
		return 30;
	}
	if(month == 2 && isLeapYear(year)){
		return 29;
	}
	if(month == 2 && !isLeapYear(year)){
		return 28;
	}
	return 0;
}

//判断数组是否包含了指定的元素
function contains(arr, ele){
	var result = false;
	for(var i=0; i<arr.length; i++){
		if(arr[i] == ele){
			result = true;
			break;
		}
	}
	return result;
}

//全选checkbox
function selectAll() {
	var arrobj = getobj("input", "chk");
	for (var i = 0; i < arrobj.length; i++) {
		if (arrobj[i].disabled == false && arrobj[i].checked == false) {
			arrobj[i].checked = true;
		} else {
			arrobj[i].checked = false;
		}
	}
}

function G(id){
	return document.getElementById(id);   
}

//去左空格
function ltrim(s){  
	if(isEmpty(s))return s;
	return s.replace(/^\s*/, "");  
}  
//去右空格
function rtrim(s){  
	if(isEmpty(s))return s;
	return s.replace(/\s*$/, "");  
}
//去掉左右空格
function trim(s){
	if(isEmpty(s))return s;
    return rtrim(ltrim(s));
}

//返回
function back(){
	window.history.back();
}

//清空值
function clearField(nameField, idField){
	$('#' + nameField).val('');
	$('#' + idField).val('');
}

/*--------------------------------------end---------------------*/
//------------------添加附件 参数:1、返回表单元素ID 2、附件业务类型
function openfileupload(backid,filetype){
	var returnvalue='';
	var path =  window.location.pathname; //获取页面文件路径
    path = path.substring(0,path.indexOf("/",1)); //截取出项目名
    //alert(path);
    if(path=='/admin'){
    	returnvalue = window.showModalDialog("/admin/public/upfile.jsp?type="+filetype+"&time="+new Date() ,'附件上传', 'dialogWidth:450px; dialogHeight:200px; status:0; resizable:yes;');
    }else{
        returnvalue = window.showModalDialog(path+"/admin/public/upfile.jsp?type="+filetype+"&time="+new Date() ,'附件上传', 'dialogWidth:450px; dialogHeight:200px; status:0; resizable:yes;');
    }
	//returnvalue = window.showModalDialog("/jxis2/admin/public/upfile.jsp?type="+filetype+"&time="+new Date() ,'附件上传', 'dialogWidth:450px; dialogHeight:200px; status:0; resizable:yes;');
	if(returnvalue!=undefined){
		//document.getElementById(backid).innerHTML=document.getElementById(backid).innerHTML+returnvalue;
		$("#"+backid).html($("#"+backid).html()+returnvalue);
	}
}
//-----------------附件 删除一行---------------
function deltr(obj){
	$(obj).parent().parent().remove();
}
function GetQueryString(name) {
	   var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
	   var r = window.location.search.substr(1).match(reg);
	   if (r!=null) return (decodeURI(r[2])); return null;
}
/*--------------------------------------end---------------------*/