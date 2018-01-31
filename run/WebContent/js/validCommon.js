/**
* desc 表单提交前验证数据
* 用法: 1 先引三个文件包，jquery.js,livevalidation.css,livevalidation.js
* 		2 需要验证的字段内容，直接在class后面添加。比如不能为空，class="  notNull_V"
* 返回: boolean
* @author yangxi
*/
 var valid_min = 5;
 var valid_max = 10;
 var valid_min_content = 0;
 var valid_max_content = 100;
 function validData(){
 	var valid = true;
	   	$(".LV_invalid_field").removeClass("LV_invalid_field"); 
	   	$(".LV_invalid").remove(); 
		$(".notNull_V").each(function(){		//不能为空
			try{
				var c_value = $(this).val();
				Validate.Presence(c_value, { failureMessage: "不能为空!" } );
			}catch(e){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">' + e.message + '</span>');
			}
		});
		//------------长度限制(如果自定义范围，可以先调用setValidVale(_min,_max) method)---------
		$(".lengthLimit_V").each(function(){
			try{
				var c_value = $(this).val();
				Validate.Presence(c_value, { failureMessage: "长度范围"+valid_min+" -"+valid_max+"!" } );
				Validate.Length(c_value, { minimum: valid_min, maximum: valid_max } );
			}catch(e){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">' + e.message + '</span>');
			}
		});
		//------------长度限制(如果自定义范围，可以先调用setValidVale(_min,_max) method)---------
		$(".lengthLimitContent_V").each(function(){
			try{
				var c_value = $(this).val();
				Validate.Presence(c_value, { failureMessage: "长度范围"+valid_min_content+" -"+valid_max_content+"!" } );
				Validate.Length(c_value, { minimum: valid_min_content, maximum: valid_max_content } );
			}catch(e){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">' + e.message + '</span>');
			}
		});
		//----------------------只允许正数-------------------
		$(".onlyInt_V").each(function(){
			try{
				var c_value = $(this).val();
				Validate.Numericality(c_value,{ onlyInteger: true , minimum: 0 });
			}catch(e){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">' + e.message + '</span>');
			}
		});
		//-----------------------邮件验证---------------------
		$(".email_V").each(function(){
			try{
				var c_value = $(this).val();
				if(c_value==null||c_value==""){
					return true;
				}
				Validate.Email(c_value,{required:false});
			}catch(e){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">' + e.message + '</span>');
			}
		});
		//-----------------------数字验证---------------------
		$(".number_V").each(function(){
			try{
				var c_value = $(this).val();
				Validate.Numericality(c_value, { failureMessage: "必须是数字!"  } );
			}catch(e){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">' + e.message + '</span>');
			}
		});
		//-----------------------价格---------------------
		$(".price_V").each(function(){
			try{
				var c_value = $(this).val();
				Validate.Numericality(c_value, { failureMessage: "必须是number类别!"  } );
				var arr = c_value.split('.');
				if( arr[1] != null && arr[1].length > 4){
					valid = false;
					$(this).addClass('LV_invalid_field');
					$(this).after('<span class=" LV_validation_message LV_invalid">最多只能输入四位小数</span>');			
				}
			}catch(e){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">' + e.message + '</span>');
			}
		});
		//---------------------仅支持英文字符------------------
		$(".en_V").each(function(){
			var c_value = $(this).val();
			if(!/^[A-Za-z]+$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">仅支持英文字符!</span>');
			}
		});
		//--------------------用户名由英文,数字和下划线组成------------------
		$(".EnNumUnderline_V").each(function(){EnNumUnderline_V
			var c_value = $(this).val();
			if(!/^[A-Za-z0-9\w]{0,20}$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">用户名由英文,数字和下划线组成!!</span>');
			}
		});
		//---------------------身份证--------------------
		$(".IDCard_V").each(function(){
			var c_value = $(this).val();
			if(!/^\d{15}(\d{2}[A-Za-z0-9])?$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">身份证号码格式不正确!</span>');
			}
		});	
		//---------------------地址验证--------------------
		$(".URL_V").each(function(){
			var c_value = $(this).val();
			if(!/^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">URL地址格式不正确!</span>');
			}
		});
		//---------------------手机格式-------------------
		$(".mobive_V").each(function(){
			var c_value = $(this).val();
			if(!/^(1[3|5|8]{1}\d{9})$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">手机格式不正确!</span>');
			}
		});
		//--------------------电话号码格式-------------------
		$(".telephone_V").each(function(){
			var c_value = $(this).val();
			if(!/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">电话号码格式不正确!</span>');
			}
		});	
	    //--------------------中英文和数字------------------
		$(".zh_en_num_V").each(function(){
			var c_value = $(this).val();
			if(!/^[\u4e00-\u9fa5\da-zA-Z\.\。\,\，《》\、\(\（\)\）\?\？]{0,40}$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">仅支持中英文和数字!</span>');
			}
		});	
		
		//-----------------英文和数字-----------------
		$(".EnNum_V").each(function(){
			var c_value = $(this).val();
			if(!/^[a-zA-Z0-9]{0,15}$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">仅支持英文和数字!</span>');
			}
		});	
		//------------手机格式----------------------
		$(".TelPh_V").each(function(){
			var c_value = $(this).val();
			if(!/^[1]\d{10}$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">手机格式不正确!</span>');
			}
		});	
		//--------------------时间格式----------------------
		$(".Time_V").each(function(){
			var c_value = $(this).val();
			if(! /^(([01]?[0-9])|(2[0-3])):[0-5]?[0-9]-(([01]?[0-9])|(2[0-3])):[0-5]?[0-9]$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">时间格式不正确!</span>');
			}
		});	
		//-----------------英文数字下划线-----------------
		$(".en_ch_line_V").each(function(){
			var c_value = $(this).val();
			if(c_value==null||c_value==""){
				return true;
			}
			if(!/^[a-zA-Z]+[a-zA-Z0-9_]{0,15}$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">仅支持英文和数字下划线且首字母必须为英文!</span>');
			}
		});	
		//-------------------------------------------------------------------------------------------------
		$(".Coordinates_V").each(function(){
			var c_value = $(this).val();
			if(c_value <= 180 && c_value >= -180){
			if(! /^-?[0-9]{1,3}[\.\d]{0,7}$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">经纬度格式不正确,最多保留6位小数!</span>');
			}
			}else{
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">经纬度范围:-180~180!</span>');
			}
		});	
		//--------------------------------------------------------------------------------------------------
		$(".EnNumUnderlineZh_V").each(function(){
			var c_value = $(this).val();
			if(! /^[\u4e00-\u9fa5\da-zA-Z\w]{0,40}$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">仅支持输入中英文和下划线!</span>');
			}
		});	
		//-------------------------------------中文英文数字------------------------------------------------------
		$(".EnNumZh_V").each(function(){
			var c_value = $(this).val();
			if(! /^[\u4e00-\u9fa5\da-zA-Z]{0,40}$/.test(c_value)){
				valid = false;
				$(this).addClass('LV_invalid_field');
				$(this).after('<span class=" LV_validation_message LV_invalid">仅支持输入中英文和数字!</span>');
			}
		});	
		return valid;
 }
//-----------设置大小范围=-----------
 function setValidVale(_min,_max){
 	this.valid_min = _min;
 	this.valid_max = _max;
 }
//-----------设置大小范围=-----------
 function setValidValeContent(_min,_max){
 	this.valid_min_content = _min;
 	this.valid_max_content = _max;
 }
 //----------------查询页面onkey事件输入验证------------
 function verificationEnNum(obj){
		var _value = $(obj).val();
		var reg=/^[a-zA-Z0-9]{0,15}$/;
		if(reg.test(_value)){
		}else{
			alert("只能输入英文和数字");
			$(obj).val("");
			return;
		}
	}
	function VerificationEnNumLine(obj){
		var _value = $(obj).val();
		var reg=/^[A-Za-z0-9\w]{0,20}$/;
		if(reg.test(_value)){
		}else{
			alert("由英文,数字和下划线组成");
			$(obj).val("");
		}
	}
	function VerificationNum(obj){
		var _value = $(obj).val();
		var reg=/^[1]\d{0,10}$/;
		if(_value == '' || reg.test(_value)){
		}else{
			alert("号码格式非法");
			$(obj).val("");
		}
	}
	function verificationEnNumChi(obj){
		var _value=$(obj).val();
		var reg=/^[\u4e00-\u9fa5\da-zA-Z]{0,40}$/;
		if(!reg.test(_value)){
			alert('请输入汉字,数字或者英文');
			$(obj).val("");
		}
	}
	function verificationEnNumChiUnderline(obj){
		var _value=$(obj).val();
		var reg=/^[\u4e00-\u9fa5\da-zA-Z\w]{0,40}$/;
		if(!reg.test(_value)){
			alert('请输入汉字,数字,英文或者下划线');
			$(obj).val("");
		}
	}
