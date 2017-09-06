<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客首页</title>

		<!-- ------------------js引用 ------------------------------  -->
 		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<!--  ----------------------css部分--------------------------  -->
		<style type="text/css">
			#top{
				font-size: 16px;
				margin-left: 65%;
				margin-top: 20px;
			}
			#user{
				font-size: 26px;
				margin-left: 2%;
				margin-bottom: 20px;
				color: #1C1C1C;
			}
			.card{
				margin-top: 40px;
				margin-left:7%;
				width: 1200px;
				height: 250px;
			}

			table{
				width: 1200px;
			}
			th{
				padding-left:2px;
			}
			td{
				padding-left:2px;
			}
			.t1{
				width: 830px;
				height: 40px;
			}
			.t2{
				width: 110px;
			}
		 	.t3{
				width: 170px;
			} 
		</style>
</head>

<body>

	<div id="top">
			<a name="check_in" href="">欢迎您：${user}</a>&nbsp;&nbsp;&nbsp;
			当前时间为:<span id="curr_time"></span>&nbsp;&nbsp;&nbsp;
			
			<%-- href="${pageContext.request.contextPath}/logout" --%>
			<a href="#" onclick="logout()" id="check_logout"><b name="check_out">退出</b></a>
		</div>
		
		<div id="user">
			<font name="user_val">${user}</font>&博客
		</div>
		
		 <div id="banner">
			<ul class="nav nav-tabs">
				<li><a>&nbsp;</a></li>
				<li class="active"><a href="main.jsp">首页</a></li>
				<li><a href="publish.jsp">发帖</a></li>
				<li><a href="#">关于我的</a></li>
			</ul>
		</div>
   	 
   	 
   	 <div class="card">
       	<div class="panel panel-primary">
       	
    			<div class="panel-heading">
       		 <h3 class="panel-title">
           					精品贴
       		 </h3>
   			 </div>
   			 
   				<div id="container"></div>
   				
			<!-- 		<ul class="pagination">
					    <li><a href="#">&laquo;</a></li>
					    <li><a href="#">1</a></li>
					    <li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
					    <li><a href="#">&raquo;</a></li>
					</ul> -->
   				
   				
   			<%--
           分页：第一步
                    提出需求：
          分页：第六步： 
                    给a标签编写url
         center----->Servlet---->CenterCLServlet
         ?what=getAll ---- 查询全部内容【分页处理】
          pageNow=动态获取
      --%>
      
			</div>
    </div> 
			
    	<script type="text/javascript">
    /****************************js部分*************************************/
		//获取当前时间
    	   function setCurtime() {
    	          var date = new Date();
    	          var dateStr = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()
    	          $("#curr_time").html(dateStr)
    	      }
    
    /*******************************确认是否退出**********************************/
    
    function logout(){
    	
    	/* alert("logout") */
    	var flag = confirm("新确定要退出吗？")
    	
    	if(flag){
    		
    		document.getElementById("check_logout").setAttribute("href","${pageContext.request.contextPath}/logout"); 
    	   }
    }
    /**********************************判断登陆状态*********************************/      

    function cheak_login(){
			/* alert("----------") */
	
    	 if($("#user font[name='user_val']").html() == null || $("#user font[name='user_val']").html() == ""){
    			/* alert("-----cheak_login------空-------") */
    		   	
    				
    			$("#top a[name='check_in']").html('登陆');
    			$("#top a[name='check_in']").attr("href","${pageContext.request.contextPath}/login.jsp")
    			$("#top b[name='check_out']").html(''); 
    	}
    
 
 
    	}
    
          /*********************************查询list*************************************/ 
			
		 /* 	window.onload = function(){
				window.location.href = "${pageContext.request.contextPath}/list";
			}   */
			
			 function getlist(pageNow){
    			$.ajax({
    				type:'GET',
    				data:"pageNow="+pageNow,
    				url:'${pageContext.request.contextPath}/list',
    				success:function(resultData){
    					$("#container").html(resultData)
    				}
    			})
    
   			 }
			
			/******************************分页**************************/
			/* function first(){
				getlist(1)
			}
		
			function pageNow-1(){
				getlist(${pageNow-1})
			}
			
			function pageNow+1(){
				getlist(${pageNow+1})
			}
			function lastPage(){
				getlist(${lastPage})
			} */
			
			function firstPage(){
				getlist(1)
			}

			function beforePage(pageNow){
				getlist(pageNow)
			}
			
			function afterPage(pageNow){
				getlist(pageNow)
			}
			function lastPage(pageNow){
				getlist(pageNow)
			} 			 
			
			window.onload = function(){
  				getlist(1)
  	    			//每秒自动调用一次
    	   	setCurtime();
          setInterval(function(){setCurtime()},1000);
          
          cheak_login();
  			}
    	</script>
</body>
</html>