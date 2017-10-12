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
	width: 100%;
	height: 300px;
	margin-top: 30px;
	margin-left: 5%;
	padding:30px;
}
#bodc{
	text-align:center;
	font-size: 20px;
}
h3{
	margin-top: -15px;
}
</style>
<title>开始上课</title>
</head>
<body>
		<!-- 中间部分  -->
		<div id="bodw"style="background-color:white;text-align: center; ">
			<a href="#">
				<img alt="" src="../img/hide_sidebar_1.png" width="50%" style="margin-top: 10px;">
			</a>
		</div>
		<div id="bodbd"style="background-color:white; width: 100%;">
			<h3>开始上课</h3>
			<hr style="border:1; border-top:1px dotted #222;width:100%;float: left;margin-top:-10px; "><br/><br/><br/><br/><br/><br/>
			<form action="">
				<div id="bodc">
				上课班级<select name=""style="width: 30%">
								<option>请选择</option>
								<option>---请选择---</option>
							</select><br/><br/>
				教学计划<select name=""style="width: 30%">
								<option>请选择</option>
								<option>---请选择---</option>
							</select>
				</div>
			</form>
		</div>
	
</body>
</html>