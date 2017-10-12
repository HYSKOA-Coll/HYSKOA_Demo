<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
              <img alt="" src="img/hide_sidebar_0.png">
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
            <a href="addmedia.jsp">
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
    		<h3>听力资源列表</h3>
    		<div class="con-head-infoSearch pull-right clearfix">
	   				<form action="">
	   			 		<select class="form-control" style="display:inline;margin-right: 10px;">
                     <option>全部资源</option>
                     <option>我的资源</option>
              </select>
              <select class="form-control" style="display:inline;margin-right: 10px;">
                     <option>全r资源</option>
                     <option>我的资源</option>
              </select>
              
	   			 		<input type="text" id="search_name" placeholder="资源名称"  style="margin-right:10px;">
	   			 		 <input type="submit" onclick="load_(1)" name="search-btn" value="查询">
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
						   			<tr>
								      <td>tingli</td>
                      <td>一般</td>
                      <td>一般</td>
                      <td><span>0.6</span><span> MB</span></td>
                      <td>2017-09-07</td>
                      <td class="edit-td">
                        <a href="javascript:void(0)" onclick="detail_media($(this),'55')" title="修改"><img src="img/edit_0.png" alt="修改"></a>
                        <a href="javascript:void(0)" onclick="audplay('20170907Sep091504797660.mp3',$(this))" title="播放"><img src="img/play_0.png" alt="播放"></a>
                        <a href="20170907Sep091504797660.mp3" download="tingli" title="下载"><img src="img/download_0.png" alt="下载"></a>
                        <a href="javascript:void(0)" onclick="media_del('55','20170907Sep091504797660.mp3')" title="删除"><img src="img/delete_0.png" alt="删除"></a>
                      </td>
						   			</tr>
						   </tbody>
  			</table>
  				
    </div>
     <div class="pagin">
     <div class="message">共<i class="blue">1</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
				<ul class="pagination">
				    <li><a href="#"><</a></li>
				    <li class="active"><a href="#">1</a></li>
				    <li class="disabled"><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li><a href="#">></a></li>
				</ul>
     </div>
</div>
</div>
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
</script>

</body>
</html>