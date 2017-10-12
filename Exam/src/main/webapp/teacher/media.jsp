<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>听力资源</title>
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
      	<li id="id">
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
            <a href="${pageContext.request.contextPath}/teacher/addmedia.jsp">
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
    		<h3>听力资源列表</h3>
    		<div class="con-head-infoSearch pull-right clearfix">
	   				<form action="${pageContext.request.contextPath}/media/getmedia.action" method="get"> 
							<input type="hidden" name="pageNow" value="1">
	   			 		<select class="form-control" name="info_id" style="display:inline;margin-right: 10px;">
                     <option value="0">全部资源</option>
                     <option value="${teacher_id }">我的资源</option>
              </select>
              <select class="form-control" name="media_type" style="display:inline;margin-right: 10px;">
                     <option value="">资源类型</option>
                     <option>音频</option>
                     <option>视频</option>
              </select>
              <select class="form-control" name="media_level" style="display:inline;margin-right: 10px;">
                     <option value="">试题难度</option>
                     <option>简单</option>
                     <option>一般</option>
                     <option>困难</option>
              </select>

	   			 		<input type="text" name="media_name" id="search_name" placeholder="资源名称"  style="margin-right:10px;">
	   			 		 <input type="submit" name="search-btn" value="查询">
	   			 		 </form>
     	 </div> 
     	 
    </div>
    <div class="content-detail" id="media_show">
  			<table class="table table-bordered table-hover">
  					 <thead>
						    <tr class="table_thead">
						      <th>资源名称</th>
						      <th>难度</th>
						      <th>类型</th>
						      <th>大小</th>
						      <th>上传时间</th>
						      <th>操作</th>
						    </tr>
						  </thead>
						   <tbody>
						     <c:forEach items="${mediapb.datas }" var="list">
					   			<tr>
							      <td>${list.media_name}</td>
                     <td>${list.media_level}</td>
                     <td>${list.media_type}</td>
                     <td><span>${list.media_size}</span><span> MB</span></td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.media_time }" /></td>
                     <input type="hidden" id="info_id" value="${list.info_id }">	
                    <td class="edit-td">
                    
                      <a href="javascript:void(0)" onclick="detail_media('${list.media_name }','${list.media_level }','${list.media_type}','${list.media_id}')" title="修改">
                      <img src="${pageContext.request.contextPath}/teacher/img/edit_0.png" alt="修改"></a>

                      <a href="javascript:void(0)" lang="${list.media_id}" lang2="${list.media_type}" lang3="Exam/media/${list.media_path}" class="play" title="播放">
                      <img src="${pageContext.request.contextPath}/teacher/img/play_0.png" alt="播放" /></a>
	                    
	                    <c:url var="url" value="/media/down.action">
							 	 				<c:param name="filename" value="${list.media_path}"></c:param>
							 	 			</c:url>
                     
                      <a href="${url}" title="下载"><img src="${pageContext.request.contextPath}/teacher/img/download_0.png" alt="下载"></a>
                      <a href="javascript:void(0)" onclick="media_del('${list.media_id}','${list.media_path}')" title="删除"><img src="${pageContext.request.contextPath}/teacher/img/delete_0.png" alt="删除"></a>
                    </td>
					   			</tr>
					   		</c:forEach>
						   </tbody>
  			</table>
  			
  			  <!-- 修改资源滑块 -->
        <div class="slug slug_right"  id="slug_upd_media" style="background-color: white;height:auto; min-height:455px; box-shadow:1px 1px 5px #756b6b;" >
             <p class="drag"><img src="${pageContext.request.contextPath}/teacher/img/drag_0.png" alt="拖拽" class="pull-left"></p>
                <div class="edit-head clearfix">
                    <h3 class="pull-left">添加听力资源</h3>
                    <div class="edit-btn-box pull-right">
                         <input type="button" name="sure-btn"  value="确 定"  onclick="edit_media()">
                         <input type="button" name="cancel-btn" value="取 消"  onclick="upd_hidd()" >
                    </div>
                </div>
          <div class="edit-content">
                <div>
                   <p style="margin-top: 10px;">资源名称：</p>
                   <div>
                      <input type="text" placeholder="请输入名字"  id="media_name_edit" class="lg-element">
                   </div>
                </div>
                <div>
                    <p style="margin-right: 14px;">难度等级：</p>
                    <select class="form-control"  id="difficulty_level_edit" style="width: 200px;">
                              <option value="简单">简单</option>
                              <option value="一般">一般</option>
                              <option value="困难">困难</option>
                        </select> 
                 </div>
                         
                  <div>
                      <p style="margin-right: 14px;">资源类型：</p>
	                        <select class="form-control" id="media_type_edit" style="width: 200px; margin-left: 30px;">
	                               <option value="音频">音频</option>
	                               <option value="视频">视频</option>
	                        </select> 
                  </div>
                  <input type="hidden" id="media_id" />
            </div>
        </div> 
        <!-- 修改资源滑块end -->
    </div>
     <div class="pagin">
     <div class="message">共&nbsp;<i class="blue">${mediapb.totalRows }&nbsp;</i>条记录，当前显示第&nbsp;<i class="blue">${mediapb.pageNow}&nbsp;</i>页</div>
				<ul class="pagination">
				    <li><a href="${pageContext.request.contextPath}/media/getmedia.action?pageNow=1">首页</a></li>
				    <c:forEach begin="1" end="${mediapb.totalPages }" var="page"> 
				    <li><a href="${pageContext.request.contextPath}/media/getmedia.action?pageNow=${page}${term }">${page}</a></li>
				    </c:forEach>
				    <li><a href="${pageContext.request.contextPath}/media/getmedia.action?pageNow=${mediapb.totalPages }${term }">尾页</a></li>
				</ul>
     </div>
</div>
</div>
<input type="hidden" id="teacher_id" value="${teacher_id }">
<!-- 中间部分end  -->
<script>
/*  导航 */
if(document.getElementById("tlzygl")){
$(".nav-list").children().eq(0).find("a").css({"fontSize":"21px", "color":"#60ac62"});
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
		initAudio();
	  var src = $("#id1").find("img").attr("src");
	  src = src.replace(/\d/,"2");
		$("#id1").find("img").attr("src",src);
		$("#id1").css("backgroundColor","#60ac62").find("p").css("color","#fff");
	}
	
//点击修改
var slug_left_w = null;
function detail_media(media_name,media_level,media_type,media_id){
	
	info_id = $("#info_id").val();
	id2 = $("#teacher_id").val()
	if(info_id != id2){
		alert("您无权限修改此资源")
		return;
	}
	alert(media_name+"---"+media_level+"---"+media_type+"---"+media_id)
		
		$("#media_name_edit").val(media_name)
		$("#media_id").val(media_id)
    $("#difficulty_level_edit option[value='"+media_level+"'] ").attr("selected",true)
		$("#media_type_edit option[value='"+media_type+"'] ").attr("selected",true)
        
		
    $(".slug_left").animate({"width":"65.5%"})
    $(".slug_right").css({"display":"block"}).animate({"right":"0%"},function(){       //slug_right 滑出
    slug_left_w = $(".slug_left").innerWidth();        //slug_right滑出后获取slug_left的宽度
        })
}
//点击取消
function upd_hidd(){
        $(".slug_left").animate({"width":"98.5%"})
        var slug_right_w = $(".slug_right").innerWidth();
        $(".slug_right").animate({"right": -slug_right_w - 15 + "px"},function(){
        $(this).css({"width":"30%","display":"none"});
        });
        
}
/* 修改 */
function edit_media(){
	
	media_name = $("#media_name_edit").val();
	media_level = $("#difficulty_level_edit").val();
	media_type = $("#media_type_edit").val();
	info_id = $("#info_id").val();
	media_id = $("#media_id").val()
	alert(media_name+"-----"+media_level+"-----"+media_type+"----"+info_id+"-----"+media_id)
	if(media_name == "" || media_name== null){
		return;
	}
	   $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/media/editmedia.action',
			data:"media_name="+media_name+"&media_level="+media_level+"&media_type="+media_type+"&info_id="+info_id+"&media_id="+media_id,
			success:function(resultData){
				if(resultData=="success"){
				alert("修改听力资源成功")
         window.location.reload();
				}
			}
		}) 
}


/* 删除 */
function media_del(media_id,media_path){
	id1 = $("#info_id").val();
	id2 = $("#teacher_id").val()
	
	if(id1 != id2){
		alert("您无权限删除此资源")
		return;
	}
	
 if(confirm( '是否确定删除？ ')==false){
    return false;
 }
	   $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/media/delmedia.action',
			data:"media_id="+media_id+"&media_path="+media_path,
			success:function(resultData){
				if(resultData=="success"){
				alert("删除听力资源成功")
				window.location.reload();
				}else if(resultData=="repeat"){
					alert("删除听力资源失败")
				}else if(resultData=="fail"){
					alert("删除文件失败")
				}
			}
		}) 
}


$(".play").click(function(){
	audio = $("#audio").val();
	if(audio == undefined || audio==null){
		var media_id = $(this).attr("lang");
		var media_type = $(this).attr("lang2");
		var media_path = $(this).attr("lang3");
		var tr = $(this).parents("tr") 
		alert(media_id+"--"+media_type +"--"+ media_path+"--"+tr)
		var div1 = $("<tr class='hah'></tr>")
		var td1 = $("<td></td>")
		var bu = $("<audio></audio>")
		bu.attr({"id":"audio","controls":"controls","src":"http://localhost:8080/"+media_path})
		td1.attr("colspan","6")
		td1.html(bu);
		div1.html(td1);
		tr.after(div1);
		
	}else{
		$(".hah").remove();
		
	}
 
});



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