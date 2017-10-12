<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{
	background-color:rgb(233, 233, 233);
}
#bodw{
	border:1px solid white;
	width: 5%;
	height:50px;
	position:absolute;
	left:0;
	top:30px;
	float: left;
}
#bodbd{
	border: 1px solid white;
	width: 90%;
	height: 300px;
	margin-top: 30px;
	margin-left:7%;
}
#bodc{
	text-align: center;
	font-size: 20px;
}
/* select{  
	width:15%;  
  height:30px;  
 	appearance:none;  
  -moz-appearance:none;  
  -webkit-appearance:none;  
  background: url("images/select.png") no-repeat right center;  
  font-size:16px;  
  font-family:Microsoft YaHei;  
  color:black;  
} */
#xl{
	margin-left:700px;
	margin-top: 20px;
} 
#bdimg{
	margin-top: 30px;
	margin-left: 950px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- 中间部分  -->
	<div id="bodw"style="background-color:white;text-align: center;height:240px; ">
		<a href="#">
			<img alt="" src="../img/hide_sidebar_1.png"width="50%"style="margin-top: 15px;">
		</a><br/><br/>
		<div style="background-color: #60ac62;height:65px;">
			<a href="demo3_iframe.jsp">
				<img alt="" src="../img/search_2.png"width="50%" style="margin-top: 10px;"><br/>
				<b style="color:white;">查询</b>
			</a>
		</div><br/>
			<a href="./student.jsp"target="iframe_a">
				<img alt="" src="../img/add_1.png"width="50%" style="margin-top: 10px;"><br/>
				<p style="color:black;">增加</p>
			</a>
	</div>
		<div id="bodbd"style="background-color:white;">
			<p style="font-size:23px;float:left;">班级列表</p>
			<div id="xl">
			<form action="">
				<button style="background-color:green;border: 8px;width:15%;margin-left:420px;
	font-size: 16px;text-align: center;color: white;value="添加">添加</button>
			</form>	
			</div>
			<hr style="border:2; border-top:1px dotted #222;
			width:100%;float: left;margin-top:-10px; "><br/><br/><br/>
			<form action="">
				<div id="bodc">
	
				</div>
			</form>
		</div>
	</div>
</body>
</html>