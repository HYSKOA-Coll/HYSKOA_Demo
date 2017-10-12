<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/teacher/css/start_clazz.css" rel="stylesheet" type="text/css"/>
<style type="text/css">

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
              <img alt="" src="${pageContext.request.contextPath}/teacher/img/hide_sidebar_0.png">
	         </a>
        </li>
      </ul>
</div>
<!-- 侧边栏  end -->
<input id="token_id" type="hidden" value="${token }">
<input id="clazz_id" type="hidden" value="${clazz_id }">
<div class="content-box clearfix">
   <div class="slug slug_left pull-left clearfix" id="slug_load_media" style="height: auto;">
                 <!-- 头部 标题+查询 bg -->
      	<div class="content-head clearfix">
       		  <input type="button" name="sure-btn" value="< 上一资源"   class="pull-left" onclick="medio_prev()">
            <p class="pull-left" id="show_media_name">基础听力A</p>
            <input type="button" name="sure-btn" value="下一资源 >"  class="pull-left" onclick="medio_next()">
         	 	<div class="pull-right">
		         		<b>班级：</b><span>${clazz_name } </span>
		         		<span>&nbsp;/&nbsp;</span>
		         		<b>教学计划：</b><span>${plan_name } </span>
		         		<input name="cancel-btn" value="布置作业" id="cancel_add" type="button"/>
	         		 </div>
     		 </div>
                  <!-- 头部 标题+查询 end -->
                  <!-- 正文 内容 bg -->
         <div class="content-detail" style="height: auto">
         <c:forEach items="${packetlist }" var="list">
        			   <!-- 上课资源 左侧部分 bg -->
			      <div class="qustion_media" style="height: auto">
			      	 <div class="clearfix media-name">
	                 <span class="pull-left">${list.packet_name }</span>
	                 <input type="button" idd="14" class="pull-right" name="cancel-btn" value="发送试题"  onclick="student_answer(${list.packet_id },$(this))">
                </div>
                <div class="media-content">
			      			 <audio src="http://localhost:8080/Exam/media/bbb.ogg" controls="controls"></audio>
			      			 <div>
			     		  			<font>口语大赛(干预模式一)</font>
			     		  			<font class="heng">——————————</font><br/>
			     		  			<span class="ztgy">整体干预</span>
			     		  			<span>${list.packet_prompt }</span>
			     		 		 </div>
			     		 		 <div class="question" style="margin-top: 16px;">
			     		 		 </div>
			     		  </div>
			     		  <div class="yinying" onclick="show_question($(this),${list.packet_id })" title="显示试题">
			     		 		 <img src="/Exam/teacher/img/uew_icon.png" alt="显示" >
			     		 	</div>
			      </div>
			      </c:forEach>
       	</div>
                <!-- 正文 内容 end -->
    </div>
</div>

<script type="text/javascript">
function show_question(t,packet_id){
	if(t.attr("title")=="显示试题"){
	
	 $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/question/getquestion.action',
			data:"packet_id="+packet_id,
			success:function(resultData){
				console.log(resultData)
				var data = "";
				for(var i=0; i<resultData.length;i++){
					var question_option = JSON.parse(resultData[i].question_option);
					console.log(question_option);
					type = resultData[i].question_type
					id="audio";
					data
						+="<p>"		
						+"<span>"+ (i+1) +". 题干：</span>"
						if(type == 1){
						data+="<audio src='http://localhost:8080/Exam/media/bbb.ogg' id='audio' controls='controls' ></audio>"
						}else{
						data+="<span>"+resultData[i].question_name+"</span>"
						}
						data+="</p>" 
						+"<li>A:"+question_option.A+"</li>"
						+"<li>B:"+question_option.B+"</li>"
						+"<li>C:"+question_option.C+"</li>"
						+"<li>D:"+question_option.D+"</li>"
						+"<P>&nbsp;&nbsp;&nbsp; 答案 ："+ resultData[i].question_correct +"</P>"
						+"<P>&nbsp;&nbsp;&nbsp; 干预 ："+ resultData[i].question_prompt +"</P>"
				} 
				t.prev().children().eq(2).html(data);
				t.attr("title","隐藏试题")
			}
		})  
	}else if(t.attr("title")=="隐藏试题"){
				t.prev().children().eq(2).html("");
        t.attr("title","显示试题");
	}
}

function student_answer(packet_id,t){
	
	if(t.attr("name")=="sure-btn"){
		alert("该试题已经发送");
    return;
	}
	token = $("#token_id").val()
	clazz_id= $("#clazz_id").val()
	alert("aaa-----"+packet_id+"---------"+token+"------------"+clazz_id)
	
	$.ajax({
		type:'POST',
		data:"token="+token+"&clazz_id="+clazz_id+"&packet_id="+packet_id,
		url:'${pageContext.request.contextPath}/instanceAnswer/addInstanceAnswer.action',
		success:function(resultData){
			alert(resultData)
			t.val("上课中...")
			t.attr("name","sure-btn");
		} 
	})  
}


/* 结束上课 */
 function end_class(t){
	
	 if(confirm("你确定要结束这堂课吗？")){ 
	 token = $("#token_id").val()
	 alert(token)
		$.ajax({
			type:'POST',
			data:"token="+token,
			url:'${pageContext.request.contextPath}/instance/end_instance.action',
			success:function(resultData){
				alert(resultData)
			} 
		})  
	 }else{
		 $("#start").attr("href","#")
		 alert("点击了取消");  
		 return;
	 }

}
</script>
</body>
</html>