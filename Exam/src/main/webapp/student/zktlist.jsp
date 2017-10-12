<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课堂试题</title>
<style type="text/css">
.stuquestion{
	margin-left: 30px;
	margin-top: 30px;
}
.stuquestion b{
	color: #575555;
	margin-right: 10px;
}
.stufrom{
	margin-top: 20px;
}
.stuquestion input[type="radio"]{
	margin-left: 40px;
	margin-top: 10px;
	margin-right: 10px;
}
.stuquestion input[name="search-btn"]{
	width: 60px;
	margin-left: 10px;
	margin-top: 30px;
	border-radius:4px;
}
</style>
</head>
<body>
	<%--  ${stuqlist }  --%>
	<div class="stuquestion">
			<b>试题：</b><span>${stuqlist.datas[0].packet_name  }</span><br/>
			<b>题量：</b><span>2</span><br/>
		<div class="stufrom">
			<from class="qfrom"> 
			<c:forEach items="${stuqlist.datas  }" var="list">
				<font>1、题干：&nbsp;&nbsp;</font>
				<span>${list.question_name }</span><br/>
			<div class="xx">
				<input name="Fruit" type="radio">
				A：<font></font><br/>
				<input name="Fruit" type="radio">
				B：<font></font><br/>
				<input name="Fruit" type="radio">
				C：<font></font><br/>
				<input name="Fruit" type="radio">
				D：<font></font><br/>
				<input name="Fruit" type="radio">
				E：<font></font><br/>
				<input type="hidden" value='${list.question_option }'>
			</div>
				</c:forEach>
				<input type="button" name="search-btn" value="提交">
			</from>
		</div>
	</div>
	
	<script type="text/javascript">
	
	function aa(){
		question_option = JSON.parse($(".qfrom input[type='hidden']").val());
		$(".xx").children().eq(1).html(question_option.A).prev().val(question_option.A)
		$(".xx").children().eq(4).html(question_option.B).prev().val(question_option.B)
		$(".xx").children().eq(7).html(question_option.C).prev().val(question_option.C)
		$(".xx").children().eq(10).html(question_option.D).prev().val(question_option.D)
		$(".xx").children().eq(13).html(question_option.E).prev().val(question_option.E)
		
		alert($(".xx").children().eq(3).val())
		alert($("input:radio:checked").val())
	}
	</script>
</body>
</html>