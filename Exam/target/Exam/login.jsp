<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>欢迎登录</title>
<link href="css/login.css" rel="stylesheet" type="text/css" />
</head>
<style>
.body-box{ 
		position:fixed; top:0; left:0; width:100%; height:100%;
    background:url("img/login_bg_img.png") no-repeat top center;
    background-size:cover;
}
</style>
<body>

<div class="body-box">
<div class="login-box">
        <h3><img src="img/start.png" class="pull-left">&nbsp;&nbsp;外语听力教学系统</h3>
        <div class="login-info">
                <div class="info">
                        <span><img src="img/username_0.png" ></span>
                        <div>
                                <input type="text" id="username" placeholder="请输入用户名" >
                        </div>
                </div>
                <div class="info">
                        <span><img src="img/pwd_0.png" ></span>
                        <div>
                                <input type="password" id="pwd" placeholder="请输入密码">
                        </div>
                </div>
                <p class="clearfix">
                        <span class="tip"></span>
                        <span class="pull-right" style="display:none;"><label><input type="checkbox" name="remember" > 是否记住密码</label></span>
                </p>
                <div class="login-btn">
                        <input type="button" value="登 录"  onclick="login()" id="login_sys" >
                </div>
        </div>
</div>
</div>
<script type="text/javascript">
	function login(){
		
      var remember_pwd;
      var admin_name = jQuery("#username").val();
      var admin_pwd = jQuery("#pwd").val();
      
      alert("username"+username);
      alert("password"+password);
		
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/adminlogin.action',
			data:"admin_name="+admin_name+"&admin_pwd="+admin_pwd,
			success:function(resultData){
/* 				//如果请求成功,会执行该函数内容，resultData是响应数据
	 			if(resultData == "success"){
					alert("登陆成功!!")
					window.location.href = "${pageContext.request.contextPath}/admin/home.jsp";
				}else if(resultData == "repeat"){
					alert("登录失败！！")
				}  */
			}
		
		});
		
	}
</script>
</body>
</html>