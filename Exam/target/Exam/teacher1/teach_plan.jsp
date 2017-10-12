<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教学计划</title>
<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<link href="css/teach_plan.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="all">
		<h3>增加作业</h3>
		<div id="button">
			<input class="button" type="button" value="增加试题">
			<input class="button" type="button" value="保存">
		</div>
		<hr size=1 style="color:gray;border-style:dashed;width:100%">
		<div id="homework">
			<span>计划名称</span><input type="text" placeholder="请输入教学计划名称">
		</div>
		<div id="homework">
			<span>适用学科</span><input type="text" placeholder="请输入所试用的学科">
		</div>
		<div id="test">
			<p>计划显示区域</p><textarea></textarea>
		</div>
		<p id="p">计划信息填写完成后点击“增加试题”进行添加教学计划</p>
	</div>
</body>
</html>