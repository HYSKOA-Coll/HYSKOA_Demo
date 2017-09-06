<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>详情页</title>

<!-- ------------------js引用 ------------------------------  -->
 		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<style type="text/css">
			#top{
				font-size: 16px;
				margin-left: 65%;
				margin-top: 20px;
			}
			#user{
				font-size: 22px;
				margin-left: 2%;
				margin-bottom: 25px;
				color: #1C1C1C;
			}
			.card{
				margin-top: 50px;
				margin-left:7%;
				width: 1200px;
			}
			.title{
				font-size: 20px;
				font-weight: bold；
			}
			.user{
				margin-left: 20px;
				font-size:14px;
				font-weight: bold;
			}
			.content{
				font-size: 15.2px;
				text-indent: 3em; 
				line-height: 35px;
				width: 1030px;
				margin-left: 80px;
			}
			.reply_ies{
				font-size: 16px;
				margin-left: 60px;
				margin-top: 30px;
			}
			.reply_qu{
				margin-top: 30px;
				margin-left:7%;
				width: 1000px;
			}
			p{
				font-size: 16px;
				font-weight: bold;
			}
			.yonghu{
				font-size: 15px;
				margin-left: 70%;
			}
			.shijian{
				font-size: 15px;
				margin-left: 20px;
			}
			#shanchu{
				position: absolute;
				left:80%;
			}
		</style>
</head>
<body>

			<div id="top">
				<a name="check_in" href="">欢迎您：${user}</a>&nbsp;&nbsp;&nbsp;
					当前时间为:<span id="curr_time"></span>&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/logout"><b name="check_out">退出</b></a>
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
	       	<h3 class="panel-title"><br/>
					<font class="title">${contentlist[0].title}</font><br/><br/>
					<font class="user">发表人 : ${contentlist[0].user}</font>
					<font class="user">发布时间 : ${contentlist[0].time}</font>
					</h3><br/>
    	</div>
    	
    <div class="panel-body">
        	<p class="content">${contentlist[0].content}</p>
        	<p class="content">${contentlist[0].content}</p>
        	<p class="content">${contentlist[0].content}</p>
    </div>
    
    
    <div class="panel panel-default">
       	
    			<div class="panel-heading">
       		 <h3 class="panel-title">
           					评论区
       		 </h3>
   			</div>
	   			 
	   			 <div class="panel-body">
	     			  <form  action="${pageContext.request.contextPath}/reply" method="get">
	     			  	<h3>评论</h3>
	     			  	<input type="hidden" value="${contentlist[0].id}" name="id">
	     			  	<textarea name="replies" class="form-control" rows="3"></textarea>
	     			  	<input type="submit" value="发表"  class="btn btn-default"></input>
	     			  </form>
	     			  </div>
	     			  
	     			  	<div class="reply_qu">
	     			  			<c:forEach items="${replylist}" var="replylist">
	     			  		
	     			  			<p>
	     			  					
	     			  			<a onclick="deleteReply(${replylist.rep_id },'${replylist.user }',${contentlist[0].id})" href="javascript:;" id="shanchu">删除</a>	     			  			
	     			  			${replylist.replies}</p>
	     			  			<br/>
	   								<font class="yonghu">${replylist.user }</font>
	   								<font class="shijian">${replylist.time }</font><br/>
	   								<hr style="color: red;"> 
										</c:forEach>
							</div>
	</div>
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
      
      
      
   /*********************************删除一条评论*************************************/ 
		
	function deleteReply(rep_id,user,id){

	   alert("-------deleteReply--------"+"-------"+id)
	   
		  $.ajax({
				type:'get',
				url:'${pageContext.request.contextPath}/delrep',
				data:"rep_id="+rep_id+"&user="+user,
				success:function(resultData){
				//如果请求成功,会执行该函数内容，resultData是响应数据
					alert(resultData); 
				
				if(resultData =="fail"){
					window.location.href = "${pageContext.request.contextPath}/login.jsp";
				}else if(resultData == "success"){
					alert("删除成功")
					window.location.href = "${pageContext.request.contextPath}/content?id="+id;
				}else if(resultData == "repeat"){
					alert("删除失败")
					return;
				}
				}
				
			}) 
	}

   /**********************************判断登陆状态*********************************/      

   function cheak_login(){
	
   	 if($("#user font[name='user_val']").html() == null || $("#user font[name='user_val']").html() == ""){
   		   	
   				
   			$("#top a[name='check_in']").html('登陆');
   			$("#top a[name='check_in']").attr("href","${pageContext.request.contextPath}/login.jsp")
   			$("#top b[name='check_out']").html(''); 
   	}
   
   	}
   
   
/*    function getreplylist(){
	   
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/replylist',
			success:function(resultData){
				$("#rlist").html(resultData)
			}
		})

		 }
    */
   window.onload = function(){
 		//每秒自动调用一次
  	setCurtime();
 		setInterval(function(){setCurtime()},1000);
 
		cheak_login();
		}
</script>
</body>
</html>