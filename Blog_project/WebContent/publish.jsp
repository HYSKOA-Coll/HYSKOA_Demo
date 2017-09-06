<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>论坛主页</title>
		
		<!-- ------------------js引用 ------------------------------  -->
 		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<!--  ----------------------css部分--------------------------  -->
		<style type="text/css">
			#top{
				font-size: 16px;
				margin-left: 65%;
				margin-top: 6px;
			}
			#user{
				font-size: 22px;
				margin-left: 2%;
				margin-bottom: 25px;
				color: #1C1C1C;
			}
			.card{
				margin-top: 45px;
				margin-left:15%;
				width: 1000px;
				height: 350px;
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
				<li><a href="main.jsp">首页</a></li>
				<li class="active"><a href="publish.jsp">发帖</a></li>
				<li><a href="#">关于我的</a></li>
			</ul>
		</div>
   	 
   	 <div class="card">
       	<div class="panel panel-default">
       	
    			<div class="panel-heading">
       		 <h3 class="panel-title">
           					发表文章
       		 </h3>
   			 </div>
   			 
   			 <div class="panel-body">
     			  <form id="pub" method="post">
     			  	<h3>标题</h3>
     			  	<textarea name="title" class="form-control" rows="1"></textarea>
     		 			<h4>内容</h4>
							<textarea name="content" class="form-control" rows="7"></textarea>
     			  	<input type="button" id="pubBtn" value="发表"  class="btn btn-default"></input>
     			  </form>
   			</div>
			</div>
    </div> 
    
		<script type="text/javascript">
    	/****************************js部分*************************************/
    	
    	/*---------------------------------------- 服务器时间 ------------------------------------------- */
    	//获取当前时间
    	   function setCurtime() {
    	          var date = new Date();
    	          var dateStr = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()
    	          $("#curr_time").html(dateStr)
    	      }
    	
          /* ----------------------------------------------发帖验证提交--------------------------------------------------*/
    	
    	//发帖按钮
		 $("#pubBtn").click(function(){
			var title = $("#pub textarea[name='title']").val().trim();
			var content = $("#pub textarea[name='content']").val().trim();
			alert(title+"------reg------"+content) 
			
			if(title==null || title==""){
				$("#pub textarea[name='title']").html('标题不能为空！！！');
				return;
			}
			
			if(content==null || content==""){
				$("#pub textarea[name='content']").html('内容不能为空！！！');
				return;
			}
			
			 $.ajax({
					type:'POST',
					url:'${pageContext.request.contextPath}/publish',
					data:$("#pub").serialize(),
					success:function(resultData){
					//如果请求成功,会执行该函数内容，resultData是响应数据
						alert(resultData); 
				
						//如果返回1 就跳转到login页面 如果返回 0 就提示用户名存在
						 if(resultData == "success"){
							alert("发表成功");
							window.location.href = "${pageContext.request.contextPath}/main.jsp";
						}else if(resultData == "repeat"){
							alter("发表失败")
							return;
						}
					 	else if(resultData == "fail"){
							window.location.href = "${pageContext.request.contextPath}/login.jsp";
							
						} 
					}
				})
			 })
		 
		/*********************************聚集功能*************************************/
			
			//监听添加对话框中输入框的聚焦事件
			$("textarea[name='title']").focus(function(){
				//alert("--focus--")
			$("#pub textarea[name='title']").html('');
			});
		
			$("textarea[name='content']").focus(function(){
			$("#pub textarea[name='content']").html('')
			})    	
			
		 /**********************************判断登陆状态*********************************/  
			function cheak_login(){
			/* alert("----------") */
	
    	 if($("#user font[name='user_val']").html() == null || $("#user font[name='user_val']").html() == ""){
    		/* 	alert("-----cheak_login------空-------") */
    		   	
    				
    			$("#top a[name='check_in']").html('登陆');
    			$("#top a[name='check_in']").attr("href","${pageContext.request.contextPath}/login.jsp")
    			$("#top b[name='check_out']").html(''); 
    	}
    
    	}
			
			window.onload = function(){
          
          cheak_login();
	    		//每秒调用一次
  	   	setCurtime();
        setInterval(function(){setCurtime()},1000);  
  			}
    </script>
</body>
</html>