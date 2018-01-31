//--------列出表格的表头文字，并加上操作复选框，可隐藏表格中相应列，trId表头行ID,width面板宽度,hight面板高度-------------txy
var menuPopup = window.createPopup();
function yinCangLie(trId,width,hight){
	var menuContent = '<div style="font-size:5px;"> <table width="100%" border="0" cellpadding="1" cellspacing="1">';
	menuContent += '<tr><td><label><input type="checkbox" id="chkAll" onclick="parent.checkAll(\''+trId+'\');"/>所有列</label></td></tr>';
	$("#"+trId+" td").each(function(index) {
		var ched="";
		if($(this).is(":visible")){
			ched='checked="checked"';
		}
		menuContent += '<tr><td><label><input type="checkbox" id="ycl'+index+'" onclick="parent.hide('+index+',\''+trId+'\');" '+ched+'/>'+$(this).text()+'</label></td></tr>';
	})
	menuContent += '</table> </div>';
	menuPopup.document.body.innerHTML = menuContent;
	menuPopup.document.body.style.border = "1px solid #aaa";
	menuPopup.show(event.clientX,event.clientY,width,hight,document.body);
}
//---------------------隐藏单列--------------------txy
function hide(cos,trId){
	var  table = $("#"+trId).parent();
	var chk = menuPopup.document.getElementById("ycl"+cos);
	if(chk.checked==false){
		$(table.children()).each(function(){
			$(this).children().eq(cos).hide();
		})
	}else{
		$(table.children()).each(function(){
			$(this).children().eq(cos).show();
		})
	}
}
//--------------隐藏所有列-------------------txy
function checkAll(trId){
	var  table = document.getElementById(trId).parentNode;
	var chk = menuPopup.document.getElementById('chkAll');
	var chkAll = menuPopup.document.getElementsByTagName("input");
	if(chk.checked == true){	
		for(var m=0;m<chkAll.length;m++){
			if(chkAll[m].type=='checkbox'){
				chkAll[m].checked=true;
			}
		}
		for(var i = 0;i<table.rows.length;i++){
			for(var j = 0;j<table.rows[i].cells.length;j++)
				table.rows[i].cells[j].style.display="block";
		} 
	}else{
		for(var m=0;m<chkAll.length;m++){
			if(chkAll[m].type=='checkbox'){
				chkAll[m].checked=false;
			}
		} 
		for(var i = 0;i<table.rows.length;i++){
			for(var j = 0;j<table.rows[i].cells.length;j++)
				table.rows[i].cells[j].style.display="none";
		}
	}
}	
	
//----------是否隐藏，用于隐藏列后又给该表添加行，trId:行id liehao:列号，第一列为0--------txy
function isV(trId,liehao){
	var td = $("#"+trId+" td").eq(liehao);
	if(td.is(":hidden")){
		return "style='display:none;'";
	}else{
		return "";
	}
}

//---------批量编辑表格内容，checkboxName：每行复选框的name。被编辑的页面的html格式要规范，所有向表格内输入的js须都写在页面上的最后一个script里----------
function piLiangBianJi(checkboxName){
	var obj = new Object();
	obj.js = $("script").eq(-1).html();  //获取本页面的script代码，因为已经IncludeHeader.jsp引入了9个script，这里用的是倒数第一个
	var ched = $("input:checked[name="+checkboxName+"]");
	if(ched.length >=1){
		var tr = ched.eq(0).parent().parent();
		var trfir = tr.siblings(":first");
		obj.trs = "<tr>"+trfir.html()+"</tr><tr>"+tr.html()+"</tr>"; //表头和选中的第一行内容
		var tr2 = openwebpage(getRootPath()+"/admin/util/pilbj.jsp",obj,'',350);
		if(tr2){
			tr.children().each(function(index){ //循环列
				if($(this).html() != $(tr2).eq(index).html()){ //判断值被修改
					var tdneir = $(tr2).eq(index).children();
					trfir.nextAll().each(function(){ //循环行
						if($(this).find("input[name="+checkboxName+"]").attr("checked")){ //判断本行的复选框被选中
							$(this).children().eq(index).children().each(function(neir){  //循环对应列中的所有子元素
								$(this).val(tdneir.eq(neir).val()); //对子元素赋值
								if($(this).val() != tdneir.eq(neir).val()){ 
									$(this).empty();
									$(this).append(tdneir.eq(neir).children().clone()); //替换子元素
									//$(this).children().replaceWith(tdneir.eq(neir).children().clone()); //如果赋值失败，则装载子元素，像为空的仓区货位
									//$(this).val(tdneir.eq(neir).val()); //重新对子元素赋值
								}
							});
						}
					});
				}
			});
		}
	}else{
		alert("请选择需要编辑的行！");
	}
}
