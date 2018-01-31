$(function(){
	//自动限制textarea长度.只用给textarea标签配置maxlength属性。    如：限制长度为50个字符  <textarea maxlength=50></textarea>
	addCheckForTextarea();
});

alwaysalert=true;
	  /**通用校验form表单中的元素方法
	  @参数 name 要校验表单的name
	  		 msgStyle 提示信息显示的风格   取值范围(alert,div,all)
	  		 							 alert - 弹出框提示信息.
	  		 							 div   - 将提示内容显示至id为传入参数divid的<div>标签中显示.
	  		 							 all   - 包含alert和div显示风格.
	  	     divid 要显示提示信息的<div>的id
	  @使用方法
	  		 在要校验的form子元素标签中加入 isnull="true" 和 checktype="" 属性
	  		 							 isnull   - 为非空校验，非用户输入内容校验时，只用配置此属性即可。
	  		 							 checktype - 为用户输入内容的合法性进行校验时，要校验的类型。目前只支持以下类型，如有其它需要需扩展类型支持。见   ====>类型扩展处
	  		 							 		     类型:string 非空字符,int 整型,+int 正整型,-int 负整型,float 浮点型,+float 正浮点型,-float 负浮点型,char&&int字符或数值,url 网址,email 邮箱地址
	  */
	  function attrCheckByFormName(name,msgStyle,divid){
	  msgStyle=!msgStyle?"alert":msgStyle;
	  var error,iserror,errormsg;
			$("form[name="+name+"]").find("input[isnull=true],select[isnull=true],textarea[isnull=true]").each(function(){
				var thisobj = $(this);
				var checktype = thisobj.attr("checktype")==undefined?thisobj.attr("type"):thisobj.attr("checktype");
				errormsg = thisobj.attr("errormsg");
				var val = thisobj.val();
					switch (checktype){
						case "string":
						if(val==""){
							error=errormsg?errormsg:"输入错误！此项必须输入。";
							iserror=true;
						}
									 break;
						case "text":
						if(val==""){
							error=errormsg?errormsg:"输入错误！此项必须输入。";
							iserror=true;
						}
									 break;
						case "int":
					    if(val.match(/^-?\d+$/)==null){
							error=errormsg?errormsg:"输入错误！只允许输入整数。";
							iserror=true;
						}
									 break;
						case "checkbox":
						var checkFlag = true;
						$("input[name="+thisobj.attr("name")+"][checked]").each(function(){
							checkFlag=false;
						});
					    if(checkFlag){
							error=errormsg?errormsg:"输入错误！复选框内容必须选择。";
							iserror=true;
						}
									break;
						case "radio":
						var checkFlag = true;
						$("input[name="+thisobj.attr("name")+"][checked]").each(function(){
							checkFlag=false;
						});
					    if(checkFlag){
							error=errormsg?errormsg:"输入错误！单选框内容必须选择。";
							iserror=true;
						}
									break;
						case "select-one":
					    if($("#"+thisobj.attr("id")).val()==""){
							error=errormsg?errormsg:"输入错误！下拉列表框内容必须选择。";
							iserror=true;
						}
									break;
						case "textarea":
						val = thisobj.html();
						if(val==""){
							error=errormsg?errormsg:"输入错误！此项必须输入。";
							iserror=true;
						}
									 break;
						case "+int":
						if(val.match(/^[0-9]*[1-9][0-9]*$/)==null){
							error=errormsg?errormsg:"输入错误！只允许输入正整数。";
							iserror=true;
						}
								    break;
					    case "-int":
					    if(val.match(/^-[0-9]*[1-9][0-9]*$/)==null){
							error=errormsg?errormsg:"输入错误！只允许输入负整数。";
							iserror=true;
						}
								    break;
						case "+float":
					    if(val.match(/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/)==null){
							error=errormsg?errormsg:"输入错误！只允许输入正浮点数。";
							iserror=true;
						}
								    break;
						case "-float":
					    if(val.match(/^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/)==null){
							error=errormsg?errormsg:"输入错误！只允许输入负浮点数。";
							iserror=true;
						}
								    break;
						case "float":
						if(val.match(/^(-?\d+)(\.\d+)?$/)==null){
							error=errormsg?errormsg:"输入错误！只允许输入浮点数。";
							iserror=true;
						}
								    break;
						case "char&&int":
						if(val.match(/^[A-Za-z0-9]+$/)==null){
							error=errormsg?errormsg:"输入错误！只允许输入字母或数字。";
							iserror=true;
						}
								    break;
						case "url":
						if(val.match("/^[a-zA-z]+://(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\S*)?$/")==null){
							error=errormsg?errormsg:"输入错误！只允许输入网址。";
							iserror=true;
						}
								    break;
						case "email":
						if(val.match(/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/)==null){
							error=errormsg?errormsg:"输入错误！邮箱地址输入错误。";
							iserror=true;
						}
									break;
						//====>类型扩展处
					}
				//显示错误提示处理
				if(iserror){
					thisobj.focus();
					switch (msgStyle){
						case "alert":alert(error);break;
						case "div":
						if(divid){
							$("#"+divid).html(error);
						}
						break;
						case "all":alert(error);
						if(divid){
							$("#"+divid).html(error);
						}
						break;
						default: alert(error);break;
					}
					return false;
				}
			});
			return !iserror;
	  }
	  /*测试代码 
	  引入JS
	  <script language="javascript" type="text/javascript" src="http://localhost:8080/eam/js/check.js">
	    
	  <form name="formtest" method="post" action="#">
	  <table>
	  <tr>
    		<td>电脑类型:<select id="stype" name="stype" isnull="true">
    			<option value="">未选择</option>
    			<option value="1" selected>台机</option>
    			<option value="2">笔记本</option>
    		</select></td>
    		<td>单选按钮:男<input type="radio" name="sex" isnull="true" checked="checked" value="1">女<input type="radio" name="sex" isnull="true" value="0">
    		<td>复选框：<input name="hobby" type="checkbox" value="1" checked="checked" isnull="true">篮球<input name="hobby" type="checkbox" value="2" isnull="true">足球<input name="hobby" type="checkbox" value="3" isnull="true">乒乓球</td>
    		<td>文本域：<textarea name="introduct" cols="5" rows="5" isnull="true">ssss</textarea></td>
    		<td>正整数：<input type="text" name="number" isnull="true" checktype="email" />
    		<td>提示信息：<div id="msgdiv"></div></td>
    	</tr>
    	<tr>
    		<td><input type="button" name="button4" id="button4" value="测试" onClick="attrCheckByFormName('formtest','all','msgdiv')" class="btnStyle78PX"/></td>
    	</tr>
    	</table>
    	</form>
    	*/
	//自动限制textarea长度.只用给textarea标签配置maxlength属性。    如：限制长度为50个字符  <textarea maxlength=50></textarea>
	//@author:wangrong
	//@date:2012-09-25
	//@
	 function addCheckForTextarea(){
		 var idx=0;
		 $("textarea").each(function(){
			 var maxlen = $(this).attr("maxlength");
			 if(maxlen){
				 $(this).parent().append("还可以输入<span id='edited"+idx+"'>"+maxlen+"</span>个字符");
				 $(this).attr("idx",idx++);
				 $(this).keyup(function(){
					 getEditedNum(maxlen, $(this));
				 });
			 }
		 });
	 }
	//@author:wangrong
	//@date:2012-09-25
	 function getEditedNum(num,obj){ 
		    var len = obj.html().length;
		    var idx = $(obj).attr("idx");
		    var objHTML = obj.html();
		    var tmp = num - len;
		    if(tmp<=0){  
		    	$(obj).html(objHTML.substring(0,num));
		    	$("#edited"+idx).html("0");
		    }else{
		    	$("#edited"+idx).html(tmp);
		    }
		}
	//关闭快捷键
    $(document).keyup(function(e){
        var key = e.which;
        if(!key){
        	key = e.keyCode;
        }
        if(key == 27){
            //if(confirm("是否要关闭?")){
				window.close();
			//}
        }
    });