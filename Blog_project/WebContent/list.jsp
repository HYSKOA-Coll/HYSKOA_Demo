<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>

	<!-- ------------------js引用 ------------------------------  -->
 		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
	<div class="panel-body">
     	<table class="table table-hover">
				<tr>
					<th class="t1">标题</th>
					<th class="t2">发表人</th>
					<th class="t3">发布时间</th>
					<th class="t4">删除</th>
				</tr>


 <%-- 分页：第六步： 
                                  之前获取的所有数据封装在List<Employee>里面   
              
                                 分页之后，所有的数据封装在PageBean对象中，data属性就是List<Employee>
             
      --%>  
       
				<c:forEach items="${pb.data }" var="list">
				
				<tr>
				<%--  onclick="selectContent(${list.id},'${list.title }')" --%>
					
					<td><a href="content?id=${list.id}">${list.title}</a></td>
					<td>${list.user }</td>
					<td>${list.time }</td>
					<td onclick="deleteBlog(${list.id},'${list.user }')"><a href="javascript:;">删除</a></td>
					
					 <%-- href="delpub?id=${list.id}&user=${list.user }"  --%>
				</tr>
				
				</c:forEach> 
				
		</table>
		
				<div align="center">
					<ul class="pagination">
					  	<li><a onclick="firstPage()" href="javascript:;">首页</a></li>
					    <li><a onclick="beforePage(${pb.pageNow-1})"  href="javascript:;">&laquo;</a></li>
					  	 <li> <a onclick="beforePage(${pb.pageNow-1})"  href="javascript:;">1</a></li>
      			 	<li> <a onclick="afterPage(${pb.pageNow+1})" href="javascript:;">2</a></li>
      			 			<li> <a onclick="afterPage(${pb.pageNow+1})" href="javascript:;">3</a></li>
					    <li> <a onclick="afterPage(${pb.pageNow+1})" href="javascript:;">&raquo;</a></li>
					    <li><a onclick="lastPage(${pb.totalPage})" href="javascript:;">尾页</a></li>
					</ul> 
				</div>
				
  <%--    <p align="center">
        <a onclick="firstPage()" href="javascript:;">首页</a>
        <a onclick="beforePage(${pb.pageNow-1})"  href="javascript:;">上一页</a>
        <a onclick="afterPage(${pb.pageNow+1})" href="javascript:;">下一页</a>
        <a onclick="lastPage(${pb.totalPage})" href="javascript:;">尾页</a>
     </p>  --%>
     
     <p align="center" id="cont">
                    总共${pb.totalNum}条记录 ;每页显示${pb.pageNum };
                    当前第${pb.pageNow }页;总共${pb.totalPage}页
     </p>
   	</div>
   	
   	<script type="text/javascript">
		/*********************************删除一条数据*************************************/ 
   		
		function deleteBlog(id,user){

			 $.ajax({
					type:'GET',
					url:'${pageContext.request.contextPath}/delpub',
					data:"id="+id+"&user="+user,
					success:function(resultData){
					//如果请求成功,会执行该函数内容，resultData是响应数据
						alert(resultData); 
					
						//如果返回1 就跳转到login页面 如果返回 0 就提示用户名存在
						 if(resultData == "success"){
							alert("删除成功");
							window.location.href = "${pageContext.request.contextPath}/main.jsp";
						}
						else if(resultData == "repeat"){
							alter("删除失败")
							return;
						}
					 	else if(resultData == "fail"){
					 		alert("您没有删除权限");
							window.location.href = "${pageContext.request.contextPath}/main.jsp";
							
						} 
					 	else if(resultData == "nologin"){
							alert("请先登陆")
							window.location.href = "${pageContext.request.contextPath}/login.jsp";
						}
					}
				})
		}
		
	
   	</script>
</body>

</html>