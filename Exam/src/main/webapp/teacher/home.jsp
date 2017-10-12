<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师首页</title>
<style type="text/css">
font{
	margin-right: 10px;
}
.home_from{
	margin-left: 30px;
}
#clazz{
display:inline;margin-right: 10px; width: 300px;"
}
#plan{
display:inline;margin-right: 10px; width: 300px;"
}
#media_show{
	margin-left: 27%;
	margin-top: 5%;
}
.err{
	color: red;
}
</style>
</head>

<body>
<!-- 头部导航  -->
<div class="nav-box clearfix">
	<jsp:include page="title.jsp"/> 
</div>
<!-- 侧边栏  bg -->
<div class="sidebar">
      <div class="hide-sidebar"></div>
      <ul id="left_nav_ul" class="sidebar-list">
      	<li id="id">
	         <a href="javascript:void()">
              <img alt="" src="img/hide_sidebar_0.png">
	         </a>
        </li>
      </ul>
</div>
<!-- 侧边栏  end -->

<div class="content-box clearfix">
   <div class="slug slug_left pull-left clearfix" id="slug_load_media">
                    <!-- 头部 标题+查询 bg -->
         <div class="content-head clearfix">
                 <h3 class="pull-left">开始上课</h3>
         </div>
                    <!-- 头部 标题+查询 end -->
                    <!-- 正文 内容 bg -->
         <div class="content-detail" id="media_show">
            <div class="edit-content start-class">
              <form class="home_from" action="">
		   			 				<font>上课班级</font>
		   			 				<select class="form-control" id="clazz">
                    <option id="c1">选择班级</option>
	              </select><i class="err"></i><br/><br/>
	              <font>教学计划</font>
	              <select class="form-control" id="plan">
                    <option id="p1">选择计划</option>
	              </select><i class="err"></i><br/><br/>
              
	   			 		 </form>
                <div class="start-class-btn">
                   <input type="button" name="sure-btn" id="start" value="开始上课"  style="width: 250px; margin-left: 100px; margin-bottom: 60px;" onclick="star_class()">
                </div>
            </div>
         </div>
                <!-- 正文 内容 end -->
    </div>
</div>
<input type="hidden" id="teacher_id" value="${teacher_id }">
<input type="hidden" id="teacher_name" value="${teacher_name }">

<script type="text/javascript">
//显示隐藏侧边栏
$(".hide-sidebar").click(function(){
  $(".sidebar-list").slideToggle();
})

/* 验证登录 */
function check(){
	info_id = $("#teacher_id").val()
	if(info_id == "" || info_id == null){
		window.location.href = "${pageContext.request.contextPath}/login.jsp";
	}
}
window.onload = function(){
	check()
	checkclazz()
	checkplan()
}
	
/* 查询班级 */	
function checkclazz(){
	   $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/instance/clazzIdName.action',
			success:function(resultData){
				
				var data = resultData
				if(data==null){
					return;
				}
				for(var clazz in data){
					var t = $("<option></option>");
					t.text(data[clazz].clazz_name)
				  t.val(data[clazz].clazz_id)
				  $("#c1").after(t)
				}
			}
		}) 
}

/*查询教学计划  */
function checkplan(){
	
	   $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/instance/planIdName.action',
			success:function(resultData){
				
	 			var data = resultData
				if(data==null){
					return;
				}
				for(var plan in data){
					var p = $("<option></option>");
					p.text(data[plan].plan_name)
				  p.val(data[plan].plan_id)
				  $("#p1").after(p)
				}
			} 
		}) 
}

/* 开始上课 */
function star_class(){
	alert("aaa")
	clazz_id = $("#clazz").val()
	plan_id = $("#plan").val()
	info_id = $("#teacher_id").val()
	
	info_name= $("#teacher_name").val()
	
	if(clazz_id == "选择班级" ){
		$("#clazz").next().html("请选择班级")
		return;
	}
	if(plan_id == "选择计划" ){
		$("#plan").next().html("请选择计划")
		return;
	}
	
	clazz_name= $("#clazz option[value="+clazz_id+"]").html();
	alert("clazz_name----"+clazz_name)
	plan_name= $("#plan option[value="+plan_id+"]").html();
	alert("plan_name----"+plan_name)
	
	  $.ajax({
			type:'POST',
			data:"clazz_id="+clazz_id+"&plan_id="+plan_id+"&info_id="+info_id+"&info_name="+info_name+"&plan_name="+plan_name,
			url:'${pageContext.request.contextPath}/instance/stat_instance.action',
			success:function(resultData){
				if(resultData == "repeat"){
					alert("失败")
					return;
				}
				alert(resultData)
			 	$.ajax({
					type:'POST',
					data:"plan_id="+plan_id+"&clazz_id="+clazz_id+"&clazz_name="+clazz_name+"&plan_name="+plan_name+"&token="+resultData,
					url:'${pageContext.request.contextPath}/instance/selectPacket.action',
					success:function(resultData){
						document.write(resultData)
						document.close();
					} 
				})  
					 /* window.location.href = "${pageContext.request.contextPath}/instance/selectPacket.action?plan_id="+plan_id+"&clazz_name="+clazz_name+"&plan_name="+plan_name; */
				
			} 
		}) 
}

// 聚焦事件
$("#clazz").click(function(){
	$("#clazz").next().html('')
})
$("#plan_id").click(function(){
	$("#plan_id").next().html('')
})

</script>
</body>
</html>