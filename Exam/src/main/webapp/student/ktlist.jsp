<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 正文  -->

  <table class="table table-hover" style="width: 94%;">
    <thead>
		    <tr class="active">
            <th>老师</th>
            <th>时间</th>
            <th>教学计划</th>
            <th class="hidden-sm hidden-xs">操作</th>
		    </tr>
    </thead>
    <tbody>
    <c:forEach items="${endlist.datas  }" var="list">
        <tr class="reclick" onclick="review('264aa590-97f1-11e7-8a86-001921d1a1fa','52')">
            <td>${list.info_name }</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${list.start_time }" /></td>
            <td>${list.plan_name }</td>
            <td class="hidden-sm hidden-xs"><a href="javascript:void(0)" onclick="review('264aa590-97f1-11e7-8a86-001921d1a1fa','52')">回顾</a></td>
        </tr>
		</c:forEach>
        </tbody>
</table>
 <div class="pagin">
 <div class="message">共&nbsp;<i class="blue">${endlist.totalRows }&nbsp;</i>条记录，当前显示第&nbsp;<i class="blue">${endlist.pageNow}&nbsp;</i>页</div>
<ul class="pagination">
    <li><a href="javascript:;" onclick="selectAnswer(1)">首页</a></li>
    <c:forEach begin="1" end="${endlist.totalPages }" var="page"> 
    <li><a href="javascript:;" onclick="selectAnswer(${page})">${page}</a></li>
    </c:forEach>
    <li><a href="javascript:;" onclick="selectAnswer(${endlist.totalPages })">尾页</a></li>
</ul>
 </div>

</body>
</html>