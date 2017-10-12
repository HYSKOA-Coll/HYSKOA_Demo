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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/media.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/teacher/js/home.js"></script>

<style type="text/css">

</style>
</head>
<body>
<!-- 头部导航 bg -->

      <div class="title-logo pull-left" onclick="end_class(this)">
              <a id="start" href="${pageContext.request.contextPath}/teacher/home.jsp"><img src="${pageContext.request.contextPath}/teacher/img/start.png"></a>
      </div>
      <ul class="nav-list pull-left clearfix">
              <li><a id="tlzygl" href="${pageContext.request.contextPath}/media/getmedia.action?pageNow=1&info_id=&media_type=&media_level=&media_name=">听力资源管理</a></li> 
              <li><a id="tltkgl" href="${pageContext.request.contextPath}/question/getquestionp.action?pageNow=1&info_id=&packet_level=&name_type=">听力题库管理</a></li>
              <li><a id="jxfx" href="javascript:void(0)">教学分析</a></li>
              <li><a id="xsgl" href="studentmanage.jsp">学生管理</a></li>
              <li><a id="zygl" href="homework.jsp">作业管理</a></li>
              <li><a id="jxjh" href="${pageContext.request.contextPath}/getplan.action?pageNow=1">教学计划</a></li>
      </ul>
      
      <div class="login-info pull-right">
              <span id="userinfo"></span>&nbsp;&nbsp;
              <div class="user-info text-center">
                 <p><a href="/main/teacher_plan/updpwd">修改密码</a></p>
                 <p><a href="${pageContext.request.contextPath}/checkout.action?info_name=teacher">退出</a></p>
              </div>
      </div>

		<input type="hidden" id="teacher" value="${teacher_id }">
		
<!-- 头部导航 end -->
<script type="text/javascript">
</script>
</body>
</html>