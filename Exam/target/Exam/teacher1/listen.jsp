<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>听力题库管理</title>
<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<link href="css/listen.css" rel="stylesheet" type="text/css" />
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
		<h3>增加听力试题</h3>
		<div id="button">
			<input class="button" type="button" value="开始出题">
			<input class="button" type="button" value="完成">
		</div>
		<hr size=1 style="color:gray;border-style:dashed;width:100%">
		<div id="auto" width="100%">
			<span>请先填写试题信息</span>
		</div>
		<div id="sjx"></div>
		<div id="span">
			<span>资源名称</span>
		</div>
		<div id="name">	
			<input class="button" id="choose" type="button" value="请选择"><span>选择资源</span>
		</div><br/>
		<div id="input">	
			<span>试题名称</span><input type="text" placeholder="试题名称">
			<span>试用学科</span><input type="text" placeholder="学科名称">
		
		<span>难度等级</span>
		<select>
			<option>难度等级</option>
			<option>简单</option>
			<option>一般</option>
			<option>困难</option>
		</select>
		</div><br/>
		<div id="intervene">
			<p>整体干预</p><textarea placeholder="干预内容" ></textarea>
		</div>
		<div id="test">
			<p>试题显示区域</p><textarea></textarea>
		</div>
		<p id="p">作业信息填写完成后点击“开始出题”按钮开始出题</p>
	</div>
</body>
</html>