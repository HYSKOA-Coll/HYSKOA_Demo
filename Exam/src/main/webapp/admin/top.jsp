<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdminTop</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-2.1.4.min.js"></script>

 <style type="text/css">

</style> 
</head>
<body>
	<div class="topleft">
    <a href="home.jsp" target="_parent">
    <img src="images/logo.png" title="系统首页" /></a>
	</div>
	<div>

    <div class="topright"> 
    <ul>
    <li><a>当前时间 :</a> <a id="curr_time"></a></li>
    <li><a href="${pageContext.request.contextPath}/checkout.action?admin_name=admin" target="_parent">退出</a></li>
    <li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    </ul>
   </div> 
   	<div class="topcontent">
	</div>
   <script type="text/javascript">
	//获取当前时间
   function setCurtime() {
	   	 var d = new Date()
       var vYear = d.getFullYear()
       var vMon = d.getMonth() + 1
       var vDay = d.getDate()
       var h = d.getHours(); 
       var m = d.getMinutes(); 
       var se = d.getSeconds(); 
       var s=vYear+"-"+(vMon<10 ? "0"+ vMon : vMon)+"-"+(vDay<10 ? "0"+ vDay : vDay)+" "+(h<10 ? "0"+ h : h)+":"+(m<10 ? "0" + m : m)+":"+(se<10 ? "0" +se : se);
       $("#curr_time").html(s)
      }
	
	window.onload = function(){
    setCurtime();
  	setInterval(function(){setCurtime()},1000);

		}
	
   </script>
</body>
</html>