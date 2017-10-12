<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生列表</title>
<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<link href="css/student.css" rel="stylesheet" type="text/css" />
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
		<h3>学生列表</h3>
		<div id="button">
			<input type="text" placeholder="姓名/学号/性别">
			<input class="button" type="button" value="查询">
			<input class="button" type="button" value="完成" >
		</div>
		<br/>
		<table width="100%" border="1px" cellspacing="0" >
			<tr height="50px">
				<th>编号</th><th>学号</th><th>姓名</th><th>性别</th><th>操作</th>
			</tr>
			<tr align="center" height="40px">
				<td>1</td><td>10026</td><td>123</td><td>男</td><td><a href="#"><img src="../img/edit_1.png" height="30px"></a><a href="#"><img src="../img/delete_1.png" height="30px"></a></td>
			</tr>
		</table>
	</div>
</body>
</html>