
//閬僵灞傞珮搴�
var con_box_height = $(".content-box").innerHeight();
$(".cover").css("height",con_box_height + "px");

//鎿嶄綔閮ㄥ垎榧犳爣鍋滅暀鏁堟灉
$(".edit-td").children().mouseenter(function(){
	var src = $(this).find("img").attr("src");
	src = src.replace(/\d/,"1");
	$(this).find("img").attr("src",src);
}).mouseleave(function(){
	var src = $(this).find("img").attr("src");
	src = src.replace(/\d/,"0");
	$(this).find("img").attr("src",src);
})

//input-file妗�
$(".custom-file").change(function(){
       var txt = $(this).val();
       var txt_arr = txt.split("\\");
       $(this).prev().text(txt_arr[txt_arr.length-1])

   })
   
//select 鏁堟灉
$(".custom-select").change(function(){
    var txt = $(this).children("option:selected").text();
    $(this).parent().find("span").text(txt);
})


//鍙充晶缂栬緫绐楅珮搴﹁缃�
var slug_left_height = $(".slug_left").innerHeight();
$(".slug_right").css({"minHeight":slug_left_height + "px"});

//鎷栨嫿 榧犳爣鍋滅暀鏁堟灉
$(".drag").mouseenter(function(){
	var src = $(this).find("img").attr("src");
	src = src.replace(/\d/,"1");
	$(this).find("img").attr("src",src);
}).mouseleave(function(){
	var src = $(this).find("img").attr("src");
	src = src.replace(/\d/,"0");
	$(this).find("img").attr("src",src);
})

/*//鎷栨嫿缂栬緫妗嗘晥鏋�
var slug_left = $(".slug_left").get(0);
//var slug_right = $(".slug_right").get(0);
//var drag = $(".drag");
var slug_right = document.getElementsByClassName("slug_right");
for(var i=0;i<slug_right.length;i++){
	var drag = slug_right[i].firstElementChild;
}
var body = document.body || document.documentElement;
var key = false;
drag.onmousedown = function(e){
	key = true;
	var e = window.event || e;
	if(e.preventDefault){    //闃绘榛樿浜嬩欢
		e.preventDefault()
	}else{
		e.returnValue = false;
	}
	var click_x = e.clientX;    //鐐瑰嚮鏃跺厜鏍囧湪娴忚鍣ㄥ彲瑙嗗尯鍩熺殑x杞村潗鏍�
	var body_width = body.clientWidth;   //鏂囨。鍙鍖哄煙鐨勫搴�
	var slug_left_width = parseInt(window.getComputedStyle(slug_left).width);
	var slug_right_width = parseInt(window.getComputedStyle(slug_right).width);
	slug_left.style.maxWidth = slug_left_w + "px";       //璁剧疆slug_left鐨勬渶澶у搴︿负slug_right婊戝嚭鏃剁殑瀹藉害
	document.onmousemove = function(e){
		if(key){
			//console.log("榧犳爣鍦ㄧЩ鍔�")
			var move_slug_right_width = parseInt(window.getComputedStyle(slug_right).width);
			var move_slug_left_width = parseInt(window.getComputedStyle(slug_left).width);
			if(move_slug_left_width<=830){
				$(".slug_right").addClass("box-shadow")
			}else{
				$(".slug_right").removeClass("box-shadow")
			}
			var move_x = e.clientX;    //绉诲姩鏃跺厜鏍囧湪娴忚鍣ㄥ彲鏄尯鍩熺殑x杞村潗鏍�
			var right_width_res = parseInt(body_width - move_x);   //鍏夋爣璺濈娴忚鍣ㄥ彲瑙嗗尯鍩熷彸渚х殑璺濈
			var add_num = right_width_res - slug_right_width      //鍙充晶瀹藉害鏀瑰彉鐨勫ぇ灏�
			var left_width_res = slug_left_width - add_num;
			slug_left.style.width = left_width_res + "px";    //璁剧疆宸︿晶妗嗙殑瀹藉害
			slug_right.style.width = right_width_res +"px";    //璁剧疆鍙充晶妗嗙殑瀹藉害
			
		}else{
			return;
		}
	}
}
document.onmouseup = function(){
	//console.log("榧犳爣鏉惧紑浜�")
	key = false;
	return key;
}
*/



//鎷栨嫿缂栬緫妗嗘晥鏋�
var slug_left = $(".slug_left").get(0);
var slug_right_list = document.getElementsByClassName("slug_right");
for(var i=0;i<slug_right_list.length;i++){
	var slug_right = slug_right_list[i];
	var drag = slug_right_list[i].firstElementChild;
	drag_run(slug_right,drag)
}
function drag_run(slug_right,drag){

	var body = document.body || document.documentElement;
	var key = false;
	
	drag.onmousedown = function(e){
		key = true;
		var e = window.event || e;
		if(e.preventDefault){    //闃绘榛樿浜嬩欢
			e.preventDefault()
		}else{
			e.returnValue = false;
		}
		var click_x = e.clientX;    //鐐瑰嚮鏃跺厜鏍囧湪娴忚鍣ㄥ彲瑙嗗尯鍩熺殑x杞村潗鏍�
		var body_width = body.clientWidth;   //鏂囨。鍙鍖哄煙鐨勫搴�
		var slug_left_width = parseInt(window.getComputedStyle(slug_left).width);
		var slug_right_width = parseInt(window.getComputedStyle(slug_right).width);
		slug_left.style.maxWidth = slug_left_w + "px";       //璁剧疆slug_left鐨勬渶澶у搴︿负slug_right婊戝嚭鏃剁殑瀹藉害
		document.onmousemove = function(e){
			if(key){
				//console.log("榧犳爣鍦ㄧЩ鍔�")
				var move_slug_right_width = parseInt(window.getComputedStyle(slug_right).width);
				var move_slug_left_width = parseInt(window.getComputedStyle(slug_left).width);
				if(move_slug_left_width<=830){
					$(".slug_right").addClass("box-shadow")
				}else{
					$(".slug_right").removeClass("box-shadow")
				}
				var move_x = e.clientX;    //绉诲姩鏃跺厜鏍囧湪娴忚鍣ㄥ彲鏄尯鍩熺殑x杞村潗鏍�
				var right_width_res = parseInt(body_width - move_x);   //鍏夋爣璺濈娴忚鍣ㄥ彲瑙嗗尯鍩熷彸渚х殑璺濈
				var add_num = right_width_res - slug_right_width      //鍙充晶瀹藉害鏀瑰彉鐨勫ぇ灏�
				var left_width_res = slug_left_width - add_num;
				slug_left.style.width = left_width_res + "px";    //璁剧疆宸︿晶妗嗙殑瀹藉害
				slug_right.style.width = right_width_res +"px";    //璁剧疆鍙充晶妗嗙殑瀹藉害
				
			}else{
				return;
			}
		}
		document.onmouseup = function(){
			key = false;
			//console.log("榧犳爣鏉惧紑浜�"+key)
			return key;
		}
	}
}

//鐐瑰嚮鍙栨秷 鏀跺洖鎷栨嫿绐楀彛
/*function upd_hidd(){
	slug_left.style.maxWidth = "";    //娓呴櫎slug_left鐨勬渶澶у搴﹁缃�
	$(".slug_left").animate({"width":"98.5%"})
	var slug_right_w = $(".slug_right").innerWidth();
	$(".slug_right").animate({"right": -slug_right_w - 15 + "px"},function(){
		$(this).css({"width":"30%","display":"none"});
	});
	
}*/


