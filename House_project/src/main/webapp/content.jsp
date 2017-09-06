<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>内容详情</title>

<!-- ------------------js引用 ------------------------------  -->
 		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- ------------------css样式------------------------ -->
<style>
	.user_row{
		margin-top:20px;
		margin-left: 82%;
	}
	span{
		margin-right: 6px;
	}
#user{
				font-size: 26px;
				margin-left:8%;
				margin-bottom: 20px;
				margin-top:-40px;
				color: #1C1C1C;
			}

div.tip{
			width:450px;
			border:solid 1px DimGrey;
			box-shadow:1px 1px 15px Grey;
			position:absolute;
			left:35%;
			top:110px;
			background:white;
			display:none;		
		}
		#register_form{
			margin-top:40px;
			margin-left: 75px;
		}
		#login_form{
			margin-top:40px;
			margin-left: 75px;
		}
		.text-center{
			color:#FF552E;
		}
		
		#forget{
			margin-left: 160px;
		}

		#loginBtn{
			margin-top:33px;
			margin-bottom:35px;
			margin-left: 70px;
			margin-right: 50px;
		}
		#registerBtn{
			margin-top:33px;
			margin-bottom:35px;
			margin-left: 70px;
			margin-right: 50px;
		}
			b{
				font-size:16px;
			}
			a input{
				margin-left: -15.5%;
				margin-top: 14.25%;
			}
			
			i{
				color: red;
			}
			
			#mbx{
				width: 1170px;
				margin-left: 86px;
			}
			#content_yihang{
				margin-left: 6.5%;
			}
			#content_yihang_biaoti{
				font-size: 20px;
				margin-left: 30px;
			}
			#content_erhang_tupian{
				margin-left: 9.5%;
				margin-top: 2.5%;
			}
			#content_erhang_wenzi1{
				color:#FF7F00;
				margin-top: -22%;
				margin-left: 46%;
			}
			#content_erhang_wenzi1_span{
				font-size: 38px;
				font-weight: 900;
				
			}
			#content_erhang_wenzi2{
				margin-top: 1.5%;
				margin-left: 47%;
			}
			#shanhang{
				margin-left: 10%;
				margin-top: 10%;
			}
			#shanhang_font{
				font-size: 18px;
				color: #FF7F00;
			}
			#shanhang_hr{
				height:3px;
				border:none;
				border-top:2px double #FF552E;
				width: 1050px;
				margin-left: 0px;
				margin-top: -2px;
			}

 </style>
</head>
<body>
	<div class="user_row">
			<span class="glyphicon glyphicon-user"></span>
			
			<a href="#"><b id="check_login" name="check_login" onclick="check_login()">${name}</b></a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"><b id="check_publish" name="check_publish" onclick="check_register()"></b></a>
			<a href="#"><b id="check_out" name="check_out" onclick="check_out()">退出</b></a>&nbsp;&nbsp;&nbsp;&nbsp;
  </div><br/><br/>
 		
	<div id="user">
			<font name="user_val">中雅房屋</font>
			
	</div> 
	
<div id="mbx">
	<ol class="breadcrumb">
	    <li><a href="#" >中雅房屋</a></li>
	    <li><a href="#">房源信息</a></li>
	    <li class="active">详情页</li>
	</ol>
</div>
	
<div id="content_yihang">
	<a href="home.jsp"><button class="btn btn-default" style="color:red;">返回</button></a>
	<b id="content_yihang_biaoti">${publish.title}</b>
</div>

<div id="content_erhang">
	<img id="content_erhang_tupian"alt="" src="${pageContext.request.contextPath}/f11.png">
	<div id="content_erhang_wenzi">
		<div id="content_erhang_wenzi1">
		<span id="content_erhang_wenzi1_span">${publish.rent}</span>元/月
		</div>
		<div id="content_erhang_wenzi2">
			<span>房屋类型 ：&nbsp;&nbsp;&nbsp;</span>${publish.hroom}室${publish.hhall }厅${publish.hwei }卫&nbsp;&nbsp;&nbsp;${publish.hrice }平&nbsp;&nbsp;精装修<br/><br/>
			<span>朝向楼层 ：&nbsp;&nbsp;&nbsp;</span>${publish.position }&nbsp;&nbsp;&nbsp;${publish.fthis }层/共${publish.fall }层<br/><br/>
			<span>所在小区 ：&nbsp;&nbsp;&nbsp;</span>${publish.aname } <br/><br/>
		</div>
	</div>
</div>

<div id="shanhang">
		<font id="shanhang_font">房源描述</font>
		<hr id="shanhang_hr" />
		${publish.hsay }
</div>


<!-- -----------------------------------登陆对话框  --------------------------------------------   -->
  		
  		<div class="tip" id="tip_login"> 		
  			<h3 class="text-center">登陆我的账户</h3>
  				<hr/>
				<div id="login_form">
      	  <form class="navbar-form navbar-left" method="post" id="login">
      		  <b style="font-size: 16px;" class="glyphicon glyphicon-user"></b>&nbsp;&nbsp;
       			<b>账户&nbsp;</b>
            <input type="text" name="name" class="form-control" placeholder="UserName"/><i></i>
            <br/><br/>
            <b style="font-size: 16px;" class="glyphicon glyphicon-eye-close"></b>&nbsp;&nbsp;
            <b>密码&nbsp;</b>
            <input type="password" name="password" class="form-control" placeholder="PassWord"/><i></i>
            <br/><br/><br/>
            <a href="#" id="forget" onclick="register()">没有账户？去注册</a><br/>
            
       	 </form>
       	 <input type="button" id="loginBtn" onclick="loginBtn()" value="登陆"  class="btn btn-default"></input>
       	 <input type="button" id="cancel_login" value="取消" class="btn btn-default"></input>
    	</div>
  	</div>

<!-- -----------------------------------注册对话框  ---------------------------------------------   -->
  		
  		<div class="tip" id="tip_register"> 		
  			<h3 class="text-center">注册我的账户</h3>
  				<hr/>
				<div id="register_form">
      	  <form class="navbar-form navbar-left" method="post" id="register">
      		  <b style="font-size: 16px;" class="glyphicon glyphicon-user"></b>&nbsp;&nbsp;
       			<b>账户&nbsp;</b>
            <input type="text" name="name" class="form-control" placeholder="UserName"><i></i>
            <br/><br/>
            <b style="font-size: 16px;" class="glyphicon glyphicon-eye-close"></b>&nbsp;&nbsp;
            <b>密码&nbsp;</b>
            <input type="password" name="password" class="form-control" placeholder="PassWord"><i></i>
            <br/><br/><br/>
            <a href="#" onclick="forget()" id="forget">已有账户！去登陆？</a><br/>
       	 </form>
       	 		<input type="button" id="registerBtn" onclick="registerBtn()" value="注册"  class="btn btn-default"></input>
       	 		<input type="button" id="cancel_register" value="取消" class="btn btn-default"></input>
    	</div>
  	
<script type="text/javascript">
  
  /* ************************登陆功能************************************* */
  function check_login(){
	  
	  
		//点击登陆按钮
		$("#tip_register").css("display","none");
  	$("#tip_login").css("display","block");
  		
  	}

  //  //监听去注册链接
  	function register(){
		 alert("去注册")
		 
 			$("#tip_login").css("display","none"); 
		  $("#tip_register").css("display","block");
			
	 }
  
//监听添加对话框中的取消按钮
	$("#cancel_login").click(function(){
		$("#tip_login").css("display","none");
	});
	
	//登陆按钮
	function loginBtn(){
		
		//拿到输入框中的值  选中输入框  val():设置或返回表单字段的值  trim():去空格
	  var name = $("#login input[name='name']").val().trim();
		var password = $("#login input[name='password']").val().trim();
		 alert(name+"------login------"+password)  
		
		//提交时判断输入框是否为空 ， 为空则提示必填
		if(name==null || name==""){
			$("#login input[name='name']").next().html('必填');
			return;
		}
		
		if(password==null || password==""){
			$("#login input[name='password']").next().html('必填');
			return; 
		} 
		
		//获取表单中所有的值，做ajax请求-----异步请求  			
			$.ajax({
				type:'POST',
				url:'${pageContext.request.contextPath}/login.action',
				data:$("#login").serialize(),
				success:function(resultData){
					//如果请求成功,会执行该函数内容，resultData是响应数据
					if(resultData == "success"){
						alert("登陆成功!!")
						window.location.href = "${pageContext.request.contextPath}/home.jsp";
						/* $("#tip_login").css("display","none"); */
					}else if(resultData == "repeat"){
						alert("登录失败！！")
					}
					
				}
			
			});
	}
	
	 /* ************************注册功能************************************* */
	function check_register(){
		  
		//点击登陆按钮
  	$("#tip_register").css("display","block");
  		
  	}
  
	  //监听去登陆链接
	 function forget(){
		 alert("去登陆")
 
		  $("#tip_register").css("display","none");
			$("#tip_login").css("display","block"); 
	 }
	 check_out

//监听添加对话框中的取消按钮
	$("#cancel_register").click(function(){
		$("#tip_register").css("display","none");
	});
	
	//注册按钮
	function registerBtn(){
		
		alert("aaa")
		//拿到输入框中的值  选中输入框  val():设置或返回表单字段的值  trim():去空格
	   var name = $("#register input[name='name']").val().trim();
		var password = $("#register input[name='password']").val().trim();
		 alert(name+"------register------"+password)  
		
		//提交时判断输入框是否为空 ， 为空则提示必填
		if(name==null || name==""){
			$("#register input[name='name']").next().html('必填');
			return;
		}
		
		if(password==null || password==""){
			$("#register input[name='password']").next().html('必填');
			return; 
		}  
		
		//获取表单中所有的值，做ajax请求-----异步请求  			
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/register.action',
			data:$("#register").serialize(),
			success:function(resultData){
				//如果请求成功,会执行该函数内容，resultData是响应数据
				if(resultData == "success"){
					alert("注册成功！！")
					window.location.href = "${pageContext.request.contextPath}/home.jsp"; 
					
				}else if(resultData == "repeat"){
					alert("注册失败！！")
					$("#register input[name='name']").next().html('已存在！');
				}
				
			}
		
		});
	}
	
	/*********************************退出功能************************************/
	  function check_out(){
	    	
	    	alert("logout") 
	    	var flag = confirm("新确定要退出吗？")
	    	
	      if(flag){
	    		
	    	 //获取表单中所有的值，做ajax请求-----异步请求  			
				$.ajax({
					type:'POST',
					url:'${pageContext.request.contextPath}/logout.action',
					success:function(resultData){
						//如果请求成功,会执行该函数内容，resultData是响应数据
						if(resultData == "success"){
							alert("退出成功！！")
							window.location.href = "${pageContext.request.contextPath}/content.jsp";
						}
					}
				
				}); 
	    		
	    	   }  
	    }
	   /**********************************判断登陆状态*********************************/      

    function cheak_login_now(){
			 alert("----------") 
	
     	 if($("#check_login").html() == null || $("#check_login").html() == ""){
    		   	
    			$("#check_login").html('登陆');
    			$("#check_out").html(""); 
    			$("#check_publish").html("注册"); 
    		}
    
    	}
	/*********************************聚集功能*************************************/
	
	//监听添加对话框中输入框的聚焦事件
	$("input[name='name']").focus(function(){
		//alert("--focus--")
	$(this).next().html('');
	});

	$("input[name='password']").focus(function(){
	$(this).next().html('')
	})
	
		window.onload = function(){
			cheak_login_now();
  		}
  </script>	
  	
</body>
</html>