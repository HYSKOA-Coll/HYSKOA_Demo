<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>

<!-- ------------------js引用 ------------------------------  -->
 		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- --------------------------------css样式--------------------------------------- -->
		<style type="text/css">
			div{
				margin-left: 40%;
				margin-top: 5%;
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
			#regBtn{
				margin-left: 15%;
			}
		</style>

</head>
<body>
	<h3 class="text-center">创建注册</h3>
		<div>
      	  <form id="reg" class="navbar-form navbar-left" method="post">
       			<b>账户&nbsp;</b>
            <input type="text" name="user" class="form-control" placeholder="UserName"><i></i>
            <br/><br/>
            <b>密码&nbsp;</b>
            <input type="password" name="pwd" class="form-control" placeholder="PassWord"><i></i>
            <br/><br/>	
            <input type="button" id="regBtn" value="注册"  class="btn btn-default"></input>
       	 </form>
        	<a href="login.jsp">
        	<input type="button" value="返回"  class="btn btn-default"></input>
        	</a>
    </div>
    
    	<script type="text/javascript">
    	/************************************脚本部分********************************************/
      	
    	//注册按钮
		$("#regBtn").click(function(){
			
			//拿到输入框中的值  选中输入框  val():设置或返回表单字段的值  trim():去空格
		  var user = $("#reg input[name='user']").val().trim();
			var pwd = $("#reg input[name='pwd']").val().trim();
		/* 	alert(user+"------reg------"+pwd)  */
			if(user==null || user==""){
				$("#reg input[name='user']").next().html('必填');
				return;
			}
			
			if(pwd==null || pwd==""){
				$("#reg input[name='pwd']").next().html('必填');
				return;
			}
			
		//获取表单中所有的值，做ajax请求-----异步请求  			
		  $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/reg',
			data:$("#reg").serialize(),
			success:function(resultData){
				//如果请求成功,会执行该函数内容，resultData是响应数据
				alert(resultData); 
				
				//如果返回1 就跳转到login页面 如果返回 0 就提示用户名存在
				 if(resultData == "success"){
					alert("注册成功");
					window.location.href = "${pageContext.request.contextPath}/login.jsp";
				}else if(resultData == "repeat"){
					$("#reg input[name='user']").next().html('已存在');
					return;
				} 
				 
			}
		
		}); 
			
	});
    
		/*********************************聚集功能*************************************/
			
			//监听添加对话框中输入框的聚焦事件
			$("input[name='user']").focus(function(){
				//alert("--focus--")
			$("#reg input[name='user']").next().html('');
			});
		
			$("input[name='pwd']").focus(function(){
			$("#reg input[name='pwd']").next().html('')
			})    	
    	</script>
</body>
</html>