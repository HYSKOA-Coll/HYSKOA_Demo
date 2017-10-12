<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/teacher/css/home.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}//js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}//js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}//js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}//js/media.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/teacher/js/home.js"></script>
<style type="text/css">
body{background-color: #f5f5f5;}
.pull-left{margin-left: 40px; margin-right: 100px;}
.pull-right{margin-right: 100px;}

</style>
</head>
<body>
<!-- 头部导航 bg -->

      <div class="pull-left">
              <a href="${pageContext.request.contextPath}/teacher/home.jsp">
              <img src="${pageContext.request.contextPath}/teacher/img/start1.png" style="width: 68px; height: 60px; margin-top: 3px;"></a>
      </div>
      <ul class="nav-list">
              <li><a id="kt" href="${pageContext.request.contextPath}/student/kt.jsp">我的课堂</a></li>
              <li><a id="zy" href="studentmanage.jsp">我的作业</a></li>
              <li><a id="sz" href="${pageContext.request.contextPath}/editstudent.action?info_id=${student_id}">我的设置</a></li>
              <li><a id="yytk" href="${pageContext.request.contextPath}/question/stuquestionp.action?pageNow=1&info_id=&packet_level=&name_type=">英语题库</a></li>
      </ul>
      
      <div class="pull-right">
              <span id="userinfo"></span>&nbsp;&nbsp;
              <div class="user-info text-center">
              	<span>${student_name }</span>
              	<span> | </span>
                 <a href="${pageContext.request.contextPath}/checkout.action?info_name=student">退出</a>
              </div>
      </div>
		<input type="hidden" id="student_id" value="${student_id }">
<!-- 头部导航 end -->
<script type="text/javascript">
</script>
</body>
</html>