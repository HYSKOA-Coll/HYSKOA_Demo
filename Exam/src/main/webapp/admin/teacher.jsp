<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>老师管理</title>
<!-- bootstrap -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/manage.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/page.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.rightinfo{width: 96%;margin-left: 1.5%; margin-top: 2%}
.pull-right clearfix list-inline{margin-top: -30px;}
#search_teacher_info{border: 1px solid #c8cccf; width: 200px; height: 35px; font-size: 14px;}
#select_teacher{border: 1px solid #2a8cea; width: 98px; height: 35px; background:#2a8cea;color: white;}
tr{height: 40px;}
td,th{text-align: center; font-size: 14px;}
.table_thead{background-color: #EFEFF0}

</style>
</head>
<body>
<div id="bg1" class="bg1"></div>
	<div class="rightinfo">
        <div class="tools">
            <ul class="toolbar">
               <li id="add_click"><span><img src="${pageContext.request.contextPath}/admin/images/t01.png"/></span>添加</li>
               <li id="edit_click"><span><img src="${pageContext.request.contextPath}/admin/images/t02.png" /></span>修改</li>
               <li id="delete_click"><span><img src="${pageContext.request.contextPath}/admin/images/t03.png" /></span>删除</li>
               <li id="search_click"><a href="${pageContext.request.contextPath}/teacher/getteacher.action?pageNow=1"><span><img src="${pageContext.request.contextPath}/admin/images/t04.png" /></span>刷新</a></li>
         	 </ul>
           <ul class="pull-right clearfix list-inline" style="margin-right: 100px;">
           
               <li>
               <form action="${pageContext.request.contextPath}/teacher/getteacher.action" method="get">
                  <input type="text" name="name_num" placeholder="&nbsp;&nbsp;输入教师姓名/工号查询" id="search_teacher_info">
                  <input type="hidden" name="pageNow" value="1"/>
                  <input type="submit" value="查询"  class="select_btn" id="select_teacher"">
                </form>
               </li>

            </ul>
        </div>
        <form action="" method="get"></form>
<table class="table table-bordered table-striped table-hover" style="margin-top: 20px;">
  <thead>
    <tr class="table_thead">
     <td width="20px;"><input type="checkbox" name="del_selected" onclick="checkall(this)" value="56"></td>
      <th>序号</th>
      <th>工号</th>
      <th>姓名</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${tpb.datas }" var="list" varStatus="vas">
    <tr>
   	  <input id="ud_id" type="hidden" value="${list.info_id}">
      <td width="20px;"><input class="cbox" type="checkbox" name="del_selected" value="${list.info_id }"></td>
      <td>${vas.count+tpb.start}</td>
      <td class="info_num">${list.info_num}</td>
      <td class="info_name">${list.info_name}</td>
  	  <td>
        <a href="javascript:;" onclick="teacher_up(${list.info_id},${list.info_num},'${list.info_name}')">修改</a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:;" onclick="del_teacher(${list.info_id})" >删除</a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:;" onclick="alertteacher_pwd(${list.info_id})">重置密码</a>
     </td>      
    </tr>
 </c:forEach>
  </tbody>
</table>
</div>
     <div class="pagin">
        <div class="message">共<i class="blue">${tpb.totalRows }</i>条记录，当前显示第&nbsp;<i class="blue">${tpb.pageNow}&nbsp;</i>页</div>
         <ul class="paginList">
             <li class="paginItem"><a href="${pageContext.request.contextPath}/teacher/getteacher.action?pageNow=1" target="rightFrame"><span class="pagepre"> &nbsp;</span></a></li>
             <c:forEach begin="1" end="${tpb.totalPages }" var="page"> 
             <li class="paginItem"><a href="${pageContext.request.contextPath}/teacher/getteacher.action?pageNow=${page}" target="rightFrame">${page}</a></li>
             </c:forEach>	
             <li class="paginItem"><a href="${pageContext.request.contextPath}/teacher/getteacher.action?pageNow=${tpb.pageNow+1}" target="rightFrame"><span class="pagenxt" >&nbsp;</span></a></li>
         </ul>
         <br><br><br>
     </div>
<!-- 添加 -->
<div class="tip" id="add_teacher" style="width: 550px;">
  <div class="tiptop">
      <span>添加教师信息</span><a></a>
  </div>
  <div class="tipinfo">
         <div class="clearfix" id="choice_button" >
             <p>
               <input id="write_in" type="button" value="手动添加" class="btn btn-default">
               <input id="import_in" type="button" value="批量导入" class="btn btn-default">
             </p>
         </div>
                <!-- 手动添加 -->
         <div id="write_teacher_div" style="display:none;margin-top: 20px;">
             <div class="clearfix">
                <span class="pull-left">工号*</span>
                <p><input id="id" placeholder="教师工号" type="text"><font class="err"></font></p>
             </div>
             <div class="clearfix">
                 <span class="pull-left">姓名*</span>
                 <p><input id="name" type="text"><font class="err"></font></p>
             </div>
             <div class="tipbtns">
                <input type="button" onclick="add_sure()" class="sure" value="确 定" />&nbsp;
                <input type="button" class="cancel" id="add_write_cancel" value="返 回" />
             </div>
         </div>
                <!-- 批量导入 -->
          <div id="import_teacher_div" style="display: none;margin-top: 20px;">
            <form id="excel" method="post" enctype="multipart/form-data">
             <div class="add_info">
                 <ul>
                   <li><i><a href="javascript:void(0)" onclick="download_model()" class="text-primary">去下载excel模板</a></i></li>
                   <li><input type="file" id="myExcel" name="upload" accept="application/vnd.ms-excel"></li>
                 </ul>
             </div>
             <div class="tipbtns">
                 <input type="button" id="addBtn" class="sure" value="导 入" />&nbsp;
                 <input type="button" class="cancel" id="add_import_cancel" value="返 回" />
                 
             </div>
             </form>
          </div>
     </div>
</div>
       
	
<!-- 修改 -->
<div class="tip" id="edit_teacher" style="width: 550px;">
        <div class="tiptop">
                <span>修改教师信息</span><a></a>
        </div>
        <div class="tipinfo">
                <div class="clearfix">
                        <span class="pull-left">工号*</span>
                        <p>
                          <input id="info_num" placeholder="教师工号" type="text">
                          <input id="info_id" type="hidden">
                          <input id="used_info_num" type="hidden">
                        </p>
                </div>
                <div class="clearfix">
                        <span class="pull-left">姓名*</span>
                        <p>
                          <input id="info_name" type="text">
                        </p>
                </div>
        </div>
        <div class="tipbtn">
           <input type="button" class="sure" value="确 定"  onclick="edit_sure()"/>&nbsp; 
           <input type="button" class="cancel" onclick="edit_cancel()" value="取消" />
        </div>
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
<script type="text/javascript">

/*  关闭按钮  */
$(".tiptop a").click(function(){
    clear_reset();
});
function clear_reset(){
    clear_add();  
    $("#bg1").hide();
		$(".tip").fadeOut(200);
}

/* 返回按钮  */
$("#add_write_cancel").click(function(){
        $("#write_teacher_div").hide();
        $("#choice_button").show();
})

/*  添加按钮  */
$("#add_click").click(function(){
	$("#add_teacher").show();
	 $("#bg1").show();
	
});

/* 手动写入 */
$("#write_in").click(function(){
        $("#write_teacher_div").show();
        $("#choice_button").hide();
})
function clear_add(){
    $("#id").val("");
    $("#name").val("");
    $("#id").next("font").remove();
    $("#name").next("font").remove();
}
/* excel导入 */
$("#import_in").click(function(){
        $("#import_teacher_div").show();
        $("#choice_button").hide();
})
$("#add_import_cancel").click(function(){
        $("#import_teacher_div").hide();
        $("#choice_button").show();
})

/* 手动添加 */
function add_sure(){
	
	var info_num = $("#id").val().trim();
	var info_name = $("#name").val().trim();
	
	if(info_num==null || info_num==""){
		$("#id").next().html('请输入工号');
		return;
	};
	if(info_name==null || info_name=="" ){
		$("#name").next().html('请输入姓名');
		return;
	};
	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/teacher/addteacher.action',
		data:"info_num="+info_num+"&info_name="+info_name,
		success:function(resultData){
			//如果请求成功,会执行该函数内容，resultData是响应数据
  			if(resultData == "success"){
  			 $("#add_teacher").hide();
				 $("#bg1").hide();
				 clear_add()
         $("#tip_ts").html("操作成功");
         tip();
         setTimeout(function(){
             window.location.reload();
					},800)
			}else if(resultData == "repeat"){
				$("#tip_ts").html("操作失败");
        tip();
			}
		}
	});
}
/*  excel添加 */
$("#addBtn").click(function(){
	 $("#myExcel").next('font').remove();
	 if($("#myExcel").val()=="" || $("#myExcel").val()==null){
	     $("#myExcel").after('<font class="err" > 请选择excel文件 </font>');
	     return false;
	    }
   if($("#myExcel").val().indexOf(".xls")<0 && $("#myExcel").val().indexOf(".xlsx")<0){
       $("#tip_ts").html("请选择正确的文件格式！");
       tip();
       return false;
        }
   $("#add_student_div").hide();
   
   var formData = new FormData($("#excel")[0]); 
	 alert("aaaaaaaa"+formData)
	 $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/teacher/addteachers.action',
			 data: formData,  
		   async: false,  
	     cache: false,  
	     contentType: false,  
	     processData: false,   
		   success:function(resultData){
          $("#bg1").hide();
          $("#tip").hide();
          $("#add_teacher").hide();
          $("#tip_ts").html("导入成功！");
          tip();
          setTimeout(function(){
			    window.location.reload();},1000)
			}
		}) 
})

/* 修改 */
$("#edit_click").click(function(){
		var checkedNum = $(".cbox:checked").length
        if (checkedNum <= 0){
                $("#tip_ts").html("尚未选定修改数据！");
                tip();
                return;
        }
        if (checkedNum > 1){
                $("#tip_ts").html("请选定一条数据进行修改！");
                tip();
                return;
        }
			//找到多选框所处的行
			var tr = $(".cbox:checked").parents();
			console.log(tr);
			var info_num = tr.children("td.info_num").html();
			var info_name = tr.children("td.info_name").html();
			var info_id = $("#ud_id").val();
			
			$("#info_num").val(info_num);
  		$("#info_name").val(info_name);
  		$("#info_id").val(info_id);
  			
  		$("#bg1").show();
      $("#edit_teacher").show();
        });
        
  function teacher_up(info_id,info_num,info_name){
		
			$("#info_num").val(info_num);
  		$("#info_name").val(info_name);
  		$("#used_info_num").val(info_num);
  		$("#info_id").val(info_id);
  		$("#bg1").show();
      $("#edit_teacher").show();
      
      
		alert(info_num+"------"+info_name+"--------"+info_id)
 }        
        
        
function edit_sure(){
	
 	var info_num = $("#info_num").val().trim();
	var info_name = $("#info_name").val().trim();
	var info_id = $("#info_id").val().trim();
	var used_info_num = $("#used_info_num").val().trim();
	alert(info_num+"------"+info_name+"--------"+info_id)
	//提交时判断输入框是否为空 ， 为空则提示必填
	if(info_num==null || info_num==""){
		$("#info_num").after("<font class='err'>请输入工号</font>");
		return;
	};
	if(info_name==null || info_name=="" ){
		$("#info_name").after("<font class='err'>请输入姓名</font>");
		return;
	}; 
	
	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/teacher/editteacher.action',
		data:"info_num="+info_num+"&info_name="+info_name+"&info_id="+info_id+"&used_info_num="+used_info_num,
		success:function(resultData){
			//如果请求成功,会执行该函数内容，resultData是响应数据
  			if(resultData == "success"){
  				 $("#tip_ts").html("操作成功");
           tip();
           setTimeout(function(){
           window.location.reload();
         					  },1000)
           $("#edit_teacher").hide();
			}else if(resultData == "repeat"){
				$("#tip_ts").html("工号已存在");
        tip();
			}else if(resultData == "fail"){
				$("#tip_ts").html("操作失败");
		    tip();
			}
		}
	}); 
}
        
/* 修改取消  */
function edit_cancel(){
        $("#edit_teacher").hide();
        $("#bg1").hide();
}

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
		var infoNums = []
		$(".cbox:checked").each(function(){
			infoNums.push($(this).val())
		}) 		
		console.log(infoNums)
		var info_ids=infoNums.join(",");
		
   $("#bg1").hide();
   $("#delete_tip").fadeOut(200);

   alert("info_ids type---"+typeof info_ids)
   console.log(info_ids)
	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/teacher/delteachers.action',
		data:{info_ids:info_ids},
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

/*  删除 */
 function del_teacher(info_id){
   $("#bg1").show();
   $("#delete_tip").fadeIn(200);
   
   $("#delete_btn").click(function(){
   
   $.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/teacher/delteacher.action',
		data:"info_id="+info_id,
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
   });
} 



/* 删除取消 */
$("#delete_cancel").click(function(){
    $("#bg1").hide();
$("#delete_tip").fadeOut(200);
})


/* 重置密码 */

function alertteacher_pwd(info_id){
	 $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/teacher/alertteacher_pwd.action',
			data:"info_id="+info_id,
			success:function(resultData){
				//如果请求成功,会执行该函数内容，resultData是响应数据
	 			if(resultData == "success"){
			 				$("#tip_ts").html("操作成功");
		          tip();
		          setTimeout(function(){
		          window.location.reload();}
		          ,1000)
				}else if(resultData == "repeat"){
						   $("#tip_ts").html("操作失败");
	             tip();
				}
			}
		
		});
	
}
/*********************************全部选择和全部取消功能*************************************/

//全部选择和全部取消功能
function checkall(node){
	console.log(node)
	var status = node.checked;
	console.log(status) 
	var cboxElems = document.getElementsByClassName("cbox");
	console.log(cboxElems)
	
	if(status){
		for(var i = 0;i<cboxElems.length;i++){
			cboxElems.item(i).checked = true
		}
	}else{
		for(var i = 0;i<cboxElems.length;i++){
			cboxElems.item(i).checked = false
	}
}
}

/*********************************聚集功能*************************************/

//监听添加对话框中输入框的聚焦事件
$("#id").focus(function(){
$(this).next().html('');
});

$("#name").focus(function(){
$(this).next().html('');
})

/* 提示函数 */
function tip(){
        $("#tip").fadeIn(500)
        $("#tip").delay(1000)
        $("#tip").fadeOut(500)
}


</script>
</body>
</html>