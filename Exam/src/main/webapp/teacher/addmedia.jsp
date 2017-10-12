<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加资源</title>
<style type="text/css">
.custom-file-box{
	margin-left: 120px;
	margin-top: -200px;
	margin-bottom: 10px;
}
.form-control{
	margin-left: 120px;
	margin-top: 7px;
	margin-bottom: 16px;
}
input{
	margin-top: 10px;
}
.input_name ul{
	width: 100px;
	margin-top: 30px;
}
.input_name ul li{
	text-align: right;
	margin-top: 30px;
}
#file_i{
	position: absolute;
	top:30%;
	left: 55.5%;
	color: red;
}
.err{
	margin-left: 20px;
	color: red;
}
</style>
</head>
<body>

<!-- 头部导航  -->
<div class="nav-box clearfix">
	<jsp:include page="title.jsp"/> 
</div>
	
<!-- 正文  -->	

<!-- 侧边栏  bg -->
 <div class="sidebar">
      <div class="hide-sidebar"></div>
      <ul id="left_nav_ul" class="sidebar-list" data-toggle="collapse" data-target="#demo">
      	<li id="id">
	         <a href="javascript:void()">
              <img alt="" src="img/hide_sidebar_0.png">
	         </a>
        </li>
      </ul>

<div id="demo" class="collapse in">
    <ul id="left_nav_ul" class="sidebar-list">
       <li id="id1">
          <a href="${pageContext.request.contextPath}/media/getmedia.action?pageNow=1&info_id=&media_type=&media_level=&media_name=">
            <img alt="查询" src="img/search_0.png">
            <p>查询</p>
          </a>
       </li>
        <li id="id2">
            <a href="javascript:void(0)">
               <img alt="新增" src="img/add_0.png">
               <p>新增</p>
            </a>
        </li>
     </ul>
</div>
</div>
<!-- 侧边栏  end -->

<div class="content-box clearfix">
    <div class="slug slug_left pull-left clearfix" id="slug_load_media">
          <!-- 头部 标题+查询 bg -->
    <div class="content-head clearfix">
    		<h3>增加听力资源</h3>
    		<div class="con-head-infoSearch pull-right clearfix">
   			 		 <input type="button" name="sure-btn" value="确 定" id="sure_add" onclick="media_up()">
             <input type="button" name="cancel-btn" value="取 消" id="cancel_add" onclick="location.href = '${pageContext.request.contextPath}/media/getmedia.action?pageNow=1';">
     	 </div> 
    </div>
    
     <!-- 正文 内容 bg -->
   <div class="content-detail" id="add_media">
       <div class="edit-content auto-width">
				<div class="input_name">
					<ul>
						<li>文件</li>
						<li>名称</li>
						<li>资源类型</li>
						<li>难度等级</li>
					</ul>
				</div>
       	<form method="post" id="mediaFrom" enctype="multipart/form-data">
            <div class="custom-file-box inline-block media-file" style="width:44%;">
                 <a href="javascript:void(0)">选择文件</a>
                 <span id="filename">未选择任何文件</span>
                <input type="file" name="upload" class="custom-file" id="myMedia" accept="audio/*,video/*">
             </div><i id="file_i"></i>
             <input type="text" id="media_name" class="custom-file-box" style="width: 442px;"/><i class="err"></i>
             <select class="form-control" id="media_type" style="width: 442px;">
                    <option>音频</option>
                    <option>视频</option>
	           </select>
	           <select class="form-control" id="media_level" style="width: 442px;">
                     <option>简单</option>
                     <option>一般</option>
                     <option>困难</option>
	           </select><br/><br/>		
	           	<input type="hidden" id="info_id" value="${teacher_id }">			
        </form>
    	</div>
	</div>
</div>
</div>
<input type="hidden" id="teacher_id" value="${teacher_id }">
<!-- 中间部分end  -->

<script>

/*  导航 */
if(document.getElementById("tlzygl")){
$(".nav-list").children().eq(0).find("a").css({"fontSize":"21px", "color":"#60ac62"});
}  

/* 获取文件名 */
$(".custom-file").change(function(){
     var txt = $(this).val();
     var txt_arr = txt.split("\\");
		 $("#filename").html(txt_arr)
   })
   
   /* 验证登录 */
function check(){
	info_id = $("#teacher_id").val()
	if(info_id == "" || info_id == null){
		window.location.href = "${pageContext.request.contextPath}/login.jsp";
	}
}

/*  刷新时侧边栏样式 */
window.onload = function(){
		check()
	  var src = $("#id2").find("img").attr("src");
	  src = src.replace(/\d/,"2");
		$("#id2").find("img").attr("src",src);
		$("#id2").css("backgroundColor","#60ac62").find("p").css("color","#fff");
		
	}
	
	/* 添加 */
function media_up(){
	
	
	var filename = $("#filename").html().replace("C:fakepath","").trim();
	
	alert(filename)	
	var media_name = $("#media_name").val().trim();
	var media_type = $("#media_type").val().trim();
	var media_level = $("#media_level").val().trim();
	var info_id = $("#info_id").val().trim();
	alert("filename--"+filename+"media_name--"+ media_name+"media_type--"+ media_type+"media_level--"+ media_level)
	
	if(filename == "未选择任何文件"){
		$("#file_i").html('请选择上传文件');
		return;
	}
	if(media_name == "" || media_name==null){
		$("#media_name").next().html('请输入名称');
		return;
	}
	
	   var formData = new FormData($("#mediaFrom")[0]); 
		 alert("aaaaaaaa"+formData)
	 	 $.ajax({
				type:'POST',
				 url:'${pageContext.request.contextPath}/media/uploadmedia.action',
				 data: formData,  
			   async: false,  
		     cache: false,  
		     contentType: false,  
		     processData: false,   
			   success:function(resultData){
				   if(resultData != "" || resultData != null){
					   		media_size = parseFloat(resultData).toFixed(1);
					   		alert(media_size)
					   $.ajax({
							type:'POST',
							url:'${pageContext.request.contextPath}/media/addmedia.action',
							data:"media_name="+media_name+"&media_path="+filename+"&media_level="+media_level+"&media_type="+media_type+"&info_id="+info_id+"&media_size="+media_size,
							success:function(resultData){
								if(resultData=="success"){
								alert("添加听力资源成功")
								}
							}
						}) 
					   
				   }else{
					   
					   alert("size错误")
				   }
				}
			})  
	}
	
	
/*********************************聚集功能*************************************/

//监听添加对话框中输入框的聚焦事件

$("#myMedia").click(function(){
$("#file_i").html('');
});
$("#media_name").focus(function(){
	$(this).next().html('');
	});
</script>
</body>
</html>