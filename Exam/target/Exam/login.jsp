<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>欢迎登录</title>
<link href="css/teacher.css" rel="stylesheet" type="text/css" />
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
</head>
<style>
.body-box{ 
		position:fixed; top:0; left:0; width:100%; height:100%;
    background:url("img/login_bg_img.png") no-repeat top center;
    background-size:cover;
}
font{color: red;}
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
                        <span class="pull-right" style="display:none;">
                        <label><input type="checkbox" name="remember" > 是否记住密码</label></span>
                        <font id="tishi"></font>
                </p>
                <div class="login-btn">
                        <input type="button" value="登 录"  onclick="login()" id="login_sys" >
                </div>
        </div>
</div>
</div>
<script type="text/javascript">

//按下回车键登录(IE和ff都兼容)
document.onkeydown = function(e){
  var e = window.event   ?   window.event  :  e; 
  if(e.keyCode == 13){
   var btn=document.getElementById("login_sys");
   btn.onclick();
      }
} 

function keyLogin(){
if (event.keyCode==13)  //回车键的键值为13
       login(); //调用登录按钮的登录事件
}

//管理员、教师、学生登录验证
	function login(){
	
		 //拿到输入框中的值  选中输入框  val():设置或返回表单字段的值  trim():去空格
		var admin_name = $("#username").val().trim();
		var admin_pwd = $("#pwd").val().trim();
		
		//提交时判断输入框是否为空 ， 为空则提示必填
		if(admin_name==null || admin_name=="" || admin_pwd==null || admin_pwd==""){
			$("#tishi").html('请填写用户名或密码');
			return;
		}
      alert("username"+admin_name);
      alert("pwd"+admin_pwd);
		
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/adminlogin.action',
			data:"admin_name="+admin_name+"&admin_pwd="+admin_pwd,
			success:function(resultData){
				//如果请求成功,会执行该函数内容，resultData是响应数据
	 			if(resultData == "success"){
					alert("登陆成功!!")
					window.location.href = "${pageContext.request.contextPath}/admin/home.jsp";
				}else if(resultData == "repeat"){
					alert("登录失败！！")
				}  
			}
		
		});
		
	}

	/*********************************聚集功能*************************************/
	
	//监听添加对话框中输入框的聚焦事件
	$("#username").focus(function(){
	$("#tishi").html('');
	});

	$("#pwd").focus(function(){
	$("#tishi").html('');
	})
</script>
</body>
</html>