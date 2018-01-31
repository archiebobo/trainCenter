 //-------百度搜----------
	 function removeBatch(obj,arr){			//批量删除
	 	for(var m=0 ; m < obj.length ; m++)
	 		for(var n = 0 ; n < arr.length ; n++){
	 			if(parseInt(obj[m].item_id) == parseInt(arr[n]))
	 			  obj.splice(m,1);
	 		}
	 }
	
	 var order = 1, cache = {};
	 function searchBaiDu(obj){
	      var dp_id = $("#dp_id").val();
	      var cd_name='';
		  var item_no='';
		  var path =  window.location.pathname; //获取页面文件路径
	      path = path.substring(0,path.indexOf("/",1)); //截取出项目名
	 	  var name= $(obj).attr("id");
	 	  
		 	$(obj).autocomplete({ 
			source:function (request, response) {
				var term = request.term;
				item_no=$(obj).parent().parent().find("td").eq(1).find("input").eq(0).val(); //选中item的文本
				cd_name=$(obj).parent().parent().find("td").eq(2).find("input").eq(0).val();
			/*	
				//如果缓存中存在，就直接返回缓存中的数据
				if(term in cache){
					var entrys = cache[term]
					
					var arr_tmp =[];
                   	var entrysTemp = entrys;
                   yid=$(obj).parent().parent().find("td").eq(1).find("input").eq(1).val();
                   if(yid!=null&&yid!=''){
                   		  $(obj).parent().parent().find("td").eq(1).find("input").eq(1).val('');
						 // arr_tmp[arr_tmp.length] = yid;                 
                   }
                   	$("input[name='item_id']").each(function(){
                   		var item_id = $(this).val();
                   		if( item_id != "")
                   		arr_tmp[arr_tmp.length] = item_id;
                   	});
                   	if(arr_tmp.length > 0)
                   		removeBatch(entrysTemp,arr_tmp);
					response(entrysTemp);
					return;
				}
				*/
    			$(obj).parent().parent().find("td").eq(1).find("input").eq(1).val('');
				$.ajax({ 
					url: path+"/bss/store/bssItem_iteamListJSON.action",  //要查询的Action 
					type: "POST",  //Post提交 
					dataType: "json", //json格式数据，默认是text 
					data: {
		          		cd_name: cd_name,
		          		dp_id: dp_id,
		          		item_no: item_no
					},
					success: function (data) { 
	                   	var entrys = [];
	                   	for(var i=0; i<data.list.length; i++){
		              		entrys[entrys.length] = {
		              			label: data.list[i].cd_name+'(商品)__'+ data.list[i].item_no+'（编号）__'+(data.list[i].item_amount-data.list[i].item_amount_yz)+"（数量）__"+data.list[i].item_lsprice+"（单价）",
		              			value: data.list[i].cd_id,
		              			cd_name: data.list[i].cd_name,
		              			cd_id: data.list[i].cd_id,
		              			item_no: data.list[i].item_no,
		              			item_id: data.list[i].item_id,
		              			item_amount:data.list[i].item_amount,
		              			item_amountyz:data.list[i].item_amount_yz,
		              			item_lsprice:data.list[i].item_lsprice,
		              			unit:data.list[i].unit,
		              			un:data.list[i].un
		              		};
	                   	}
	                   	cache[request.term] = entrys;
	                   
	                   	var arr_tmp =[];
	                   	var entrysTemp = entrys;
	                   	$("input[name='item_id']").each(function(){
	                   		var item_id = $(this).val();
	                   		if( item_id != "")
	                   		arr_tmp[arr_tmp.length] = item_id;
	                   	});
	                   	
	                   	if(arr_tmp.length > 0)
	                   		removeBatch(entrysTemp,arr_tmp);	//批量删除数组数据
						response(entrysTemp);
					} 
				}); 
			},
			minLength:1, 
			focus: function(event, ui) {
				$(obj).parent().parent().find("td").eq(1).find("input").eq(0).val(ui.item.item_id); //选中item的文本
				$(obj).parent().parent().find("td").eq(1).find("input").eq(1).val(ui.item.item_no);
				$(obj).parent().parent().find("td").eq(2).find("input").eq(0).val(ui.item.cd_name);
				$(obj).parent().parent().find("td").eq(3).text(ui.item.item_amount-ui.item.item_amountyz);
				$(obj).parent().parent().find("td").eq(4).text(ui.item.item_lsprice);
				$(obj).parent().parent().find("td").eq(8).find("input").eq(0).val(ui.item.un);
				return false; 
			}, 
			select: function(event, ui) {
				$(obj).parent().parent().find("td").eq(1).find("input").eq(0).val(ui.item.item_id); //选中item的文本
				$(obj).parent().parent().find("td").eq(1).find("input").eq(1).val(ui.item.item_no);
				$(obj).parent().parent().find("td").eq(2).find("input").eq(0).val(ui.item.cd_name);
				$(obj).parent().parent().find("td").eq(3).text(ui.item.item_amount-ui.item.item_amountyz);
				$(obj).parent().parent().find("td").eq(4).text(ui.item.item_lsprice);
				$(obj).parent().parent().find("td").eq(8).find("input").eq(0).val(ui.item.un);
				
				$("#sol_amount").attr("id",'sol_amount'+ui.item.item_id);
				$("#sol_price").attr("id",'sol_price'+ui.item.item_id);
				$("#unit").attr("id",'unit'+ui.item.item_id);
				$("#sol_loqa").attr("id",'sol_loqa'+ui.item.item_id);
				return false; 
			} 
		}); 
		
		
	 }
	


