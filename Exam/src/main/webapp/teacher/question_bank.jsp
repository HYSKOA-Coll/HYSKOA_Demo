<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>听力题库管理</title>

<style type="text/css">
#question_all_child_show p{
	margin-top:10px;
	width: 200px;
}
#question_all_child_show li{
	margin-left: 30px;
	margin-top: 10px;
}
#audio{
	margin-top: 20px;
	margin-left: 30px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
<!-- 头部导航  -->
<div class="nav-box clearfix">
	<jsp:include page="title.jsp"/> 
</div>
	
<!-- 正文  -->	
<!-- 侧边栏  bg -->
<div class="sidebar">
      <div class="hide-sidebar"></div>
      <ul id="left_nav_ul" class="sidebar-list" data-toggle="collapse" data-target="#demo">
      	<li>
	         <a href="javascript:void()">
              <img alt="" src="${pageContext.request.contextPath}/teacher/img/hide_sidebar_0.png">
	         </a>
        </li>
      </ul>

<div id="demo" class="collapse in">
    <ul id="left_nav_ul" class="sidebar-list">
       <li id="id1">
          <a href="javascript:void(0)">
            <img alt="查询" src="${pageContext.request.contextPath}/teacher/img/search_0.png">
            <p>查询</p>
          </a>
       </li>
        <li id="id2">
            <a href="${pageContext.request.contextPath}/teacher/addquestion.jsp">
               <img alt="新增" src="${pageContext.request.contextPath}/teacher/img/add_0.png">
               <p>新增</p>
            </a>
        </li>
     </ul>
</div>
</div>
<!-- 侧边栏  end -->


<!-- 中间部分  -->
<div class="content-box clearfix">
    <div class="slug slug_left pull-left clearfix" id="slug_load_media">
          <!-- 头部 标题+查询 bg -->
    <div class="content-head clearfix">
    		<h3>听力题库列表</h3>
    		<div class="con-head-infoSearch pull-right clearfix">
	   				<form action="${pageContext.request.contextPath}/question/getquestionp.action" method="get"> 
							<input type="hidden" name="pageNow" value="1">
	   			 		<select class="form-control" name="info_id" style="display:inline;margin-right: 10px;">
                     <option value="0">全部资源</option>
                     <option value="${teacher_id }">我的资源</option>
              </select>
              <select class="form-control" name="packet_level" style="display:inline;margin-right: 10px;">
                     <option value="">试题难度</option>
                     <option>简单</option>
                     <option>一般</option>
                     <option>困难</option>
              </select>

	   			 		<input type="text" name="name_type" id="search_name" placeholder="名称/适用学科"  style="margin-right:10px;">
	   			 		 <input type="submit" name="search-btn" value="查询">
	   			 		 </form>
     	 </div> 
    </div>
    <div class="content-detail" id="media_show">
  			<table class="table table-bordered table-hover">
  					 <thead>
						    <tr class="table_thead">
						      <th>编号</th>
						      <th>教师姓名</th>
						      <th>对应资源</th>
						      <th>套题名称</th>
						      <th>适用学科</th>
						      <th>难度等级</th>
						      <th>操作</th>
						    </tr>
						  </thead>
						   <tbody>
						     <c:forEach items="${qppb.datas }" var="list" varStatus="vas">
					   			<tr>
							      <td>${vas.count+qppb.start}</td>
                     <td>${list.info_name }</td>
                     <td>${list.media_name }</td>
                     <td>${list.packet_name}</td>
                     <td>${list.packet_type}</td>
                     <td>${list.packet_level}</td>
                    <td class="edit-td">
                        <a href="javascript:void(0)" onclick="sele_question_child(${list.packet_id })" title="查看"><img src="${pageContext.request.contextPath}/teacher/img/see_0.png" alt="查看"></a>
                        <a href="javascript:void(0)" onclick="dele_question(${list.packet_id })" title="删除"><img src="${pageContext.request.contextPath}/teacher/img/delete_0.png" alt="删除"></a>
                    </td>
                    <input type="hidden" value="${list.info_id }" id="id"/>
					   			</tr>
					   		</c:forEach>
						   </tbody>
  			</table>

                   		<!-- <audio src="http://localhost:8080/Exam/media/bbb.ogg" id="audio" controls="controls" ></audio> -->

  			<!-- 查看试题滑块 bg -->
        <div class="slug slug_right" id="question_all_child" style=" background-color: white; height:auto; min-height:400px; box-shadow:1px 1px 5px #756b6b;">
                <p class="drag"><img src="${pageContext.request.contextPath}/teacher/img/drag_0.png" alt="拖拽" class="pull-left"></p>
                <div class="edit-head clearfix">
                     <h3 class="pull-left">查看听力试题</h3>
                     <div class="edit-btn-box pull-right">
                         <input type="button" name="sure-btn" value=">>>" onclick="upd_hidd()">
                     </div>
                </div>
                <div style="width:100%; overflow-x:hidden;">
                   <div class="edit-content question_all_child_show" id="question_all_child_show">
                   						

                   </div>
                </div>
        </div>  
        <!-- 查看试题滑块 end -->
    </div>
    
     <div class="pagin">
     <div class="message">共&nbsp;<i class="blue">${qppb.totalRows }&nbsp;</i>条记录，当前显示第&nbsp;<i class="blue">${qppb.pageNow}&nbsp;</i>页</div>
   		 <ul class="pagination">
				    <li><a href="${pageContext.request.contextPath}/question/getquestionp.action?pageNow=1${term }">首页</a></li>
				    <c:forEach begin="1" end="${qppb.totalPages }" var="page"> 
				    <li><a href="${pageContext.request.contextPath}/question/getquestionp.action?pageNow=${page}${term }">${page}</a></li>
				    </c:forEach>
				    <li><a href="${pageContext.request.contextPath}/question/getquestionp.action?pageNow=${qppb.totalPages }${term }">尾页</a></li>
				</ul>
     </div>
</div>
</div>
<!-- 中间部分end  -->
<input type="hidden" id="teacher_id" value="${teacher_id }">


<script>
/*  导航 */
if(document.getElementById("tltkgl")){
$(".nav-list").children().eq(1).find("a").css({"fontSize":"21px", "color":"#60ac62"});
} 
/* 验证登录 */
function check(){
	info_id = $("#teacher_id").val()
	if(info_id == "" || info_id == null){
		window.location.href = "${pageContext.request.contextPath}/login.jsp";
	}
}
/*  刷新时侧边栏样式 */
window.onload = function(){
	check()
	  var src = $("#id1").find("img").attr("src");
	  src = src.replace(/\d/,"2");
		$("#id1").find("img").attr("src",src);
		$("#id1").css("backgroundColor","#60ac62").find("p").css("color","#fff");
	}

//点击查看试题的所有子题
function sele_question_child(packet_id){
		alert("packet_id---"+packet_id)
	
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
				$("#question_all_child_show").html(data);
			}
		})   
		
	  $(".slug_left").animate({"width":"68.5%"}) 
    $(".slug_right").css({"display":"block"}).animate({"right":"0%"},function(){       //slug_right 滑出
    slug_left_w = $(".slug_left").innerWidth();        //slug_right滑出后获取slug_left的宽度
    }); 
}  

//点击取消
function upd_hidd(){
        $(".slug_left").animate({"width":"98.5%"})
        var slug_right_w = $(".slug_right").innerWidth();
        $(".slug_right").animate({"right": -slug_right_w - 15 + "px"},function(){
        $(this).css({"width":"30%","display":"none"});
        });
        
}


/* 删除  */
function dele_question(packet_id){
	
	id1 = $("#id").val();
	id2 = $("#teacher_id").val()
	alert(id1+'--'+id2)
	if(id1 != id2){
		alert("您无权限删除此资源")
		return;
	}
	alert(packet_id)
	 if(confirm( '是否确定删除？ ')==false){
		    return false;
		 }
	   $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/question/delquestion.action',
			data:"packet_id="+packet_id,
			success:function(resultData){
					window.location.reload();
			}
		}) 
}


var audio ;
var initAudio = function(){
	
	audio = document.getElementById('audio');
}

function playOrPaused(id,obj){
	if(audio.paused){
		audio.play();
		obj.innerHTML='暂停';
		return;
	}
	audio.pause();
	obj.innerHTML='播放';
}

 function hideOrShowControls(id,obj){
	if(audio.controls){
		audio.removeAttribute('controls');
		obj.innerHTML = '显示控制框'
		return;
	}
	audio.controls = 'controls';
	obj.innerHTML = '隐藏控制框'
	return;
} 
 //保留一位小数点

function returnFloat1(value) {    
	value = Math.round(parseFloat(value) * 10) / 10;
	if (value.toString().indexOf(".") < 0){
		value = value.toString() + ".0";
	}
	return value;
}
</script>

</body>
</html>