<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${pageContext.request.contextPath}/teacher/css/page.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/teacher/css/manage.css" rel="stylesheet" type="text/css" />
<title>教学计划</title>
<style type="text/css">
#delete_s{
display:none;
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
      <ul id="left_nav_ul" class="sidebar-list" data-toggle="collapse" data-target="#demo">
      	<li id="id">
	         <a href="javascript:void()">
              <img alt="" src="Exam/teacher/img/hide_sidebar_0.png">
	         </a>
        </li>
      </ul>

<div id="demo" class="collapse in">
    <ul id="left_nav_ul" class="sidebar-list">
       <li id="id1">
          <a href="javascript:void(0)">
            <img alt="查询" src="img/search_0.png">
            <p>查询</p>
          </a>
       </li>
        <li id="id2">
            <a href="../teacher/Teaching.jsp">
               <img alt="新增" src="img/add_0.png">
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
    		<h3>教学计划列表</h3>
    		<div class="con-head-infoSearch pull-right clearfix">
    				<form action="./getplan.action?pageNow=1" method="post">
              <select id="add_test1" name="info_id" class="form-control a1" style="display:inline;margin-right: 10px;">
                     <option value="0">全部计划</option>
                     <option value="${sessionScope.teacher_id}">我的计划</option>
              </select>
              
	   			 		<input type="text" id="search_name" placeholder="请输入名称"  name="plan_name" style="margin-right:10px;">
	   			 		<input id="aaaaa" type="submit" name="search-btn" value="查询">
     	 		</form>
     	 </div> 
    </div>
    <div class="content-detail" id="media_show">
  			<table class="table table-bordered table-hover">
  					 <thead>
						    <tr class="table_thead">
						      <th>编 号</th>
						      <th>教学计划名称</th>
						      <th>创建时间</th>
						      <th>创建用户</th>
						      <th>操作</th>
						    </tr>
						  </thead>
						   <tbody>						   
						   <c:forEach items="${qqq.datas}" var="list" varStatus="vas">
						   			<tr>
                      <td>1</td>                  
                      <td>${list.plan_name}</td>
                      <td>${list.plan_time}</td>
                      <td>${list.info_name}</td>
                      <td class="edit-td">
                        <a class="all" id="add_list" onclick="detail_media()" name="info_id" lang="${list.info_id}" title="查看"><img src="img/see_0.png" alt="查看"></a>
                        <a href="javascript:void(0)" class="delete_on"  onclick="a(${list.plan_id})" name="plan_id" title="删除"><img src="img/delete_0.png" alt="删除"></a>
                      </td>
						   			</tr>
						   	</c:forEach>		
						   </tbody>
  			</table>
  				
    </div>
     <div class="pagin">
        <div class="message">共<i class="blue">${tpb.totalRows }</i>条记录，当前显示第&nbsp;<i class="blue">${tpb.pageNow}&nbsp;</i>页</div>
         <ul class="paginList">
             <li class="paginItem"><a href="./getplan.action?pageNow=1" target="rightFrame"><span class="pagepre"><&nbsp;</span></a></li>
             <c:forEach begin="1" end="${tpb.totalPages}" var="page"> 
             <li class="paginItem"><a href="./getplan.action?pageNow=${page}" target="rightFrame">${page}</a></li>
             </c:forEach>	
             <li class="paginItem"><a href="./getplan.action?pageNow=${tpb.pageNow+1}" target="rightFrame"><span class="pagenxt" >&nbsp;></span></a></li>
         </ul>
         <br><br><br>
     </div>
</div>
<!-- 教学计划详情 滑块 bg -->
        <div class="tj slug slug_right" id="slug_upd_child" style="background-color:white;
        margin-top:10px;height:500px;">
                <p class="drag"><img src="/static/img/drag_0.png" alt="拖拽" class="pull-left"></p>
                <div class="edit-head clearfix">
                        <h3 class="pull-left">计划详情</h3>
                        <div class="edit-btn-box pull-right">
                                <input type="button" name="sure-btn"  value=">>>" onclick="slug_right_hidd()"><br/><br/>
														 <input id="input" type="text" name="info_id" value="${info_id}" style="float:left;"><br/>
                							<div style="margin-left:-180px;">
                											
															<p>第1个</p><br/><br/>
															
															<p>资源名称：鲮鲤科</p><br/><br/>
															
															<p>试题资源预览:</p><br/><br/>
															
															<p>试题名称：llll</p>
															
															<p>整体干预：</p>
															
															<p>1. 题干：lll</p>
                											
                							</div>
                        </div>
                </div>
                <div class="edit-content question_all_child_show" id="project_show">
                </div>
        </div>
        <!-- 教学计划详情 滑块 end -->
</div>
<!-- 弹框 -->
<div class="tip" id="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo"> <span><img src="${pageContext.request.contextPath}/teacher/img/ticon.png" /></span>
                <div class="tipright">
                   <p id="tip_ts"></p>
                </div>
        </div>
</div>
<div class="tip" id="delete_tip">
     <div class="tiptop">
             <span>提示信息</span><a></a>
     </div>
     <div class="tipinfo">
             <span><img src="${pageContext.request.contextPath}/teacher/img/ticon.png" /></span>
             <div class="tipright">
                     <p id="ok_tip">确定删除选定数据吗？</p>
             </div>
     </div>
     <div class="tipbtn">
             <input type="button" onclick="delete_sure()" id="delete_btn" class="sure" value="确定" />&nbsp;
             <input type="button" class="cancel" id="delete_cancel" value="取消" />
     </div>
</div>
<!-- 删除教学计划-->
<div id="delete_s" style="display:none; width: 500px;height:200px;background-color: #ECFFFF;position:absolute;left: 25%;top:80px; ">
	<span style="background-color: #2894FF;font-size:15px;color:white;padding:5px;">删除专业</span>
	<a href=""><img id="cencel" src="${pageContext.request.contextPath}/teacher/img/close.png" style="margin-left: 475px; margin-top: -25px;"></a><br/><br/>
	<p style="font-size:15px;padding:40px;">
	<p style="text-align:center;font-size:30px;margin-top:-50px;"><b>是否删除</b></p>
	<input id="han" type="button" value="确认" style="padding:10px;background-color:white;margin-left:200px;background-color:blue;">
		<input type="button" value="取消"  onclick="del_cancel()" style="padding:10px;background-color:white;background-color:gray; ">
</div>
<!-- 隐藏部分 -->
<!-- <div class="blook">
	
</div> -->
<!-- 中间部分end  -->

<script>
/*  导航 */
if(document.getElementById("tlzygl")){
$(".nav-list").children().eq(0).find("a").css({"fontSize":"21px", "color":"#60ac62"});
} 
/*  刷新时侧边栏样式 */
window.onload = function(){
	  var src = $("#id1").find("img").attr("src");
	  src = src.replace(/\d/,"2");
		$("#id1").find("img").attr("src",src);
		$("#id1").css("backgroundColor","#60ac62").find("p").css("color","#fff");
	}

/* 删除教学 */
$(document).ready(function(){
	$(".delete_on").click(function(){
		$("#delete_s").css("display","block");
		
	});
});


function detail_media(){
	$(".slug_left").animate({"width":"65.5%"})
    $(".slug_right").css({"display":"block"}).animate({"right":"0%"},function(){       //slug_right 滑出
    slug_left_w = $(".slug_left").innerWidth();        //slug_right滑出后获取slug_left的宽度
    $(".all").click(function(){
		var s = $(this).attr("lang")
		
        })
    })
}
//点击取消
function slug_right_hidd(){
        $(".slug_left").animate({"width":"98.5%"})
        var slug_right_w = $(".slug_right").innerWidth();
        $(".slug_right").animate({"right": -slug_right_w - 15 + "px"},function(){
        $(this).css({"width":"40%","display":"none"});
        });
        
}
function a(plan_id){
	$("#han").click(function(){

		alert('plan_id-----'+plan_id);
		 $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/deleteplan.action',
			data:"plan_id="+plan_id,
			success:function(resultData){
				//如果请求成功,会执行该函数内容，resultData是响应数据
				if(resultData == "success"){
	  				$("#delete_tip").hide();
	                $("#bg1").hide();
	                $("#tip_ts").html("操作成功");
	                tip();
	                $("#delete_s").css("display","");
	                setTimeout(function(){
	                window.location.reload();
	               					},1000)
				}else if(resultData == "repeat"){
					$("#delete_tip").hide();
	        $("#bg1").hide();
	        $("#tip_ts").html("操作失败");
	        tip();
				}
			}
		}); 
		
	});
	}
	
	/* $(document).ready(function(){
		$(".all").click(function(){
			var s = $(this).attr("lang")
			
		})
	})
 */
	/* $(document).ready(function(){
		$(".a1").change(function(){
			$.ajax({
				type:'POST',
				url:'${pageContext.request.contextPath}/getplan.action',
				data:"info_id="+info_id,
				success:function(resultData){
					$(".aaa").remove();
					var data = resultData;
						for(var o in data){
						      var t = $("<option></option>");
						      t.val(data[o].info_id)
						      t.attr("class","aaa")
						      	$(".b3").after(t)
								} 
					}
				})
		})
	   }); */
	
	/* function load(){
		alert('-----------------')
		var info_id = $(".b3").val()
		var plan_name = $("#search_name").val()
		$.ajax({
			type:'post',
			url:'./getplan.action',
			data:'info_id='+info_id+'&plan_name='+plan_name,
		})
	} */
	
	/*  $(document).ready(function(){
		$("#search_name").change(function(){  
			/* $.ajax({
				type:'POST',
				url:'${pageContext.request.contextPath}/getplan.action',
				date:"plan_name="+plan_name,
				success:funtion(resultData){
					/* $(".aa").remove();
					var data=resultData;
					for(var o in data){
						var t=$("<input></input>");
						t.val(data[o].plan_name)
						t.attr("class","aa")
						$("load_(1)").after(t)
					}
				}
			}) 
			
		}
			
		})
	})  */
	/* $(document).ready(function(){
		$("#search_name").change(function(){
			alert("hahhahahaha")
		})
	}) */
	
	/* 查询 */
	$(document).ready(function(){
	$(".all").click(function(){
		$(".slug").css("display","block");
		
	});
});
	/* $(".slug").click(function(){
		info_id=$("#input").val();
		alert('info_id-----'+info_id);
	});	 */
/* 提示函数 */
/* function tip(){
        $("#tip").fadeIn(500)
        $("#tip").delay(1000)
        $("#tip").fadeOut(500)
} */

</script>
</body>
</html>