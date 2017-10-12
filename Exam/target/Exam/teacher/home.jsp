<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师首页</title>
<style type="text/css">
font{
	margin-right: 10px;
}
.home_from{
	margin-left: 30px;
}
#clazz{
display:inline;margin-right: 10px; width: 300px;"
}
#media{
display:inline;margin-right: 10px; width: 300px;"
}
#media_show{
	margin-left: 27%;
	margin-top: 5%;
}
</style>
</head>

<body>
<!-- 头部导航  -->
<div class="nav-box clearfix">
	<jsp:include page="title.jsp"/> 
</div>
<!-- 侧边栏  bg -->
<div class="sidebar">
      <div class="hide-sidebar"></div>
      <ul id="left_nav_ul" class="sidebar-list">
      	<li id="id">
	         <a href="javascript:void()">
              <img alt="" src="img/hide_sidebar_0.png">
	         </a>
        </li>
      </ul>
</div>
<!-- 侧边栏  end -->

<div class="content-box clearfix">
   <div class="slug slug_left pull-left clearfix" id="slug_load_media">
                    <!-- 头部 标题+查询 bg -->
         <div class="content-head clearfix">
                 <h3 class="pull-left">开始上课</h3>
         </div>
                    <!-- 头部 标题+查询 end -->
                    <!-- 正文 内容 bg -->
         <div class="content-detail" id="media_show">
            <div class="edit-content start-class">
              <form class="home_from" action="">
		   			 				<font>上课班级</font>
		   			 				<select class="form-control" id="clazz">
                    <option>全部资源</option>
                    <option>我的资源</option>
	              </select><br/><br/>
	              <font>教学计划</font>
	              <select class="form-control" id="media">
                    <option>全r资源</option>
                    <option>我的资源</option>
	              </select><br/><br/>
              
	   			 		 </form>
                <div class="start-class-btn">
                   <input type="button" name="sure-btn" id="start" value="开始上课"  style="width: 250px; margin-left: 100px; margin-bottom: 60px;" onclick="star_class()">
                </div>
            </div>
         </div>
                <!-- 正文 内容 end -->
    </div>
</div>



<script type="text/javascript">
//显示隐藏侧边栏
$(".hide-sidebar").click(function(){
  $(".sidebar-list").slideToggle();
})

</script>
</body>
</html>