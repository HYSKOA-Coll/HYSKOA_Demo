<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课堂试题</title>
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
	min-height:460px;
 	height:100%;
 	background-color: #fff;
  border:1px solid #c9c9c9;
  
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
		<li class=""><a href="${pageContext.request.contextPath}/student/kt.jsp">已上的课</a></li>
		<li class="now" style="color:white;">正在上的课</li>
	</ul>
</div>
<!-- 侧边栏  end -->

<!-- 正文  -->
<div class="middle">

</div>	
<!-- 正文 end -->

<input type="hidden" id="student_id" value="${student_id }">

<script type="text/javascript">
	function selectclazz(){
		
		info_id = $("#student_id").val() 
		
		   $.ajax({
				type:'POST',
				data:"info_id="+info_id,
				url:'${pageContext.request.contextPath}/instanceAnswer/selectClazz.action',
				success:function(resultData){
					if(resultData == "repeat"){
						alert("当前没有课")
						return;
					}
					alert(resultData.token+"------"+resultData.packet_id)
					
					/* packet_id 查询题目 */
					   $.ajax({
							type:'POST',
							data:"packet_id="+resultData.packet_id,
							url:'${pageContext.request.contextPath}/instanceAnswer/packetIdselect.action',
							success:function(resultData){
								
								$(".middle").html(resultData)
								aa()
							} 
						}) 
					
					
					
				} 
			}) 		
	}
	
	window.onload = function(){
		selectclazz()

	}
</script>

</body>
</html>