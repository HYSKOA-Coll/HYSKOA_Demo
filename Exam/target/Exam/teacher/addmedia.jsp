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
          <a href="media.jsp">
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
             <input type="button" name="cancel-btn" value="取 消" id="cancel_add" onclick="location.href = '/main/media/';">
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
       	<form action="">
            <div class="custom-file-box inline-block media-file" style="width:44%;">
                 <a href="javascript:void(0)">选择文件</a>
                 <span>未选择任何文件</span>
                <input type="file" name="myMedia" class="custom-file" id="myMedia" accept="audio/*,video/*">
             </div>
             <input type="text" class="custom-file-box" style="width: 442px;"/>
             <select class="form-control" style="width: 442px;">
                    <option>全部资源</option>
                    <option>我的资源</option>
	           </select>	
	           <select class="form-control" style="width: 442px;">
                    <option>全部资源</option>
                    <option>我的资源</option>
	           </select><br/><br/>					
        </form>
    	</div>
	</div>
</div>
</div>
<!-- 中间部分end  -->

<script>
/*  导航 */
if(document.getElementById("tlzygl")){
$(".nav-list").children().eq(0).find("a").css({"fontSize":"21px", "color":"#60ac62"});
}  

/*  刷新时侧边栏样式 */
window.onload = function(){
	  var src = $("#id2").find("img").attr("src");
	  src = src.replace(/\d/,"2");
		$("#id2").find("img").attr("src",src);
		$("#id2").css("backgroundColor","#60ac62").find("p").css("color","#fff");
	}
</script>
</body>
</html>