<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生首页</title>
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
.slug_left{width: 95.5%;}
.middle{
	margin-top:6.5%;
	margin-left:160px;	
	width:86.5%; 
	min-width:700px;
 	height:100%;
 	background-color: #fff;
  border:1px solid #c9c9c9;
 }
 .table{
 	margin-top: 50px;
 	margin-left: 38px;
 	
 }
 .table th{
 	font-weight:bold;
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
		<li class="now"><a style="color: white;">已上的课</a></li>
		<li class=""><a href="${pageContext.request.contextPath}/student/zkt.jsp">正在上的课</a></li>
	</ul>
</div>
<!-- 侧边栏  end -->

<!-- 正文  -->
<div class="middle">
 
</div>	
<!-- 正文 end -->

<input type="hidden" value="${student_id }" id="student_id">

<script type="text/javascript">
//显示隐藏侧边栏
$(".hide-sidebar").click(function(){
  $(".sidebar-list").slideToggle();
})

/*  导航 */
if(document.getElementById("kt")){
$(".nav-list").children().eq(0).find("a").css({"fontSize":"21px", "color":"#60ac62"});
} 

/* 已上的课 */
function selectAnswer(pageNow){
	info_id = $("#student_id").val()
	alert("----info_id----"+info_id)
	
	   $.ajax({
			type:'POST',
			data:"info_id="+info_id+"&pageNow="+pageNow+"&instance_judge="+0,
			url:'${pageContext.request.contextPath}/instanceAnswer/selectAnswer.action',
			success:function(resultData){
				alert(resultData)
				$(".middle").html(resultData)
			} 
		}) 
	
}

window.onload = function(){
	selectAnswer(1)
}

</script>
</body>
</html>