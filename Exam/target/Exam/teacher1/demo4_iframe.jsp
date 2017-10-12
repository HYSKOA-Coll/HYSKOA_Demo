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
			<a href="demo4_iframe.jsp">
				<img alt="" src="../img/search_2.png"width="50%" style="margin-top: 10px;"><br/>
				<b style="color:white;">查询</b>
			</a>
		</div><br/>
			<a href="./addwork.jsp"target="iframe_a">
				<img alt="" src="../img/add_1.png"width="50%" style="margin-top: 10px;"><br/>
				<p style="color:black;">增加</p>
			</a>
	</div>
		<div id="bodbd"style="background-color:white;">
			<p style="font-size:23px;float:left;">作业列表</p>
			<div id="xl">
			<form action="">
				<select name=""style="margin-left: 200px;">
					<option>全部资源</option>
					<option>我的资源</option>
				</select>
				<input type="text"name=""style="width:20%;">
				<button style="background-color:green;border: 8px;width:15%;
	font-size: 16px;text-align: center;color: white;value="查询">查询</button>
			</form>	
			</div>
			<hr style="border:2; border-top:1px dotted #222;
			width:100%;float: left;margin-top:-10px; "><br/><br/><br/>
			<form action="">
				<div id="bodc">
					<table style="width:90%;margin:auto auto;font-size: 20px;"border="1px";
		cellspacing="0">
						<tr style="background-color:fbfbff;text-align: center; width: 33%;height: 40px;font-size: 18px;">
							<td>编 号</td>
							<td>教师计划</td>
							<td>作业名称</td>
							<td>创建时间</td>
							<td>操作</td>
						</tr>
					</table>
					<div id="bdimg">
						<a href="#"><img id="img" alt="" src="./img/2017-09-04 15:55:26 的截屏.png"style="margin-top:-5px;"></a>
						<a href="#"style=""><img alt="" src="./img/2017-09-04 16:00:21 的截屏.png"style="margin-left: -7px;"></a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>