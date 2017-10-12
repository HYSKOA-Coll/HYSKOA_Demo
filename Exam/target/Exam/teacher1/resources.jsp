<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加听力资源</title>
<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<link href="css/resources.css" rel="stylesheet" type="text/css" />
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
						<p style="color:white;">增加</p>
					</a>
				</li>
			</ul>
		
		</div><br/>
	</div>
	<div id="all">
		<h3>增加听力资源</h3>
		<div id="button">
			<input class="button" type="button" value="确定">
			<input class="cencel" type="button" value="取消" >
		</div>
		<hr size=1 style="color:gray;border-style:dashed;width:100%">
		<div id="span">
			<span>文件</span>
		</div> 
		<div id="name">
			<input class="button" id="choose" type="file" value="请选择"><span>选择资源</span>
		</div><br/>
		<div id="filename">
			<span>名称</span><input type="text">
		</div><br/>
		<div id="resources">
			<span>资源等级</span>
			<select>
				<option>音频</option>
				<option>视频</option>
			</select>
		</div><br/>
		<div id="resources">
			<span>难度等级</span>
			<select>
				<option>简单</option>
				<option>一般</option>
				<option>困难</option>
			</select>
		</div>
	</div>
	
</body>
</html>