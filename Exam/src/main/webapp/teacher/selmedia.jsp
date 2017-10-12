<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
           <!-- 头部 标题+查询 bg -->
   
    <div class="content-detail" id="media_show">
  			<table class="table table-bordered table-hover">
  					 <thead>
						    <tr class="table_thead">
						    	<th>编号</th>
						    	<th>上传者</th>
						      <th>资源名称</th>
						      <th>资源大小</th>
						      <th>资源类型</th>
						      <th>难度</th>
						      <th>上传时间</th>
						      <th>操作</th>
						    </tr>
						    
						  </thead>
						   <tbody>
						     <c:forEach items="${getpb.datas }" var="list" varStatus="vas">
					   			<tr>
					   				<td>${vas.count+getpb.start}</td>
					   				<td>${list.info_name}</td>
							      <td>${list.media_name}</td>
							      <td>${list.media_size}</td>
                     <td>${list.media_type}</td>
                      <td>${list.media_level}</td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.media_time }" /></td>
                     <input type="hidden" id="info_id" value="${teacher_id }">
                     <td class="edit-td">
                       <a href="javascript:void(0)" onclick="sure_media('${list.media_name}',${list.media_id })" title="播放"><img src="${pageContext.request.contextPath}/teacher/img/play_0.png" alt="播放"></a>
                     </td>
					   			</tr>
					   		</c:forEach>
						   </tbody>
  			</table>

    </div>
     <div class="pagin">
     <div class="message">共&nbsp;<i class="blue">${getpb.totalRows }&nbsp;</i>条记录，当前显示第&nbsp;<i class="blue">${getpb.pageNow}&nbsp;</i>页</div>
				<ul class="pagination">
				    <li><a href="javascript:;" onclick="sele_media()">首页</a></li>
				    <c:forEach begin="1" end="${getpb.totalPages }" var="page"> 
				    <li><a href="javascript:;" onclick="getmedia(${page})">${page}</a></li>
				    </c:forEach>
				    <li><a href="javascript:;" onclick="getmedia(${getpb.totalPages })">尾页</a></li>
				</ul>
    </div> 
<!-- 听力资源滑块end  -->
<script src="${pageContext.request.contextPath}/teacher/js/home.js"></script>

<script type="text/javascript">

</script>
</body>
</html>