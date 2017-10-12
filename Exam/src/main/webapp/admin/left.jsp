<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Left</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-2.1.4.min.js"></script>
</head>
<body style="background:#f0f9fd;">
	<div class="lefttop"><span onclick="toUrl()"></span><div style="font-size: 14px;" onclick="toUrl()">菜单栏</div></div>
	<dl class="leftmenu">
    <dd>
      <div class="title"> <span><img src="images/leftico01.png"></span>基础信息管理</div>
   		 <ul class="menuson">
          <li class="active"><cite></cite><a href="${pageContext.request.contextPath}/teacher/getteacher.action?pageNow=1" target="rightFrame">教师管理</a><i></i></li>
          <li class="active"><cite></cite><a href="${pageContext.request.contextPath}/getStudent.action?pageNow=1" target="rightFrame">学生管理</a><i></i></li>
          <li class="active"><cite></cite><a href="${pageContext.request.contextPath}/select.action?pageNow=1" target="rightFrame">班级管理</a><i></i></li>
          <li><cite></cite><a href="${pageContext.request.contextPath}/getlist.action?pageNow=1" target="rightFrame">学院管理</a><i></i></li>
      </ul>
		</dd>
    <dd>
      <div class="title"> <span><img src="images/leftico01.png"></span>系统管理</div>
    		<ul class="menuson">
           <li><cite></cite><a>系统角色</a><i></i></li>
           <li><cite></cite><a>菜单设置</a><i></i></li> 
           <li><cite></cite><a href="${pageContext.request.contextPath}/admin/adminModify.jsp" target="rightFrame">个人设置</a><i></i></li>
        </ul>
	 </dd>
	</dl>
<script type="text/javascript">
$(function(){  
    //导航切换
    $(".menuson li").click(function(){
            $(".menuson li.active").removeClass("active")
            $(this).addClass("active");
    });
    
    $('.title').click(function(){
            var $ul = $(this).next('ul');
            $('dd').find('ul').slideUp();
            var alt=$ul.attr("alt");
            
            if(alt!=null&&alt!=""){
                    try{
                    }catch (e){
                    }
            }
            if($ul.is(':visible')){
                    $(this).next('ul').slideUp();
            }else{
                    $(this).next('ul').slideDown();
            }
    });
            $(".menuson li").eq(0).click();
            parent.document.getElementById("rightFrame").src=$(".menuson li a").attr("href")
})  
</script>
</body>
</html>