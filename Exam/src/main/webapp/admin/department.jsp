<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/manage.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/page.css" rel="stylesheet" type="text/css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>学院管理</title>
<style type="text/css">
th{font-size: 15px;}
.trtitle{height: 40px; text-align: left;}
.trtitle th input{margin-left: 11px;}
#add_tu{
display:none;
}
#delete_s{
display:none;
}
#add_stu{
display:none;
}
</style>
</head>
<body>
	<div class="rightinfo">
                <div class="tools">
                        <ul class="toolbar">
                                <li id="add_click"><span><img src="${pageContext.request.contextPath}/admin/images/t01.png"/></span>添加</li>
                                <li id="delete_click"><span><img src="${pageContext.request.contextPath}/admin/images/t03.png" /></span>删除</li>
                                <li id="search_click"><span><img src="${pageContext.request.contextPath}/admin/images/t04.png" /></span>
                                <a class="pagepre" href="${pageContext.request.contextPath}/getlist.action?pageNow=1" target="rightFrame">刷新</a></li>
                        </ul>
                </div>
        <table class="tablelist">
                <thead>
                        <tr class="trtitle">
                                <th width="50"></th>
                                <th width="50"><i class="sort"><img src="${pageContext.request.contextPath}/admin/images/px.gif" /></i></th>
                                <th>学院/专业</th>
                                <th>专业类型</th>
                                <th>操作</th>
                        </tr>
                </thead>
                <from>
                <tbody id="tblMain">
                  <c:forEach items="${tpb.datas}" var="list" varStatus="vas">
                    <tr style="background-color: #f3f3f3">
                            <td><input type="checkbox" class="cbox" name="del_manager" value="${list.college_id}"/></td>
                            <td>1</td>
                            <td>${list.college_name}</td>
                           	<td></td>
                            <td style="cursor: pointer;">
                            <p class="add_on add_cc" lang="${list.college_id}">添加专业</p>
                            						<%-- <p class="delete_on" onclick="a(${list.college_id})" name="college_id" >删除专业</p> --%></td>
                    </tr>
                    <c:forEach items="${list.majorList}" var="ma">
                    					<tr>
                    					<td></td>
                    					<td></td>
                    						<td>${ma.major_name}</td>
                    						<td></td>
                    						<td><p class="delete_on"  onclick="a(${ma.major_id})" name="major_id" >删除专业</p></td>
                    					</tr>
                    </c:forEach>
                    </c:forEach>
                </tbody>
</table>
 <div class="pagin">
        <div class="message">共<i class="blue">${tpb.totalRows }</i>条记录，当前显示第&nbsp;<i class="blue">${tpb.pageNow}&nbsp;</i>页</div>
         <ul class="paginList">
             <li class="paginItem"><a href="${pageContext.request.contextPath}/getlist.action?pageNow=1" target="rightFrame"><span class="pagepre"> &nbsp;</span></a></li>
             <c:forEach begin="1" end="${tpb.totalPages }" var="page"> 
             <li class="paginItem"><a href="${pageContext.request.contextPath}/getlist.action?pageNow=${page}" target="rightFrame">${page}</a></li>
             </c:forEach>	
             <li class="paginItem"><a href="${pageContext.request.contextPath}/getlist.action?pageNow=${tpb.pageNow+1}" target="rightFrame"><span class="pagenxt" >&nbsp;</span></a></li>
         </ul>
         <br><br><br>
     </div>
</from>
<!-- 添加学院 -->
<div id="add_stu" style="width: 500px;height:200px;background-color: #ECFFFF;position:absolute;left: 25%;top:80px; ">
	<span style="background-color: #2894FF;font-size:15px;color:white;padding:5px;">添加学院</span>
	<a href=""><img id="cencel" src="${pageContext.request.contextPath}/admin/images/close.png" style="margin-left: 475px; margin-top: -25px;"></a><br/><br/>
	<p style="font-size:15px;padding:40px;">
	学院名称*<input id="h" type="text" value="" style="padding:10px;background-color:white;"><br/><br/>
		<input id="hand" type="button" value="确认" style="padding:10px;background-color:white;margin-left:80px;background-color:blue;">
		<input type="button" value="取消" style="padding:10px;background-color:white;background-color:gray; ">
	</p>
</div>
<!-- 弹框 -->
<div class="tip" id="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo"> <span><img src="${pageContext.request.contextPath}/admin/images/ticon.png" /></span>
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
             <span><img src="${pageContext.request.contextPath}/admin/images/ticon.png" /></span>
             <div class="tipright">
                     <p id="ok_tip">确定删除选定数据吗？</p>
             </div>
     </div>
     <div class="tipbtn">
             <input type="button" onclick="delete_sure()" id="delete_btn" class="sure" value="确定" />&nbsp;
             <input type="button" class="cancel" id="delete_cancel" value="取消" />
     </div>
</div>

<!-- 添加专业 -->
<div id="add_tu" style="width: 500px;height:200px;background-color: #ECFFFF;position:absolute;left: 25%;top:80px; ">
	<span style="background-color: #2894FF;font-size:15px;color:white;padding:5px;">添加专业</span>
	<a href=""><img id="cencel" src="${pageContext.request.contextPath}/admin/images/close.png" style="margin-left: 475px; margin-top: -25px;"></a><br/><br/>
	<p style="font-size:15px;padding:40px;">
	<input id="input" type="hidden" name="college_id">
	专业名*<input id="hu" type="text" value="" style="padding:10px;background-color:white;"><br/><br/>
			<input id="hd" type="button" value="确认" style="padding:10px;background-color:white;margin-left:80px;background-color:blue;">
		<input type="button" value="取消" style="padding:10px;background-color:white;background-color:gray; ">
	</p>
</div>
<!-- 删除专业 -->
<div id="delete_s" style="display:none; width: 500px;height:200px;background-color: #ECFFFF;position:absolute;left: 25%;top:80px; ">
	<span style="background-color: #2894FF;font-size:15px;color:white;padding:5px;">删除专业</span>
	<a href=""><img id="cencel" src="${pageContext.request.contextPath}/admin/images/close.png" style="margin-left: 475px; margin-top: -25px;"></a><br/><br/>
	<p style="font-size:15px;padding:40px;">
	<p style="text-align:center;font-size:30px;margin-top:-50px;"><b>是否删除</b></p>
	<input id="han" type="button" value="确认" style="padding:10px;background-color:white;margin-left:200px;background-color:blue;">
		<input type="button" value="取消"  onclick="del_cancel()" style="padding:10px;background-color:white;background-color:gray; ">
</div>
</body>
<script type="text/javascript">
//添加学院
$(document).ready(function(){
	$("#add_click").click(function(){
		$("#add_stu").css("display","block");
		
	});
});

/* 取消删除按钮  */
function del_cancel(){
	
	$("#delete_s").css("display","");
}

$("#hand").click(function(){
	college_name = $("#h").val()
	alert('college_name-----'+college_name)
	
	 $.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/addcollege.action',
		data:"college_name="+college_name,
		success:function(resultData){
			//如果请求成功,会执行该函数内容，resultData是响应数据
			if(resultData == "success"){
  				 $("#delete_tip").hide();
                $("#bg1").hide();
                $("#tip_ts").html("操作成功");
                tip(); 
                $("#add_stu").css("display","");
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
//添加专业
$(document).ready(function(){
	$(".add_on").click(function(){
		$("#add_tu").css("display","block");
		
	});
});
$
$("#hd").click(function(){
	major_name= $("#hu").val();
	college_id=$("#input").val();
	alert('major_name-----'+major_name);
	alert('college_id-----'+college_id);
	 $.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/addmajor.action',
		data:"major_name="+major_name+"&college_id="+college_id,
		success:function(resultData){
			//如果请求成功,会执行该函数内容，resultData是响应数据
			if(resultData == "success"){
				alert("aaaaaaaaaa")
  				 $("#delete_tip").hide();
                $("#bg1").hide();
                $("#tip_ts").html("操作成功");
                tip(); 
                $("#add_tu").css("display","");
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
$(document).ready(function(){
	$(".delete_on").click(function(){
		$("#delete_s").css("display","block");
		
	});
});
//删除专业
function a(major_id){
$("#han").click(function(){

	alert('major_id-----'+major_id);
	 $.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/deletemajor.action',
		data:"major_id="+major_id,
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
$(document).ready(function(){
	$(".add_cc").click(function(){
		var college_id=$(this).attr("lang");
		$("#input").val(college_id);
		alert(college_id);
	});
});
/* $(document).ready(function(){
	$("#cencel").click(function(){
		$("#add_stu").css("display","none");
	});
});
 */
/* 批量删除 */

$("#delete_click").click(function(){
		var checkedNum = $(".cbox:checked").length
    if (checkedNum <= 0){
         $("#tip_ts").html("尚未选定数据");
         tip();
         return;
    }else{
		       $("#bg1").show();
		       $("#delete_tip").fadeIn(200);
    }
})

function delete_sure(){
		//获取选中box的值，返回一个字符串
		var college_id = []
		$(".cbox:checked").each(function(){
			college_id.push($(this).val())
		}) 		
		console.log(college_id)
		var college_ids=college_id.join(",");
		
   $("#bg1").hide();
   $("#delete_tip").fadeOut(200);

   alert("college_ids type---"+typeof college_ids)
   console.log(college_ids)
	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/deletecollege.action',
		data:{college_ids:college_ids},
		success:function(resultData){
			//如果请求成功,会执行该函数内容，resultData是响应数据
  			if(resultData == "success"){
  				$("#delete_tip").hide();
                $("#bg1").hide();
                $("#tip_ts").html("操作成功");
                tip();
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
}
/* 提示函数 */
function tip(){
        $("#tip").fadeIn(500)
        $("#tip").delay(1000)
        $("#tip").fadeOut(500)
}

</script>
</html>