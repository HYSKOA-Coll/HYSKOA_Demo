<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin设置</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style type="text/css">
.title{
	margin-top: 30px;
}	
.user{
	margin-left: 50px;
}
b{
	color: red;
}
form{
	margin-top: 30px;
}
.input2{
	margin-left: 27px;
}
.input1{
	margin-left: 50px;
	margin-bottom: 20px;
}
.btn{
	margin-left:96px;
	margin-top:15px;
	height: 40px;
	width: 150px;
	border-radius:6px;
	color:white;
	background-color: #1954be;

}
.err{
	color: red;
}
.btn:hover {
	color: white;
	font-size: 15px;
}
.btn:active{
	color: white;
}
</style>
</head>
<body>
	<div class="title">
		<ol class="breadcrumb">
	    <li><a href="#">系统管理</a></li>
	    <li><a href="#">个人设置</a></li>
	    <li class="active">修改密码</li>
		</ol>
	</div>
	<div class="user">
		<p>当前用户角色： <font>admin</font></p>
		
		 <form action="">
		 	原密码<b>*</b><input class="input1" id="pwd" type="password"/><i class="err"></i><br/>
		 	新密码<b>  </b><input class="input1" id="newpwd" type="password"/><i class="err"></i><br/>
		 	确认新密码<input class="input2" id="repeatpwd" type="password" /><i class="err"></i>
		 </form>
		 	<input type="button" class="btn" value="更新我的信息"  onclick="btn()"/>
	</div>
<script type="text/javascript">
	function btn(){

		var pwd = $("#pwd").val()
		var newpwd = $("#newpwd").val()
		var repeatpwd = $("#repeatpwd").val()
		alert(pwd+"----"+newpwd+"------"+repeatpwd)
		
		if(pwd==null || pwd==""){
			$("#pwd").next().html("请输入原密码");
			return;
		};
		if(newpwd==null || newpwd==""){
			$("#newpwd").next().html("请输入新密码");
			return;
		};
		if(repeatpwd==null || repeatpwd==""){
			$("#repeatpwd").next().html("请确认新密码");
			return;
		};
		if(newpwd!=repeatpwd){
			$("#repeatpwd").next().html("输入的密码不一致");
			return;
		};
		
		 $.ajax({
				type:'POST',
				url:'${pageContext.request.contextPath}/edituser.action',
				data:"admin_pwd="+pwd+"&newpwd="+newpwd,
				success:function(resultData){
					//如果请求成功,会执行该函数内容，resultData是响应数据
		 			if(resultData == "success"){
				 			   alert("数据操作完成")
					}else if(resultData == "repeat"){
								 alert("输入的原始密码错误！");
					}else if(resultData == "fail"){
	                   alert("数据操作失败！");
					}
				}
			
			});
	}
	
	//监听添加对话框中输入框的聚焦事件
	$("#pwd").focus(function(){
	$(this).next().html('');
	});
	$("#newpwd").focus(function(){
	$(this).next().html('');
	});
	$("#repeatpwd").focus(function(){
	$(this).next().html('');
	});
</script>
</body>
</html>