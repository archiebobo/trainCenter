/*
把多选下拉框中选中的内容移到另外一个下拉框中
yx提供
txy
2012-3-20 17:19:33
*/
function func_insert(){
	for (i=0; i<form1.select2.options.length; i++){
   		if(form1.select2.options[i].selected && form1.select2.options[i].value!="MENU_SORT"){
     		option_text=form1.select2.options[i].text;
     		option_value=form1.select2.options[i].value;
     		option_style_color=form1.select2.options[i].style.color;

     		var my_option = document.createElement("OPTION");
     		my_option.text=option_text;
     		my_option.value=option_value;
     		my_option.style.color=option_style_color;

     		pos=form1.select2.options.length;
     		form1.select1.options.add(my_option,pos);
     		form1.select2.remove(i);
     		i--;
  		}
	}//for
}
function func_delete(){
	for (i=0;i<form1.select1.options.length;i++){
   		if(form1.select1.options[i].selected){
     		option_text=form1.select1.options[i].text;
     		option_value=form1.select1.options[i].value;

     		var my_option = document.createElement("OPTION");
     		my_option.text=option_text;
     		my_option.value=option_value;

     		pos=form1.select2.options.length;
     		form1.select2.options.add(my_option,pos);
     		form1.select1.remove(i);
     		i--;
  		}
	}//for
}
function func_select_all1(){
	for (i=form1.select1.options.length-1; i>=0; i--)
		form1.select1.options[i].selected=true;
}

function func_select_all2()
{
 for (i=form1.select2.options.length-1; i>=0; i--)
   form1.select2.options[i].selected=true;
}

function func_up()
{
  sel_count=0;
  for (i=form1.select1.options.length-1; i>=0; i--)
  {
    if(form1.select1.options[i].selected)
       sel_count++;
  }

  if(sel_count==0)
  {
     alert("调整菜单快捷组的项目顺序时，请选择其中一项！");
     return;
  }
  else if(sel_count>1)
  {
     alert("调整菜单快捷组的项目顺序时，只能选择其中一项！");
     return;
  }
  i=form1.select1.selectedIndex;

  if(i!=0)
  {
    var my_option = document.createElement("OPTION");
    my_option.text=form1.select1.options[i].text;
    my_option.value=form1.select1.options[i].value;
    form1.select1.options.add(my_option,i-1);
    form1.select1.remove(i+1);
    form1.select1.options[i-1].selected=true;
  }
}
function func_down()
{
  sel_count=0;
  for (i=form1.select1.options.length-1; i>=0; i--)
  {
    if(form1.select1.options[i].selected)
       sel_count++;
  }
  if(sel_count==0)
  {
     alert("调整菜单快捷组的项目顺序时，请选择其中一项！");
     return;
  }
  else if(sel_count>1)
  {
     alert("调整菜单快捷组的项目顺序时，只能选择其中一项！");
     return;
  }
  i=form1.select1.selectedIndex;
  if(i!=form1.select1.options.length-1)
  {
    var my_option = document.createElement("OPTION");
    my_option.text=form1.select1.options[i].text;
    my_option.value=form1.select1.options[i].value;

    form1.select1.options.add(my_option,i+2);
    form1.select1.remove(i);
    form1.select1.options[i+1].selected=true;
  }
}
