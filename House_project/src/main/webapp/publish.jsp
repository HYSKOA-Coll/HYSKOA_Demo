<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布房源</title>
<!-- ------------------js引用 ------------------------------  -->
 		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
<!-- ----------------kindeditor HTML编辑器引用----------------------- -->		
	<link rel="stylesheet" href="themes/default/default.css" />
	<link rel="stylesheet" href="plugins/code/prettify.css" /> 、
	<script charset="utf-8" src="kindeditor-all.js"></script>
	<script charset="utf-8" src="lang/zh-CN.js"></script>
	<script charset="utf-8" src="plugins/code/prettify.js"></script>

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
			#yihang{
				margin-left: 6.5%;
			}
			#erhang{
				margin-left: 11%;
				margin-top: -2.1%;
			}
			#erhang_font{
				font-size: 18px;
				color: orange;
			}
			#erhang_hr{
				height:3px;
				border:none;
				border-top:2px double #FF552E;
				width: 1050px;
				margin-left: 0px;
				margin-top: -2px;
			}
			#shanshang{
				margin-left: 150px;
				margin-top: 25px;
			}
			.shanshang_input{
				margin-left: 35px;
			}
			#shanshang_select{
				margin-left: 70px;
			}
			select{
				width: 110px;
				margin-left: 20px;
			}
			#shanshang_textarea{
				margin-left: 89px;
				margin-top: -17px;
			}
			.image_input{
				margin-left: 86px;
				
			}
			#pubBtn{
				border-radius: 5px; 
				width: 350px;
				height: 45px;
				background-color: orange;
				color: white;
				border:none;
				margin-left: 85px;
				margin-top: 15px;
				margin-bottom: 20px;	
				font-size: 16px;	
				font-weight: bold;
				letter-spacing:20px;
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
	    <li class="active">发布房源</li>
	</ol>
</div>
	
<div id="yihang">
	<a href="home.jsp"><button class="btn btn-default" style="color:red;">返回</button></a>
</div>

<div id="erhang">
		<font id="erhang_font">信息填写</font>
		<hr id="erhang_hr" />
</div>

<div id="shanshang">
 	<form action="" id="pub" enctype="multipart/form-data">
		<b>基础信息</b><br/><br/>
		小区名称<input name="aname" class="shanshang_input" size="45"/><i></i><br/><br/><br/>
		房屋类型<input type="number" name="hroom" class="shanshang_input" style="width:90px;" />室<i></i>
					 &nbsp;&nbsp;&nbsp;<input type="number" name="hhall" style="width:90px;"/>厅<i></i>
					 &nbsp;&nbsp;&nbsp;<input type="number" name="hwei" style="width:90px;"/>卫<i></i>
					 &nbsp;&nbsp;&nbsp;共<input type="number" name="hrice" style="width:90px;"/>m²<i></i><br/><br/>
					 <div id="shanshang_select">
						 <select name="position"><i></i>
						 		<option>南北</option>
						 		<option>东西</option>
						 		<option>东</option>
						 		<option>南</option>
						 		<option>西</option>
						 		<option>北</option>
						 </select>
						  <select name="divice" style="width:110px;"><i></i>
						 		<option>简单装修</option>
						 		<option>毛坯</option>
						 		<option>精装修</option>
						 		<option>中等装修</option>
						 		<option>豪华装修</option>
						 </select>
						  <select name="genre" style="width:110px;"><i></i>
						 		<option>普通住宅</option>
						 		<option>商住两用</option>
						 		<option>平房</option>
						 		<option>别墅</option>
						 		<option>公寓</option>
						 </select>
					 </div><br/><br/>
					 
		 楼层&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 		<input type="number" name="fthis" class="shanshang_input" style="width:110px;" placeholder="第"/>层<i></i>
				&nbsp;&nbsp;<input type="number" name="fall" style="width:110px;" placeholder="共" />层<i></i><br/><br/><br/>		
				
		租金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="rent" type="number" class="shanshang_input" style="width:140px;"/>元/月<i></i><br/><br/><br/>		 
					
		<b>详细信息</b><br/><br/>		
		
		标题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="title" class="shanshang_input" size="45"/><i></i><br/><br/><br/>	
					
					<!-- <textarea class="shanshang_input" id="editor_id" name="content" style="width:850px;height:250px;"></textarea> -->
					
		房源描述
				<div id="shanshang_textarea" >
					<textarea name="hsay" id="editor_id" style="width:550px;height:150px;visibility:hidden;"></textarea>
				</div><br/>
				
		上传主图	<input type="file" name="upload" class="image_input" value="upload"/><br/><br/>
  	 
				<input id="pubBtn" type="button" value="发布"/></input>
	</form>

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
		        //简单模式HTML编辑器
			 var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="hsay"]', {
					resizeType : 1,
					uploadJson : 'jsp/upload_json.jsp',
					fileManagerJson : 'jsp/file_manager_json.jsp',
					allowPreviewEmoticons : false,
					allowImageUpload : true,
					allowFileManager : true,
					items : [
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', '|', 'image']
				});
			});
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
							window.location.href = "${pageContext.request.contextPath}/publish.jsp";
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
						window.location.href = "${pageContext.request.contextPath}/publish.jsp"; 
						
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
								window.location.href = "${pageContext.request.contextPath}/publish.jsp";
							}
						}
					
					}); 
		    		
		    	   }  
		    }
		   /**********************************判断登陆状态*********************************/      

	    function cheak_login_now(){
		
	     	 if($("#check_login").html() == null || $("#check_login").html() == ""){
	    		   	
	     		 	alert("您还没有登陆，不能发布信息，请登陆")
	     		 	$("#tip_login").css("display","block");
	    			$("#check_login").html('登陆');
	    			$("#check_out").html(""); 
	    			$("#check_publish").html("注册"); 
	    		}
	    
	    	}
		   
/* ----------------------------------------------发帖验证提交--------------------------------------------------*/

    	
    	//发帖按钮
		 $("#pubBtn").click(function(){
			 
			 /*************  kindEditor 取值 ****************/
				 html = editor.html();
			// 同步数据后可以直接取得textarea的value
				editor.sync();
		/* 	html = document.getElementById('editor_id').value; // 原生API */
				html = $('#editor_id').val(); // jQuery
						 
			var aname = $("#pub input[name='aname']").val().trim();
			var name = $("#check_login").html()
			var hroom = $("#pub input[name='hroom']").val().trim();
			var hhall = $("#pub input[name='hhall']").val().trim();
			var hwei = $("#pub input[name='hwei']").val().trim();
			var hrice = $("#pub input[name='hrice']").val().trim();
			var position = $("#pub select[name='position']").val().trim();
			var divice = $("#pub select[name='divice']").val().trim();
			var genre = $("#pub select[name='genre']").val().trim();
			var fthis = $("#pub input[name='fthis']").val().trim();
			var fall = $("#pub input[name='fall']").val().trim();
			var rent = $("#pub input[name='rent']").val().trim();
			var title = $("#pub input[name='title']").val().trim();

			alert(name + "---" + aname+"---"+hroom+"--"+hhall +"--"+hwei+"--"+hrice+"--"+position+"--"+divice+"--"+genre+"--"+fthis+"--"+fall+"--"+html) 
			
			if(name==null || name==""){
				alert("您还没有登陆！")
				$("#tip_login").css("display","block");
				return;
			}
			 if(aname==null || aname==""){
				$("#pub input[name='aname']").next().html('必填！！！');
				alert("您还没有完成信息填写！请补全！")
				return;
			}
			
			if(hroom==null || hroom==""){
				alert("您还没有完成信息填写！请补全！")
				$("#pub input[name='hroom']").next().html('必填！！！');
				return;
			}
			if(hhall==null || hhall==""){
				alert("您还没有完成信息填写！请补全！")
				$("#pub input[name='hhall']").next().html('必填！！！');
				return;
			}
			if(hwei==null || hwei==""){
				alert("您还没有完成信息填写！请补全！")
				$("#pub input[name='hwei']").next().html('必填！！！');
				return;
			}
			if(hrice==null || hrice==""){
				alert("您还没有完成信息填写！请补全！")
				$("#pub input[name='hrice']").next().html('必填！！！');
				return;
			}
			if(position==null || position==""){
				alert("您还没有完成信息填写！请补全！")
				$("#pub input[name='position']").next().html('必填！！！');
				return;
			}
			if(divice==null || divice==""){
				alert("您还没有完成信息填写！请补全！")
				$("#pub input[name='divice']").next().html('必填！！！');
				return;
			}
			if(genre==null || genre==""){
				alert("您还没有完成信息填写！请补全！")
				$("#pub input[name='genre']").next().html('必填！！！');
				return;
			}
			if(fthis==null || fthis==""){
				alert("您还没有完成信息填写！请补全！")
				$("#pub input[name='fthis']").next().html('必填！！！');
				return;
			}
			if(fall==null || fall==""){
				alert("您还没有完成信息填写！请补全！")
				$("#pub input[name='fall']").next().html('必填！！！');
				return;
			}
			 
			 $.ajax({
					type:'POST',
					url:'${pageContext.request.contextPath}/publish.action',
					data:$("#pub").serialize()+"&name="+name,
					success:function(resultData){
					//如果请求成功,会执行该函数内容，resultData是响应数据
						 /* window.location.href = "${pageContext.request.contextPath}/home.jsp";   */
					}
				}) 
				
				var formData = new FormData($("#pub")[0]); 
				 alert("aaaaaaaa"+formData)
				 $.ajax({
						type:'POST',
						url:'${pageContext.request.contextPath}/upload.action',
						 data: formData,  
		 		     async: false,  
				     cache: false,  
				     contentType: false,  
				     processData: false,   
					   success:function(resultData){
							alert("aaa")
							/* window.location.href = "${pageContext.request.contextPath}/down.jsp";   */ 
						}
					})  
			 })
		
		/*********************************聚焦功能*************************************/
		
		//监听添加对话框中输入框的聚焦事件
		$("input[name='name']").focus(function(){
			//alert("--focus--")
		$(this).next().html('');
		});

		$("input[name='password']").focus(function(){
		$(this).next().html('')
		})
		
		$("input[name='aname']").focus(function(){
		$(this).next().html('')
		})
		
		$("input[name='hroom']").focus(function(){
		$(this).next().html('')
		})
		$("input[name='hhall']").focus(function(){
		$(this).next().html('')
		})
		$("input[name='hwei']").focus(function(){
		$(this).next().html('')
		})
		$("input[name='hrice']").focus(function(){
		$(this).next().html('')
		})
		$("input[name='position']").focus(function(){
		$(this).next().html('')
		})
		$("input[name='divice']").focus(function(){
		$(this).next().html('')
		})
		$("input[name='genre']").focus(function(){
		$(this).next().html('')
		})
			$("input[name='rent']").focus(function(){
		$(this).next().html('')
		})
		$("input[name='fthis']").focus(function(){
		$(this).next().html('')
		})
		$("input[name='fall']").focus(function(){
		$(this).next().html('')
		})
			window.onload = function(){
				cheak_login_now();
	  		}

		
</script>
</body>
</html>