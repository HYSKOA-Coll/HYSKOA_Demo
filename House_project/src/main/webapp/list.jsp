<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>

<style type="text/css">
	

</style>
</head>
<body>

<script type="text/javascript">
/*$(function(){
	  $("#info td").click(function(){
	    $("#info td").eq($(this).index()).addClass("navdown").siblings().removeClass("navdown");
	    	$(".u1").css("color","black") 
	  })
})
 	$(function(){
	  $("#info2 td").click(function(){
	    $("#info2 td").eq($(this).index()).addClass("navdown").siblings().removeClass("navdown");
	    $(".u2").css("color","black")
	  })
	  
	}) */
		
</script>
<%-- 分页：第六步： 
                                  之前获取的所有数据封装在List<Employee>里面   
              
                                 分页之后，所有的数据封装在PageBean对象中，data属性就是List<Employee>
             
      --%>  

  		<%--  	${rentmin }
  			${rentmax } 
  			${room}   --%>
  			${fileName }
  			<input type="hidden" id="rentmin_input" value="${rentmin }">
  			<input type="hidden" id="rentmax_input" value="${rentmax }">
  			<input type="hidden" id="hroom" value="${room }">
  				
  		 		<div class="panel panel-default">
					    <div class="panel-body">
					    				
					      	<c:forEach items="${pb.data }" var="list">
					      	<a href="content.action?id=${list.id }" id="a_house_one">
					       <div id="xin2">
									<b id="xin2_b">${list.title }</b></br></br>
									<span>${list.hroom }室${list.hhall }厅${list.hwei }卫   ${list.hrice }m²</span><br/><br/>
									<span>${list.aname }</span>
					       </div>
					         <div id="xin3">
										<span id="xin3_span">${list.rent }</span>元/月
					        </div>
					        <div id="xin1">
					        <img alt="" src="${pageContext.request.contextPath}/${list.picture}">
					     	 </div>
					     	 	</a>
					     	 	<hr/>
					     	 </c:forEach>
					     	 
					     	 
					     	<%--  <c:forEach items="${pb.pageNow }" begin="1" end="5">
					     	 			${pb.pageNow }
					     	 </c:forEach> --%>
					     	 
			<%-- 		     	 
        <li><a href='?nowPage=${nowPage-1}'>←上一页</a></li>
                   <c:forEach varStatus="i" begin="1" end="${sumPage}">
                        <c:choose>
                           <c:when test="${nowPage==i.count}">
                              <li class='disabled'>${i.count}</li>
                           </c:when>
                           <c:otherwise>
                               <li  class='active'><a href='?nowPage=${i.count}'>${i.count}</a></li>
                           </c:otherwise>
                        </c:choose>
                   </c:forEach>
					     	  --%>
					       <div align="center">
									<ul class="pagination pagination-lg">
										  	 <li><a onclick="firstPage()" href="javascript:;">首页</a></li>
										    <li><a onclick="beforePage(${pb.pageNow-1})"  href="javascript:;">&laquo;</a></li>
										  	 <li> <a onclick="beforePage(${pb.pageNow-1})"  href="javascript:;">1</a></li>
					      			 	<li> <a onclick="afterPage(${pb.pageNow+1})" href="javascript:;">2</a></li>
					      			 	<li> <a onclick="afterPage(${pb.pageNow+1})" href="javascript:;">3</a></li>
										    <li> <a onclick="afterPage(${pb.pageNow+1})" href="javascript:;">&raquo;</a></li>
										    <li><a onclick="lastPage(${pb.totalPage})" href="javascript:;">尾页</a></li> 
										</ul> 
										 <p align="center" id="cont">
								                    总共${pb.totalNum}条记录 ;每页显示${pb.pageNum };
								                    当前第${pb.pageNow }页;总共${pb.totalPage}页
    								 </p> 
									</div>
					    </div>
					</div>
</body>
</html>