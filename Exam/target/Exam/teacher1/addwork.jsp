<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的作业</title>
<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<link href="css/addwork.css" rel="stylesheet" type="text/css" />
<style>
/* 	/* Chrome, Safari, Opera */
@-webkit-keyframes mymove {
    20% {margin-top:20px;}
}
/* Standard syntax */
@keyframes mymove {
    20% {margin-top: 15px;}
} 
</style>
</head>
<body>
	<div id="bodw">
		<div id="hide">
			<a href=""><img src="../img/hide_sidebar_1.png"></a>
		</div>
		<div id="li">
			<ul>
				<li>
					<a href="">
						<img src="../img/search_0.png">
						<p style="color:black;">查询</p>
					</a>
				</li>
				<li style="background-color:#60ac62;">
					<a href="./demo6_iframe.jsp" target="iframe_a">
					<img src="../img/add_2.png"><br/>
					<p style="color:white;">增加</p></a>
				</li>
			</ul>
		
		</div><br/>
	</div>
	<div id="all">
		<h3>增加作业</h3>
		<div id="button">
			<input class="button" type="button" value="开始出题">
			<input class="button" type="button" value="完成">
		</div>
		<hr size=1 style="color:gray;border-style:dashed;width:100%">
		<div id="auto" width="100%">
			<span>请先填写作业信息</span>
		</div>
		<div id="sjx">
			
		</div>
		<div id="span">
			<span>教学计划</span>
		</div>
		<div id="name">	
			<input class="button" id="choose" type="button" value="请选择"><span>选择计划</span>
		</div>
		<div id="homework">
			<span>作业名称</span><input type="text" placeholder="作业名称">
		</div>
		<div id="test">
			<p>试题显示区域</p><textarea></textarea>
		</div>
		<p id="p">作业信息填写完成后点击“开始出题”按钮开始出题</p>
	</div>
</body>
</html>