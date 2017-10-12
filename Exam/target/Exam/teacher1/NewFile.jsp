<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/NewFile.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.min.js"></script>
<title>开始上课</title>
</head>
<body bgcolor="#fbfbff">
<!-- 头部栏框 -->
	<div	id="bod" style="background-color: white">
		<div id="boda" style="background-color: #60ac62; ">
			<a href="./demo_iframe.jsp"target="iframe_a">
				<img alt="" src="../img/start.png" style="width:70%;">
			</a>
		</div>
		<div id="bodb">
			<ul>
				<li><a href="./demo1_iframe.jsp"target="iframe_a"><b>听力资源管理</b></a></li>
				<li><a href="./demo2_iframe.jsp"target="iframe_a"><b>听力题库管理管理</b></a></li>
				<li><a href="#"><b>教学分析</b></a></li>
				<li><a href="./demo3_iframe.jsp"target="iframe_a"><b>学生管理</b></a></li>
				<li><a href="./demo4_iframe.jsp"target="iframe_a"><b>作业管理</b></a></li>
				<li><a href="./demo5_iframe.jsp"target="iframe_a"><b>教学管理</b></a></li>
			</ul>
		</div>
		<div class="dropdown">
			<img id="bimg" src="../img/username_0.png" style="width:15px;">
			<div class="dropdown-content">
				<a href="#">修改密码</a><br/><br/>
				<a href="#">退出</a>
			</div>
		</div>	
		<hr style="color:green;height: 3px;background-color:green;margin-top:58px; ">
	</div>
	<!-- <div id="bodw"style="background-color:white;text-align: center;height:240px; ">
		<a href="#">
			<img alt="" src="../img/hide_sidebar_1.png"width="50%"style="margin-top: 15px;">
		</a><br/><br/>
		<div style="background-color: green;height:65px;">
			<a href="">
				<img alt="" src="../img/search_2.png"width="50%" style="margin-top: 10px;"><br/>
				<b style="color:white;">查询</b>
			</a>
		</div><br/>
			<a href="./demo6_iframe.jsp"target="iframe_a">
				<img alt="" src="../img/add_1.png"width="50%" style="margin-top: 10px;"><br/>
				<p style="color:black;">增加</p>
			</a>
	</div> -->
	<iframe src="demo_iframe.jsp" frameborder="no" scrolling="no" name="iframe_a"style="width: 100%;text-align: center;height:800px;"></iframe>
</body>
</html>