<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加试题</title>
<link href="${pageContext.request.contextPath}/teacher/css/question.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
.slug_media{
	margin-top: 100px;
}
</style>
</head>
<body>

<!-- 头部导航  -->
<div class="nav-box clearfix">
	<jsp:include page="title.jsp"/> 
</div>
<!-- 头部导航  end-->

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
          <a href="${pageContext.request.contextPath}/question/getquestionp.action?pageNow=1&info_id=&packet_level=&name_type=">
            <img alt="查询" src="${pageContext.request.contextPath}/teacher/img/search_0.png">
            <p>查询</p>
          </a>
       </li>
        <li id="id2">
            <a href="javascript:void(0)">
               <img alt="新增" src="${pageContext.request.contextPath}/teacher/img/add_0.png">
               <p>新增</p>
            </a>
        </li>
     </ul>
</div>
</div>
<!-- 侧边栏  end -->

<!-- 正文部分 bg -->
<div class="content-box clearfix">
   <div class="slug slug_left pull-left clearfix" id="slug_load_media">
            <!-- 头部 标题+查询  -->
    	<div class="content-head clearfix">
    		<h3>增加听力试题</h3>
    		<div class="con-head-infoSearch pull-right clearfix">
   			 		 <input type="button" name="sure-btn" value="开始出题"  id="st_qu" onclick="star_question()">
             <input type="button" name="sure-btn" value="完 成" id="cokeym_question" onclick="com_question()" style="margin-left:15px;">
     	  </div> 
   		</div>
   			<!-- 头部 标题+查询 end  -->
  		<div class="content-detail clearfix" style="width:95%;">
  				<form class="contentfrom" action="">
		  				<div class="tip">
		  						<i></i>
		  						<i></i>
		             <span>请先填写试题信息</span>
		          </div>
							<font>资源名称</font>
							<div class="custom-file-box inline-block media-file min" onclick="sele_media()" >	
								<a href="javascript:void(0)">请选择 </a>
                 <span id="m_name" style="margin-left: 10px; display: inline;">选择资源</span>
                 	<input type="hidden" id="m_id">
								<input class="custom-file" id="choose" type="button" value="请选择">
							</div>
 							<font>试题名称</font> <input id="packet_name" type="text" class="min" placeholder="试题名称"/>
 							<font>适用学科</font> <input id="packet_type" type="text" class="min" placeholder="学科名称"/>
 							<font>难度等级</font>
 							<select class="form-control c_input min" id="packet_level" style="display: inline;">
                    <option value="">难度等级</option>
                    <option value="简单">简单</option>
                    <option value="一般">一般</option>
                    <option value="困难">困难</option>
	           	</select><br/><br/>
  						<font class="tex">整体干预</font><br/>
  						<textarea id="packet_prompt" placeholder="干预内容" style=""></textarea>
  						<input id="teacher_id" type="hidden" value="${teacher_id }"/>
  				</form>
   		</div>
  			 <!-- 试题展示区域 bg -->
      <div class="list-question-show-box">
           <h4>试题显示区域</h4>
           <div class="list-question-show-con" id="question_reg">
               <p class="list-question-show-prompt">试题信息填写完成后点击“开始出题“按钮进行出题</p>
               				
           </div>
      </div>
            <!-- 试题展示区域 end -->
   </div>
</div>
<!-- 正文部分end -->


  
<!-- 选择资源滑块 bg -->
<div class="slug slug_right" id="slug_media" style="background-color: white;height:auto; margin-top:90px; min-height:528px; overflow-x:hidden; box-shadow:1px 1px 5px #756b6b;" >
	 <p class="drag"><img src="${pageContext.request.contextPath}/teacher/img/drag_0.png" alt="拖拽" ></p>	
    <div class="content-head clearfix">
   		<h3>选择听力资源</h3>
   		<div class="con-head-infoSearch pull-right clearfix" style="margin-top: 10px;">
   				<form id="mediafrom" method="post"> 
						<!-- <input type="hidden" name="pageNow" value="1"> -->
   			 		<select class="form-control" name="info_id" id="info_id" style="display:inline;margin-right: 10px;">
                    <option value="0">全部资源</option>
                    <option value="${teacher_id }">我的资源</option>
             </select>
             <select class="form-control" name="media_type" id="media_t" style="display:inline;margin-right: 10px;">
                    <option value="">资源类型</option>
                    <option value="音频">音频</option>
                    <option value="视频">视频</option>
             </select>
             <select class="form-control" name="media_level" id="media_level" style="display:inline;margin-right: 10px;">
                    <option value="">试题难度</option>
                    <option value="简单">简单</option>
                    <option value="一般">一般</option>
                    <option value="困难">困难</option>
             </select>

   			 		<input type="text" name="media_name" id="search_name" placeholder="资源名称"  style="margin-right:10px;">
   			 		
   			 			<input type="button" name="search-btn" onclick="sele_media()" value="查询">
   			 		 <input type="button" name="cancel-btn" onclick="remove_question()" value="确定">
   			 		 </form>
    	 </div> 
   </div>
    	<!--media数据部分  -->
   	<div id="media_all" >
 		</div> 	
</div>
<!-- 选择资源滑块 end -->


<!-- 出题滑块 bg -->
<div class="slug slug_right" id="slug_question" style="background-color: white;height:auto; min-height:455px; box-shadow:1px 1px 5px #756b6b; margin-top: 90px;">
     <div class="edit-head clearfix">
         <h3 class="pull-left">开始出题</h3>
         <div class="edit-btn-box pull-right">
             <input type="button" name="sure-btn"  value="提 交" onclick="add_question()" >
             <input type="button" name="cancel-btn" value="取 消" onclick="remove_question()" >
         </div>
     </div>
    	<div class="edit-content start-question">
                       <!-- 文字题和语音题选择 bg -->
          <div class="list-question-styleOne">
              <ul class="menu-ul-one clearfix">
                  <li class="selected-li-one">
                     <label id="wzst">文字试题<input type="hidden" value="1" checked="checked" name="st_type" class="hidd"></label>
                  </li>
                  <li>
                     <label id="yyst">语音试题<input type="hidden" value="2" name="st_type" class="hidd"></label>
                  </li>
              </ul>
              <div id="wenzi_st">
                  <p>题干</p>
                  <textarea id="wz_question_content" class="textarea-style" placeholder="输入题目内容"></textarea>
              </div>
              <div id="yuyin_st" class="yuyin-st" style="display:none;">
                   <div class="audio-up clearfix" id="yp_url">
                       <span style="margin-top: -25px;margin-right: 3px;">本地文件</span>
                       <div class="custom-file-box inline-block">
                            <a href="javascript:void(0)">选择文件</a>
                            <span>未选择任何文件</span>
														<form id="questionyy" enctype="multipart/form-data">                            					
                            <input type="file" class="custom-file" id="st_yp" name="st_yp" onchange="shitin_au(this.files,$(this))" >
                            </form>
                       </div>
                   </div>
                   <div class="audio-up clearfix">
                       <span id="st_url"></span>
                   </div>
              </div>
         </div>
                       <!-- 文字题和语音题选择 end -->
                        
                        <!-- 主观题和客观题选择 bg -->
				    <div class="list-question-styleTwo">
				        <ul class="menu-ul-two clearfix">
				            <li>
				                <label id="kgt">题目内容<input type="hidden" value="4" name="lx_type" class="hidd"></label>
				            </li>
				        </ul>
				       <div id="keguan_st" class="keguan-st" style="display:none;">
				          <div>
				             <span>选项内容</span>
				             <ul class="clearfix question-option-list">
				                 <li>
				                    <span>A</span>
				                    <textarea id="kg_questionA" placeholder="选项A"></textarea>
				                 </li>
				                 <li>
				                     <span>B</span>
				                     <textarea id="kg_questionB" placeholder="选项B"></textarea>
				                 </li>
				                 <li>
				                      <span>C</span>
				                      <textarea id="kg_questionC" placeholder="选项C"></textarea>
				                 </li>
				                 <li>
				                      <span>D</span>
				                      <textarea id="kg_questionD" placeholder="选项D"></textarea>
				                 </li>
				                 <li>
				                      <span>E</span>
				                      <textarea id="kg_questionE" placeholder="选项E"></textarea>
				                 </li>
				             </ul>
				          </div>
				          <div class="true-answer">
				              <span>正确答案</span>
				              <div class="custom-select-box">
				                    <select class="form-control" id="kg_question_answer" style="margin-left: -8px;">
				                    <option value="">正确选项</option>
				                    <option value="A">A</option>
				                    <option value="B">B</option>
				                    <option value="C">C</option>
				                    <option value="D">D</option>
				                    <option value="E">E</option>
				                 </select>
				              </div>
				          </div>
				           <div>
				               <li>
				                 <span>干 预</span>
				                 <textarea class="textarea-style" placeholder="请输入干预内容" id="zg_question_remark"></textarea>
				             </li>
				           </div>
				       </div>
				    </div>
                        <!-- 主观题和客观题选择 end -->
       </div>
</div>
<!-- 出题滑块 end -->
        
        
        
<!-- 修改滑块 bg -->
<div class="slug slug_right" id="slug_questionu" style="background-color: white;height:auto; min-height:455px; box-shadow:1px 1px 5px #756b6b; margin-top: 90px;">
     <div class="edit-head clearfix">
         <h3 class="pull-left">编辑出题</h3>
         <div class="edit-btn-box pull-right">
             <input type="button" name="sure-btn"  value="保 存"  onclick="sure_upd_question()" >
             <input type="button" name="cancel-btn" value="取 消"  onclick="remove_question()" >
         </div>
     </div>
    	<div class="edit-content start-question">
                        <!-- 文字题和语音题选择 bg -->
            <div class="list-question-styleOne">
                <div id="wenzi_stu">
                    <p>题干</p>
                    <textarea id="wz_question_contentu" class="textarea-style" placeholder="输入题目内容"></textarea>
                </div>
                <div id="yuyin_stu" class="yuyin-st" style="display:none;">
                     <div class="audio-up clearfix" id="yp_url">
                        <span style="margin-top: -25px;margin-right: 3px;">本地文件</span>
                        <div class="custom-file-box inline-block">
                            <a href="javascript:void(0)">选择文件</a>
                            <span>未选择任何文件</span>
                            <input type="file" class="custom-file" id="st_ypu" name="st_yp" onchange="shitin_au(this.files,$(this))" >
                        </div>
                     </div>
                     <div class="audio-up clearfix">
                         <span id="st_urlu"></span>
                     </div>
                </div>
            </div>
                        <!-- 文字题和语音题选择 end -->
                        
                        <!-- 主观题和客观题选择 bg -->
            <div class="list-question-styleTwo">
               <div id="keguan_stu" class="keguan-st" style="display:block;">
	                  <div>
	                     <span>选项内容</span>
	                     <ul class="clearfix question-option-list">
	                         <li>
	                            <span>A</span>
	                            <textarea id="kg_questionAu" placeholder="选项A"></textarea>
	                         </li>
	                         <li>
	                             <span>B</span>
	                             <textarea id="kg_questionBu" placeholder="选项B"></textarea>
	                         </li>
	                         <li>
	                              <span>C</span>
	                              <textarea id="kg_questionCu" placeholder="选项C"></textarea>
	                         </li>
	                         <li>
	                              <span>D</span>
	                              <textarea id="kg_questionDu" placeholder="选项D"></textarea>
	                         </li>
	                         <li>
	                              <span>E</span>
	                              <textarea id="kg_questionEu" placeholder="选项E"></textarea>
	                         </li>
	                     </ul>
	                  </div>
	                  <div class="true-answer">
	                          <span>正确答案</span>
	                          <div class="custom-select-box">
	                                <select class="form-control" id="kg_question_answeru" style="margin-left: -8px;">
	                                <option value="">正确选项</option>
	                                <option value="A">A</option>
	                                <option value="B">B</option>
	                                <option value="C">C</option>
	                                <option value="D">D</option>
	                                <option value="E">E</option>
	                             </select>
	                          </div>
	                  </div>
	                  <div>
	                      <li>
	                        <span>干 预</span>
	                        <textarea class="textarea-style" placeholder="请输入干预内容"  id="zg_question_remarku"></textarea>
	                    </li>
	                  </div>
                </div>
            </div>
                        <!-- 主观题和客观题选择 end -->
      </div>
</div>
<!-- 修改滑块 end -->
        
        
 <!-- 提醒信息框 bg -->
<div class="prompt-info">
    <h3>提 示</h3>
    <p class="text-center prompt-info-con"></p>
</div>
<!-- 提醒信息框 bg -->
        
        
<script src="${pageContext.request.contextPath}/teacher/js/home.js"></script>
<script type="text/javascript">

/*  导航 */
if(document.getElementById("tltkgl")){
$(".nav-list").children().eq(1).find("a").css({"fontSize":"21px", "color":"#60ac62"});
}  

/*------------------- -------------------  ------------------- 点击选择资源  ------------------- -------------------  -------------------*/
 /* media资源数据 */
function data(){
 	
 	var info_id = $("#info_id").val();
 	var media_type = $("#media_t").val();	
 	var media_level = $("#media_level").val();
 	var media_name = $("#search_name").val();
 	return "&info_id="+info_id+"&media_type="+media_type+"&media_level="+media_level+"&media_name="+media_name
 }

function sele_media(){
	getmedia(1)
}
function getmedia(pageNow){
	
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/media/qgetmedia.action?pageNow='+pageNow,
			data:data(),
			success:function(resultData){
				$("#media_all").html(resultData)
				$(".min").animate({"width":"150px"})
		      $(".slug_left").animate({"width":"68.5%"}) 
		       $("#slug_media").css({"display":"block","width":"62%"}).animate({"right":"0%"},function(){       //slug_right 滑出
		       slug_left_w = $(".slug_left").innerWidth();        //slug_right滑出后获取slug_left的宽度
		      			 })
		       $("#slug_question").hide()
		       $("#slug_questionu").hide()
		       $("#question_re").hide() 
			}
		})  
}

/* 点击播放资源选择  */
function sure_media(media_name,media_id){
	alert(media_name+"----"+media_id)
	$("#m_name").html(media_name)
	$("#m_id").val(media_id)
}


/* ------------------- -------------------  -------------------点击开始出题  -------------------  -------------------  -------------------*/
function star_question(){
	 
	media_id = $("#m_id").val();
	media_name = $("#m_name").html();
	packet_name = $("#packet_name").val();
	packet_type = $("#packet_type").val();
	packet_level = $("#packet_level").val();
	packet_prompt = $("#packet_prompt").val();
	alert(media_id+"--"+media_name +"--"+packet_name +"--"+ packet_type+"--"+ packet_level+"--"+packet_prompt)
	
 	   if(media_name =="选择资源"  ||  packet_name=="" || packet_type=="" || packet_level=="" || packet_prompt==""){
	 		$(".prompt-info-con").text("请选择资源并填写完整信息")
	   	prompt_info()
	   	return;
   		 }   
	
      $("#keguan_st").show()
      $("#kgt").parent().addClass("selected-li-two").siblings().removeClass("selected-li-two");
      $(".min").animate({"width":"150px"})
      $(".slug_left").animate({"width":"68.5%"})
      var slug_media_w = $("#slug_media").innerWidth();
      $("#slug_media").animate({"right": -slug_media_w - 15 + "px"}).css({"display":"none"});
      var slug_questionu_w = $("#slug_questionu").innerWidth();
      $("#slug_questionu").animate({"right": -slug_questionu_w - 15 + "px"}).css({"display":"none"});
      $("#slug_question").css({"display":"block"}).animate({"right":"0%"},function(){       //slug_right 滑出
      slug_left_w = $(".slug_left").innerWidth();        //slug_right滑出后获取slug_left的宽度
                })
}

//点击取消
function remove_question(){
				$(".slug_left").css({"max-width":""})
				$(".min").animate({"width":"240px"})
        $(".slug_left").animate({"width":"98.5%"})
        var slug_right_w = $(".slug_right").innerWidth();
        $(".slug_right").animate({"right": -slug_right_w - 15 + "px"},function(){
        $(this).css({"width":"22%","display":"none"});
        clear()
        });
        
}

//点击选择文字试题或语音试题
 $("#wzst").click(function(){
        $(this).parent().addClass("selected-li-one").siblings().removeClass("selected-li-one");
        $("#yuyin_st").hide()
        $("#wenzi_st").show()
})
$("#yyst").click(function(){
        $(this).parent().addClass("selected-li-one").siblings().removeClass("selected-li-one");
        $("#yuyin_st").show()
        $("#wenzi_st").hide()
}) 

//点击出题确认
var question_num = 0;
function add_question(){
			var formData = new FormData($("#questionyy")[0]); 
			 alert("aaaaaaaa"+formData)
	
        question_num ++; 
        $(".list-question-show-prompt").css("display","none");
        //文字题干
        var wz_question_content=$("#wz_question_content").val()
        //语音题干
        var yy_question_content=$("#st_yp").val();
        
        alert("yy_question_content---"+yy_question_content)
        //客观问题
        var kg_questionA=$("#kg_questionA").val()
        var kg_questionB=$("#kg_questionB").val()
        var kg_questionC=$("#kg_questionC").val()
        var kg_questionD=$("#kg_questionD").val()
        var kg_questionE=$("#kg_questionE").val()
        //客观答案
        var kg_question_answer=$("#kg_question_answer").val()
        //客观干预
        var zg_question_remark=$("#zg_question_remark").val()
        
        alert(wz_question_content+"--"+yy_question_content +"--"+kg_questionA +"--"+kg_questionB +"--"+kg_questionC +"--"+kg_questionD +"--"+ kg_questionE+"--"+kg_question_answer+"---"+zg_question_remark)
        
        //获取试题类型
        var st_type=$("input[name=st_type]:checked").val()+$("input[name=lx_type]:checked").val()
        var r=""
        r+="<div class='qu_bank list-question-detail'>"+
           "<div class='clearfix'>"+
               "<span class='pull-left list-question-num'>第"+question_num+"题</span>"+
               "<div class='pull-right list-question-show-btn'>"+
                "<input type='button' name='cancel-btn' value='编辑' onclick='upd_question($(this))'>"+
                "<input type='button' name='cancel-btn' value='删除' onclick='del_question($(this))'>"+
               "</div>"+
           "</div>"+
           "<div class='list-question-con'>";
           
        if(wz_question_content!=""){
            r+="<div><span>试题题干：</span><span>"+wz_question_content+"</span></div>"
            r+="<div class='hidd'><span>语音题干：</span><span>"+yy_question_content+"</span></div>"
    		}else{
            r+="<div class='hidd'><span>文字题干：</span><span>"+wz_question_content+"</span></div>"
            r+="<div><span>语音题干：</span><span>"+yy_question_content+"</span></div>"
 			   }   
        r+="<div><span>试题内容：</span><span></span></div>"
        r+="<div class='option'><span>A：</span><span>"+kg_questionA+"</span></div>"
        r+="<div class='option'><span>B：</span><span>"+kg_questionB+"</span></div>"
        r+="<div class='option'><span>C：</span><span>"+kg_questionC+"</span></div>"
        r+="<div class='option'><span>D：</span><span>"+kg_questionD+"</span></div>"
        r+="<div class='option'><span>E：</span><span>"+kg_questionE+"</span></div>"
        r+="<div><span>试题答案：</span><span>"+ kg_question_answer+"</span></div>"
        r+="<div><span>题目干预：</span><span>"+zg_question_remark+"</span></div>"
        
        r+="</div></div>"
        $("#question_reg").append(r)
  			clear()
}

/* 清除出题 */
function clear(){
	
	$("#wz_question_content").val("")
	$("#kg_questionA").val("")
	$("#kg_questionB").val("")
	$("#kg_questionC").val("")
	$("#kg_questionD").val("")
	$("#kg_questionE").val("")
	$("#kg_question_answer").val("")
	$("#zg_question_remark").val("")
	$("#info_id").val(0);
	$("#media_t").val("");	
	$("#media_level").val("");
	$("#search_name").val("");
}

/*------------------- -------------------  -------------------  点击修改试题 ------------------- -------------------  -------------------*/
function upd_question(t){
	
	  //文字题干	
	 var wz_question_content=t.parent().parent().next().children().eq(0).children().eq(1).html()
	 //语音题干
	 var yy_question_content=t.parent().parent().next().children().eq(1).children().eq(1).html()
 	
	//试题内容
   var kg_questionA=t.parent().parent().next().children().eq(3).children().eq(1).html()
   var kg_questionB=t.parent().parent().next().children().eq(4).children().eq(1).html()
   var kg_questionC=t.parent().parent().next().children().eq(5).children().eq(1).html()
   var kg_questionD=t.parent().parent().next().children().eq(6).children().eq(1).html()
   var kg_questionE=t.parent().parent().next().children().eq(7).children().eq(1).html()
   
   	//答案
   var kg_question_answer=t.parent().parent().next().children().eq(8).children().eq(1).html()
 	//干预
   var zg_question_remark=t.parent().parent().next().children().eq(9).children().eq(1).html()
   alert(wz_question_content+"--"+kg_questionA +"--"+kg_questionB +"--"+kg_questionC +"--"+kg_questionD +"--"+ kg_questionE+"--"+kg_question_answer+"---"+zg_question_remark)
   
        $("#wz_question_contentu").val(wz_question_content)
        $("#st_ypu").html(yy_question_content)
        $("#kg_questionAu").val(kg_questionA)
        $("#kg_questionBu").val(kg_questionB)
        $("#kg_questionCu").val(kg_questionC)
        $("#kg_questionDu").val(kg_questionD)
        $("#kg_questionEu").val(kg_questionE)
        $("#kg_question_answeru").val(kg_question_answer)
        $("#zg_question_remarku").val(zg_question_remark)
	
      $(".min").animate({"width":"150px"})
      $(".slug_left").animate({"width":"68.5%"})
        var slug_question_w = $("#slug_question").innerWidth();
        $("#slug_question").animate({"right": -slug_question_w - 15 + "px"}).css({"display":"none"});
        $("#slug_questionu").css({"display":"block"}).animate({"right":"0%"},function(){       //slug_right 滑出
        slug_left_w = $(".slug_left").innerWidth();        //slug_right滑出后获取slug_left的宽度
        })
      window.t = t
}

//点击保存修改
function sure_upd_question(){
	
  wz_question_contentu = $("#wz_question_contentu").val()
  st_ypu = $("#st_ypu").val()
  kg_questionAu = $("#kg_questionAu").val()
  kg_questionBu = $("#kg_questionBu").val()
  kg_questionCu = $("#kg_questionCu").val()
  kg_questionDu = $("#kg_questionDu").val()
  kg_questionEu = $("#kg_questionEu").val()
  kg_question_answeru = $("#kg_question_answeru").val()
  zg_question_remarku = $("#zg_question_remarku").val()
  console.log(wz_question_content+"--"+kg_questionA +"--"+kg_questionB +"--"+kg_questionC +"--"+kg_questionD +"--"+ kg_questionE+"--"+kg_question_answer+"---"+zg_question_remark)
	
  //文字题干	
   t.parent().parent().next().children().eq(0).children().eq(1).html(wz_question_contentu)
	 //语音题干
	 t.parent().parent().next().children().eq(1).children().eq(1).html(st_ypu)
 	
	//试题内容
	 t.parent().parent().next().children().eq(3).children().eq(1).html(kg_questionAu)
   t.parent().parent().next().children().eq(4).children().eq(1).html(kg_questionBu)
   t.parent().parent().next().children().eq(5).children().eq(1).html(kg_questionCu)
   t.parent().parent().next().children().eq(6).children().eq(1).html(kg_questionDu)
   t.parent().parent().next().children().eq(7).children().eq(1).html(kg_questionEu)
        
   	//答案
    t.parent().parent().next().children().eq(8).children().eq(1).html(kg_question_answeru)
 	//干预
   t.parent().parent().next().children().eq(9).children().eq(1).html(zg_question_remarku)
   
   
    var slug_questionu_w = $("#slug_questionu").innerWidth();
    $("#slug_questionu").animate({"right": -slug_questionu_w - 15 + "px"}).css({"display":"none"});
    
    $("#slug_question").css({"display":"block"}).animate({"right":"0%"},function(){       //slug_right 滑出
    slug_left_w = $(".slug_left").innerWidth();        //slug_right滑出后获取slug_left的宽度
        })
   clearu()
}

/* 清除修改 */
function clearu(){
	
	$("#wz_question_contentu").val("")
	$("#kg_questionAu").val("")
	$("#kg_questionBu").val("")
	$("#kg_questionCu").val("")
	$("#kg_questionDu").val("")
	$("#kg_questionEu").val("")
	$("#kg_question_answeru").val("")
	$("#zg_question_remarku").val("")
}

/*------------------- -------------------  -------------------  点击删除试题 ------------------- -------------------  -------------------*/

function del_question(t){
	
	 if(confirm( '是否确定删除？ ')==false){
		    return false;
		 }
	
	t.parent().parent().parent().remove();
    if($(".qu_bank").length==0){
        $("#st_qu").val("开始出题").attr("name","sure-btn");
        $(".list-question-show-prompt").css("display","block");
}
}

/*------------------- -------------------  -------------------  点击完成 ------------------- -------------------  -------------------*/
function com_question(){

	media_id = $("#m_id").val();
	media_name = $("#m_name").html();
	packet_name = $("#packet_name").val();
	packet_type = $("#packet_type").val();
	packet_level = $("#packet_level").val();
	packet_prompt = $("#packet_prompt").val();
	info_id = $("#teacher_id").val()
	
if(media_name =="选择资源"  ||  packet_name=="" || packet_type=="" || packet_level=="" || packet_prompt==""){
	 		$(".prompt-info-con").text("请选择资源并填写完整信息")
	   	prompt_info()
	   	return;
  		 }  
	var question=[];
	
	// 包题目 
	var packetarr=[];
	var packetob={};
	
	packetob["info_id"]=info_id
	packetob["media_id"]=media_id
	packetob["packet_name"]=packet_name
	packetob["packet_type"]=packet_type
	packetob["packet_level"]=packet_level
	packetob["packet_prompt"]=packet_prompt
	packetarr.push(packetob)
	question.push(packetarr)
	
	//子题目
	var st=$(".qu_bank")
 	var qu_bank_length = $(".qu_bank").length;
	 if(qu_bank_length > 0){
         for(var i=0;i<st.length;i++){
                 var arr=[]
                 var ob={}
                 var ob1={}
                 					
               if(st[i].children[1].children[0].children[1].innerHTML != ""){
            	   ob["question_type"]="2"
            		 ob["question_name"]=st[i].children[1].children[0].children[1].innerHTML
               }else if(st[i].children[1].children[1].children[1].innerHTML != ""){
            	   ob["question_type"]="1"
              	 ob["question_name"]=st[i].children[1].children[1].children[1].innerHTML
                 				}
                 ob["question_correct"]=st[i].children[1].children[8].children[1].innerHTML
                 ob["question_prompt"]=st[i].children[1].children[9].children[1].innerHTML
                 
                 ob1["A"]=st[i].children[1].children[3].children[1].innerHTML
                 ob1["B"]=st[i].children[1].children[4].children[1].innerHTML
                 ob1["C"]=st[i].children[1].children[5].children[1].innerHTML
                 ob1["D"]=st[i].children[1].children[6].children[1].innerHTML
                 ob1["E"]=st[i].children[1].children[7].children[1].innerHTML
                 
                ob["question_option"]=JSON.stringify(ob1) 
                arr.push(ob)
               /*  arr.push(JSON.stringify(ob1)) */
                question.push(arr)
         }
         
         question=JSON.stringify(question)
         console.log(question)
	}else{
        $(".prompt-info-con").text("请添加试题");
        prompt_info();
		}
	 
	   $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/question/addquestionp.action',
			data:"question="+question,
			dataType:'json',
			success:function(resultData){
				if(resultData=="success"){
					 $(".prompt-info-con").text("添加成功");
				    prompt_info();
				    clearPacket()
				    window.location.reload()
				}else if(resultData=="repeat"){
					alert("添加失败")
				}
				
			}
		}) 
		
		
}

 function clearPacket(){
	$("#packet_name").val("");
	$("#packet_type").val("");
	$("#packet_level").val("");
	$("#packet_prompt").val("");
} 

//提示信息框
function prompt_info(){
      $(".prompt-info").fadeIn(500).delay(800).fadeOut(500);
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
		check();
	  var src = $("#id2").find("img").attr("src");
	  src = src.replace(/\d/,"2");
		$("#id2").find("img").attr("src",src);
		$("#id2").css("backgroundColor","#60ac62").find("p").css("color","#fff");
		$(".min").css({"width":"240px"});
		
}

</script>
</body>
</html>