<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的设置</title>
<style type="text/css">
.sidebar{
	width: 130px;
	height: 100%;
	box-shadow:1px 1px 5px #756b6b;
}
.sidebar ul li{
	text-align: center;
	border: 1px solid #c9c9c9;
	line-height: 45px;
}
.now{
	background-color: #60ac62;
	color: white;
	height: 45px;
}
.content-box{
	width: 86.5%;
	padding-left: 30px;
	
}
.pull-right b{
	margin-left: 10px;
}
#zai{
	margin-left: 16px;
}
.mysetfrom input{
	margin-left: 30px;
}

#sure{
	width: 280px;
	margin-top: 50px;
	margin-left: 70px;
}
.err{
	color: red;
	margin-left: 10px;
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
	<ul>
		<li class="">隐藏</li>
		<li class="now">修改密码</li>
	</ul>
</div>
<!-- 侧边栏  end -->

<div class="content-box clearfix">
   <div class="slug slug_left pull-left clearfix"style="height: 500px;">
                 <!-- 头部 标题+查询 bg -->
      	<div class="content-head clearfix">
            <h3 class="pull-left">修改密码</h3>
         	 	<div class="pull-right">
		         		<b>学号：</b><span>${user.info_num }</span>
		         		<b>姓名：</b><span>${user.info_name } </span>
		         		<b>性别：</b><span>${user.info_gender } </span>
		         		<b>班级：</b><span>${ user.info_pwd}</span>
		         		
	         	</div>
     		 </div>
                  <!-- 头部 标题+查询 end -->
                  
                  <!-- 正文 内容 bg -->
         <div class="content-detail" style="height: auto">
         
         	<form class="mysetfrom">
         	        	原密码<input id="usedpwd" type="text" placeholder="请输入原密码"  style="width: 350px;"><i class="err"></i><br/>
         	        	新密码<input id="freshpwd" type="text"  placeholder="请输入新密码" style="width: 350px;"><i class="err"></i><br/>
         	        	再次输入<input id="zai" type="text" placeholder="请再次输入新密码" style="width: 350px;"><i class="err"></i><br/>
         	        	
         	 <input name="sure-btn" value="确 定"  id="sure" type="button">
         	</form>
 
       	</div>
                <!-- 正文 内容 end -->
    </div>
</div>
<input type="hidden" value="${user.info_pwd }" id="info_pwd">
<script type="text/javascript">
//显示隐藏侧边栏
$(".hide-sidebar").click(function(){
  $(".sidebar-list").slideToggle();
})

/*  导航 */
if(document.getElementById("sz")){
$(".nav-list").children().eq(2).find("a").css({"fontSize":"21px", "color":"#60ac62"});
} 

$("#sure").click(function(){
	
	info_pwd = $("#info_pwd").val()
	usedpwd = $("#usedpwd").val()
	freshpwd = $("#freshpwd").val()
	zai = $("#zai").val()
	info_id = $("#student_id").val()
	
	alert("info_id---"+info_id)
	
	if(usedpwd != info_pwd || usedpwd== ""){
		$("#usedpwd").next().html("密码错误")
	}
	if(freshpwd == null || freshpwd== ""){
		$("#freshpwd").next().html("请输入新密码")
	}
	if(zai == null || zai== ""){
		$("#zai").next().html("请再次输入新密码")

	}else if(zai != freshpwd){
		$("#zai").next().html("密码不一致")
	}


	   $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/editstudent.action',
			data:"info_id="+info_id+"&infonewpwd="+zai,
			success:function(resultData){
				alert("修改成功")
			}
		}) 
})

/*********************************聚集功能*************************************/

//监听添加对话框中输入框的聚焦事件

$("#usedpwd").focus(function(){
	$(this).next().html('');
});
$("#freshpwd").focus(function(){
	$(this).next().html('');
});
$("#zai").focus(function(){
	$(this).next().html('');
});
</script>
</body>
</html>