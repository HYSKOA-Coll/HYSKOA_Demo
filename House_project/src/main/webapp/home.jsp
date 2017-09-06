<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>房屋首页</title>

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
	#banner{
		width: 1100px;
		margin-left: 6%;
		margin-top: 10px;
		border-bottom: 2px solid #FF552E;
    border-bottom-width: 2px;
    border-bottom-style: solid;
    border-bottom-color: rgb(255, 85, 46);
		height:50px;
	}
	
	#info{
		margin-left: 8%;
		margin-top: 20px;
	}
	table{
		width: 1000px;
		margin-left: 8%;
		margin-top: 20px;
	}
	
	td{
		width: 50px;
		height:40px;
		text-align: center;
	}	
	
	.u1{
		color:orange;
		
	}
	.u2{
		color:orange;
		
	}
	
	td a:hover{
		color:orange;
	}
	td a{
		color:black;
	}

	#list_font{
		margin-left: 1%; 
		margin-top: -40px;
		color:#FF4500;
		font-size: 20px;
		font-variant: 900;
	}
	
	#panel{
		margin-top: 18px;	
		margin-left: 100px;
	}
	
	#list_btn{
		margin-left: 70%;
		margin-top: -17px;
	}
	
	#list_list{
		width: 1100px;
		margin-left: 100px;
	}

  li{
  	 display:inline;
    } 
   ul#nav li a{
   		display:inline-block; 
   		padding:0 18px;
   		height:40px; 
   		line-height:40px;
   		font-size:16px;
   		color:black;
   	}   
   ul#nav li	a:hover{
		text-decoration: none;
	}
  #home_style{
   background:#FF552E;
   color:white;
   margin-left: -50px;
   margin-top:10px; 
    }

div.tip{
			width:450px;
			border:solid 1px #363636;
			box-shadow:1px 1px 13px #756b6b;
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
		.deng{
			height:2px;

			border:none;

			border-top:2px double red;
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
			
			img{
				width: 160px;
				height: 130px;
			}
			#xin1{
				margin-top: -4%;
			}
			#xin2{
				margin-left: 180px;
				margin-top: 10px;
			}
			#xin2_b{
				font-size: 21px;
			}
			#xin3{
				margin-left: 80%;
				margin-top: -110px;
				font-size: 16px;
				color: #FF7F00;
			}
			#xin3_span{
				font-size: 30px;
			}
			#a_house_one{
				text-decoration: none;
				color:black;
			}
			.navdown a{color:#FF7F00;}
		
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
		
	<div id="banner">
		    <ul id="nav">
				  <li><a id="home_style" href="#" style="color:white">租房首页</a></li>
				  <li><a id="publish_style" href="#">发布房源</a></li>
				  <li><a id="publish_style" href="#">发布房源</a></li>
				  <li><a id="publish_style" href="#">发布房源</a></li>
				</ul>
	</div>
			<table>
				<tr id="info1">
					<td>租金：</td>
					<td class="navdown"><a href="javascript:;" class="u1" onclick="getlist(0,0)" id="r1">不限</a></td>
					 <td><a href="javascript:;" onclick="getrent(0,500)" id="r2" >500以下</a></td>
					<td><a href="javascript:;" onclick="getrent(500,1000)" id="r3">500-1000元</a></td>
					<td><a href="javascript:;" onclick="getrent(1000,1500)" id="r4">1000-1500元</a></td>
					<td><a href="javascript:;" onclick="getrent(1500,2000)" id="r5">1500-2000元</a></td>
					<td><a href="javascript:;" onclick="getrent(2000,3000)" id="r6">2000-3000元</a></td> 
					<td><a href="javascript:;" onclick="getrent(3000,4500)" id="r7">3000-4500元</a></td>
					<td><a href="javascript:;" onclick="getrent(4500,0)" id="r8">4500以上</a></td> 
				</tr>
				<tr id="info2">
					<td>厅室：</td>
				 	<td><a class="u2" href="javascript:;" onclick="getroom()" id="ro1">不限</a></td>
					<td><a href="javascript:;" onclick="getroom(1)" id="ro2">一室</a></td>
					<td><a href="javascript:;" onclick="getroom(2)" id="ro3">二室</a></td>
					<td><a href="javascript:;" onclick="getroom(3)" id="ro4">三室</a></td>
					<td><a href="javascript:;" onclick="getroom(4)" id="ro5">四室</a></td>
					<td><a href="javascript:;" onclick="getroom(5)" id="ro6">四室以上</a></td> 
				</tr>
			</table>
			
			
			
  		<div id="panel">
  				<font id="list_font">出租信息列表</font>
  				<a href="publish.jsp"><button type="button" class="btn btn-default" id="list_btn" style="color:red;">发布信息</button></a>
  					</div> 
				<div id="list_list">
		
 				</div> 
 			
  
  
<!-- -----------------------------------登陆对话框  --------------------------------------------   -->
  		
  		<div class="tip" id="tip_login"> 		
  			<h3 class="text-center">登陆我的账户</h3>
  				<hr class="deng"/>
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
  				<hr class="deng"/>
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
		 /* alert(name+"------login------"+password)   */
		
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
  
	  //监听去登陆链接不限
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
				//如果请求成功,会执行该函数内容，r$("#list_list").html(resultData)esultData是响应数据
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
							window.location.href = "${pageContext.request.contextPath}/home.jsp";
						}
					}
				
				}); 
	    		
	    	   }  
	    }
	   /**********************************判断登陆状态*********************************/      

    function cheak_login_now(){

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
	
	/********************************查询房源列表************************************/
	
	function getroom(room){
		
		rentmin = $("#rentmin_input").val()
		rentmax = $("#rentmax_input").val()
		
		getlist(room,rentmin,rentmax)
	}

	function getrent(rentmin,rentmax){
		room = $("#hroom").val()
		
		getlist(room,rentmin,rentmax)
	}
	
function getlist(room,rentmin,rentmax,pageNow){
		$.ajax({
			type:'post', 
			data:{room:room,rentmin:rentmin,rentmax:rentmax,pageNow:pageNow},
			url:'${pageContext.request.contextPath}/list.action',
			success:function(resultData){
				 /* alert(resultData)  */
				$("#list_list").html(resultData)
			}
		})
	}

$(function(){
	  $("#info1 td").click(function(){
	    $("#info1 td").eq($(this).index()).addClass("navdown").siblings().removeClass("navdown");
	    	$(".u1").css("color","black")
	  })
})

$(function(){
	  $("#info2 td").click(function(){
	    $("#info2 td").eq($(this).index()).addClass("navdown").siblings().removeClass("navdown");
	    $(".u2").css("color","black")
	  })
})
		window.onload = function(){
			cheak_login_now();
			getlist();
  		}
 function firstPage(){
	rentmin = $("#rentmin_input").val()
	rentmax = $("#rentmax_input").val()
	room = $("#hroom").val()
	pageNow = 1
	getlist(room,rentmin,rentmax,pageNow)
}

function beforePage(pageNow){
	rentmin = $("#rentmin_input").val()
	rentmax = $("#rentmax_input").val()
	room = $("#hroom").val()
	getlist(room,rentmin,rentmax,pageNow)
}

function afterPage(pageNow){
	rentmin = $("#rentmin_input").val()
	rentmax = $("#rentmax_input").val()
	room = $("#hroom").val()
	getlist(room,rentmin,rentmax,pageNow)
}
function lastPage(pageNow){
	rentmin = $("#rentmin_input").val()
	rentmax = $("#rentmax_input").val()
	room = $("#hroom").val()
	getlist(room,rentmin,rentmax,pageNow)
}  
  </script>	

</body>
</html>