<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生管理</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/page.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/manage.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.rightinfo{width: 96%;margin-left: 1.5%; margin-top: 2%}
.pull-right{margin-top: 10px; margin-bottom: 16px; margin-right: 90px;}
#search_student_info{border: 1px solid #c8cccf; width: 200px; height: 35px; font-size: 14px;}
#select_student{border: 1px solid #2a8cea; width: 98px; height: 35px; background:#2a8cea;color: white;}
select{border:1px solid #fff; appearance:none;-moz-appearance:none; -webkit-appearance:none; -ms-appearance:none; padding: 5px 10px 5px 5px;
		background-color:#fff;}
.form-control{width: 150px; height:38px; background: url("${pageContext.request.contextPath}/admin/images/arrow.png") no-repeat scroll right center transparent;}
tr{height: 40px;}
td,th{text-align: center; font-size: 14px;}
.table_thead{background-color: #EFEFF0}

 #stu{
		width: 500px;
		background-color: #ECFFFF;
	}

#stu form{
		border:1px solid #ECFFFF;	
		padding:50px;
	}
	
#stu select{
		border:1px solid gray;
		width:40%;
		height: 30px;
		background-color: white;
	}
	
#stu input{
		margin-left: 2%;
		border:1px solid gray;
				
	}
#stu .input{
		border:1px solid gray;
		width:40%;
		height: 30px;
	}
#stu label{
	font-size:15px;
} 
#stu li{
	margin-top: 10px;
}
#import_teacher_div li{
	margin-left: 20%;
	margin-top: 10px;
}


#edit_teacher form{
		border:1px solid #ECFFFF;	
		padding:50px;
	}
	
#edit_teacher select{
		border:1px solid gray;
		width:40%;
		height: 30px;
		background-color: white;
	}
	
#edit_teacher input{
		margin-left: 2%;
		border:1px solid gray;
				
	}
#edit_teacher .input{
		border:1px solid gray;
		width:40%;
		height: 30px;
	}
#edit_teacher label{
	font-size:15px;
} 
#edit_teacher li{
	margin-top: 10px;
}
</style>
</head>
<body>
<div class="rightinfo">
        <div class="tools">
            <ul class="toolbar">
               <li id="add_click"><span><img src="${pageContext.request.contextPath}/admin/images/t01.png"/></span>添加</li>
               <li id="edit_click"><span><img src="${pageContext.request.contextPath}/admin/images/t02.png" /></span>修改</li>
               <li id="delete_click"><span><img src="${pageContext.request.contextPath}/admin/images/t03.png" /></span>删除</li>
               <li id="search_click"><span><img src="${pageContext.request.contextPath}/admin/images/t04.png" /></span>刷新</li>
         	 </ul><br/>
         <form action="${pageContext.request.contextPath}/getStudent.action" method="post">
           <ul class="pull-right clearfix list-inline">
               <li>
                  <select name="college_id" class="form-control a1"  id="department_id_search">
                     <option class="b1" value="0">--请选择学院--</option>
                     		<!-- <option value="8">地质学院</option>
                     		<option value="9">商学院</option> -->
                  </select>
               </li>
               <li>
                  <select name="major_id" class="form-control a2" id="major_id_search">
                     	<option class="b2" value="0">--请选择专业--</option>
                  </select>
               </li>
               <li>
                  <select name="clazz_id" class="form-control a3" id="class_id_search">
                          <option class="b3" value="0">--请选择班级--</option>
             		</select>                                       
               </li>
               <li>
                       <input name="nameOrnumber" type="text" value="" placeholder="&nbsp;&nbsp;输入学生姓名/学号查询" id="search_student_info">
               </li>
               <li>
                       <input type="submit" value="查询"  class="select_btn" id="select_student">
               </li>	
         </ul>
        </form>
        </div>
   
<table class="table table-bordered table-stretStudent--etStudent--iped table-hover" style="margin-top: 20px;">
  <thead>
    <tr class="table_thead">
     <td width="20px;"><input type="checkbox" name="del_selected" onClick=checkall(this)></td>
      <th>序号</th>
      <th>学号</th>
      <th>姓名</th>
      <th>性别</th>
      <th>班级</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>

  <c:forEach items="${pageBean.datas}" var="list" varStatus="vas">
  
    <tr>
     <td width="20px;"><input id="info_num" class="cbox" type="checkbox" name="del_selected" value="${list.info_id}"></td>
      <td>${vas.count+pageBean.start}</td>
      <td class="info_num">${list.info_num}</td>
      <td class="info_name">${list.info_name}</td>
      <td class="info_gender">${list.info_gender}</td>
      <td class="clazz_name">${list.clazz_name}</td>
  	  <td>
  	  	<input id="h" type="hidden" value="${list.info_id}">
  	  	<input class="college_name" type="hidden" value="${list.college_name}"></input>
  	  	<input class="major_name" type="hidden" value="${list.major_name}"></input>
        <a href="javascript:void(0)" onclick="detail(${list.info_num})" class="edit_click">修改</a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0)" onclick="del(${list.info_id})">删除</a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0)" onclick="alterpwd(${list.info_num})">重置密码</a>
     </td>
    </tr>
    </c:forEach>
  </tbody>
</table>
<div class="pagin">
<div class="message">共<i class="bgetStudentlue">${pageBean.totalRows}</i>条记录，当前显示第&nbsp;<i class="blue">${pageBean.pageNow}&nbsp;</i>页</div>
<ul class="paginList">
             <li class="paginItem" onclick="javascript:void(0)"><a href="${pageContext.request.contextPath}/getStudent.action?pageNow=1&${data}"><span class="pagepre">< </span></a></li>
             <li class="paginItem current"><a href="${pageContext.request.contextPath}/getStudent.action?pageNow=${pageNow}&${data}" onclick="_load_(1)">${pageNow}</a></li>
             <li class="paginItem" onclick="_load_(2)"><a href="${pageContext.request.contextPath}/getStudent.action?pageNow=${pageNow+1}&${data}"><span class="pagenxt"> > </span></a></li>
         </ul>
</div>
<!-- 添加学生信息 -->
<div id="add_stu" style="display: none; width: 500px;height:200px;background-color: #ECFFFF;position:absolute;left: 25%;top:80px; ">
	<span style="background-color: #2894FF;font-size:15px;color:white;padding:5px;">添加学生信息</span>
	<a href=""><img id="cencel" src="${pageContext.request.contextPath}/admin/images/close.png" style="margin-left: 475px; margin-top: -25px;"></a><br/><br/>
	<p style="font-size:15px;padding:40px;">
		<input id="hand" type="button" value="手动导入" style="padding:10px;background-color:white;">
		<input id="auto" type="button" value="批量导入" style="padding:10px;background-color:whiasdte;">
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

<!-- 手动添加 -->
<div id="stu" style="position:absolute;left: 25%;top:80px;display: none;">
	<span style="background-color: #2894FF;font-size:15px;color:white;padding:5px;">添加学生信息</span>
	<a href=""><img class="cencel" src="${pageContext.request.contextPath}/admin/images/close.png" style="margin-left: 475px; margin-top: -25px;"></a><br/><br/>
		<%-- action="${pageContext.request.contextPath}/addstu.action" --%>
		<form method="post">
			<ul>
				<li>
					<label>学院*</label>
					<select class="a1" id="add_college">
						<option class="b1">请选择学院</option>
						<!-- <option>地质学院</option> -->
					</select>
				</li>
				<li>
					<label>专业*</label>
					<select class="a2" id="add_major">
						<option class="b2">请选择专业</option>
					</select>
				</li>
				<li>
					<label>班级*</label>
					<select name="clazz_id" class="a3" id="add_class">
						<option class="b3">请选择班级</option>
					</select>
				</li>
			<li><label>学号*</label><input id="add_num" class="input" type="text" name="info_num" placeholder="学生学号"></li>
			<li><label>姓名*</label><input id="add_name" class="input" type="text" name="info_name"></li>
			<li><label>性别*</label><input id="add_gender" class="gender" type="radio" name="info_gender" value="男">男<input class="gender" type="radio"name="info_gender" value="女">女</li>
			</ul>
			<input class="btu" id="ture" onclick="add_ture()" type="button" value="确定" style="background-color: #2894FF;color:white;border-radius:11%;width:50px;height:30px;">
			<input class="cencel" type="button" value="返回" style="width:50px;height:30px;">
		</form>
	</div>
	
	
	 <!-- 批量导入 -->
          <div id="import_student_div" style="position:absolute;left: 25%;top:80px;display: none;background-color:#ECFFFF; ">
          		<span style="background-color: #2894FF;font-size:15px;coform-controllor:white;padding:5px;">添加学生信息</span>
					<a href=""><img class="cencel" src="${pageContext.request.contextPath}/admin/images/close.png" style="margin-left: 475px; margin-top: -25px;"></a><br/><br/>
             <form action="${pageContext.request.contextPath}/Excel.action" enctype=multipart/form-data method="post">
             <div class="add_info">
                 <ul>
						<li><i><a href="javascript:void(0)" onclick="download_model()" class="text-primary">去下载excel模板</a></i></li>
               	<li>
                  	<select class="form-control a1" id="department_id_search" >
                   	  <option class="b1">--请选择学院--</option>
                    	 <!-- <option value="7">人文学院</option>
                     	<option value="8">地质学院</option>
                    	 <option value="9">商学院</option> -->
                  	</select>
              	 	</li>
              	 	<li>
                  	<select class="form-control a2" id="major_id_search" onchange="javascript:changemajor(this.value,'class_id');">
                          <option class="b2">--请选择专业--</option>
                 		</select>
              	 	</li>
              		<li>
                 		<select class="form-control a3" id="class_id_search" name="clazz_id">
                          <option class="b3">--请选择班级--</option>
                 		</select>                                       
              	 	</li>
            	 	<li><input type="file" id="myExcel" name="upload" accept="application/vnd.ms-excel"></li>
               </ul>
             </div>
             <div class="tipbtns">
                 <input type="submit" id="import_student" class="sure" value="导 入" style="width:50px;height:30px;margin-left: 20%;"/>&nbsp;
                 <input type="button" class="cancel" id="add_import_cancel" value="返 回" style="width:50px;height:30px;"/>
             </div>
             </form>
          </div>
          
          
          
			<div id="del" style="display: none; width: 500px;height:200px;background-color: #ECFFFF;position:absolute;left: 25%;top:80px; ">
				<span style="background-color: #2894FF;font-size:15px;color:white;padding:5px;">提示信息</span>
				<a href=""><img class="cencel" src="${pageContext.request.contextPath}/admin/images/close.png" style="margin-left: 475px; margin-top: -25px;"></a><br/><br/>
				<p style="font-size:15px;padding:40px;">
					<input id="del_sure" type="button" value="确认" style="padding:10px;background-color:white;">
					<input id="false" type="button" value="取消" style="padding:10px;background-color:white;">
				</p>
			</div>
			
			
			
			<!-- 修改 -->
<div class="tip" id="edit_teacher" style="width: 550px;">
        <div class="tiptop">
                <span>修改教师信息</span><a></a>
        </div>
         <%-- action="${pageContext.request.contextPath}/update.action"  --%>
<form method="post">
			<ul>
				<li>
					<label>学院*</label>
					<select class="a1" >
						<option class="b1" id="college_name1">--请选择学院--</option>
						<!-- <option>地质学院</option> -->
					</select>
				</li>
				<li>
					<label>专业*</label>
					<select class="a2">
						<option class="b2" id="major_name1">--请选择专业--</option>
					</select>
				</li>
				<li>
					<label>班级*</label>
					<select name="clazz_id" class="a3">
						<option class="b3" id="clazz_name1">--请选择班级--</option>
					</select>
				</li>
				<input type="hidden" id="class_id" />
				<input type="hidden" id="info_id" />
			<li><label>学号*</label><input class="input" id="info_num1" type="text" name="info_num" placeholder="学生学号"></li>
			<li><label>姓名*</label><input class="input" id="info_name1" type="text" name="info_name"></li>
			<li><label>性别*</label><input class="input" id="info_gender" type="text" name="info_gender"></li>
			
			<!-- <li><label>性别*</label><input class="gender info_gender" type="radio" name="info_gender" value="男" checked="checked">男
			<input class="gender info_gender" type="radio" name="info_gender" value="女">女</li> -->
			</ul>
			<input class="btu" id="ture" onclick="edit_ture()" type="button" value="确定" style="background-color: #2894FF;color:white;border-radius:11%;width:50px;height:30px;">
			<input class="cencel" type="button" value="返回" style="width:50px;height:30px;">
			
		</form>
<!--         <div class="tipbtn">
           <input type="button" class="sure" value="确 定"  onclick="edit_sure()"/>&nbsp; 
           <input type="button" class="cancel" onclick="edit_cancel()" vavaluelue="取消" />
        </div> -->
</div>
</div>
</body>
<script type="text/javascript">

/*  关闭按钮  */
$(".tiptop a").click(function(){
	$(".tip").fadeOut(200);
});

$(document).ready(function(){
	$("#add_click").click(function(){
		$("#add_stu").css("display","block");
	});
});

$(document).ready(function(){
	$("#add_import_cancel").click(function(){
		$("#import_student_div").css("display","none");
	});
});

$(document).ready(function(){
	$(".cencel").click(function(){
		$("#add_stu").css("display","none");
		$("#stu").css("display","none");
		$("#import_teacher_div").css("display","none");
		$("#edit_teacher").css("display","none");
		
	});
});

$(document).ready(function(){
	$(".edit_click").click(function(){
		$("#edit_teacher").css("display","block");
	});
});
//刷新页面
$(document).ready(function(){
	$("#search_click").click(function(){
		location.reload();
	});
});
//------------增加一条数据------------------
//查询学院
function getCollege(){
	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/getColl.action',
		success:function(resultData){
			var data = resultData;
			for(var coll in data){
				 var t = $("<option></option>");
				 t.text(data[coll].college_name)
				 t.val(data[coll].college_id)
				 $(".b1").after(t);  
			}
		}
		/* console.log("data--"+data); */
	})
}

//查询专业
$(document).ready(function (){
					$("select.a1").change(function(){
					     var college_id = $(this).val();
						$.ajax({
							type:'POST',
							url:'${pageContext.request.contextPath}/getMaj.action?college_id='+college_id,
							success:function(resultData){
								var data = resultData;
									if(data == null){
										$(".aa").remove();
										return;
									}else{
										$(".aa").remove();
										for(var o in data){
									      var t = $("<option></option>");
									      t.text(data[o].major_name)
									      t.val(data[o].major_id)
									       t.attr("class","aa")
									      	$(".b2").after(t)
											} 
									}
								}
							})
					})
				   });

//查询班级
		$(document).ready(function (){
							$("select.a2").change(function(){
							     var major_id = $(this).val();
								$.ajax({
									type:'POST',
									url:'${pageContext.request.contextPath}/getCla.action?major_id='+major_id,
									success:function(resultData){
										$(".aaa").remove();
										var data = resultData;
											for(var o in data){
											      var t = $("<option></option>");
											      t.text(data[o].clazz_name)
											      t.val(data[o].clazz_id)
											      t.attr("class","aaa")
											      	$(".b3").after(t)
													} 
										}
									})
							})
						   });


//批量导入
$(document).ready(function(){
	$("#import_student").click(function(){
		$("select.a3").change(function(){
		var clazz_id = $(this).val(); 
		
		if(clazz_id==0 || info_id=="" ||clazz_id==null){
			$("#add_class").after("<font class='err'>请选择班级</font>");
			return;
		};
		
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/Excel.action?clazz_id='+clazz_id,
			success:function(resultData){	
			if(resultData == "success"){
				
				setTimeout(function(){
		               window.location.reload();
		              					},1000)
			}else if(resultData == "repeat"){
				alert("已存在的学号");
			}
			}
		})
		
	})
}) 
}) 


$(document).ready(function(){
	$("#hand").click(function(){
		$("#add_stu").css("display","none");
		$("#stu").css("display","block");
		
		})
});

$(document).ready(function(){
	$("#auto").click(function(){
		$("#add_stu").css("display","none");
		$("#import_student_div").css("display","block");
		
	});
});



$(document).ready(function(){
	$("#false").click(function(){
		$("#del").css("display","none");
	});
});



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

/* ********************删除一条数据*************************************/
function del(info_id){
	$("#del").css("display","block");
	
	   $("#del_sure").click(function(){
	   
	   $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/delStudent.action',
			data:"info_id="+info_id,
			success:function(resultData){
				//如果请求成功,会执行该函数内容，resultData是响应数据
	 			if(resultData == "success"){
	               setTimeout(function(){
	               window.location.reload();
	              					},1000)
				}else{
					alert('未成功刪除数据');
				}
			}
		
		});
	   });
}


/* ********************删除全部数据*************************************/
 
 
$(document).ready(function(){
	
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
			
		$("#del").css("display","block");
		
		var infoNums = []
		$(".cbox:checked").each(function(){
			infoNums.push($(this).val())
		}) 	
		console.log(infoNums);
		var info_nums=infoNums.join(",");
		  $("#del_sure").click(function(){
				 alert(info_nums);
			   $.ajax({
					type:'POST',
					url:'${pageContext.request.contextPath}/delStudentList.action',
					data:"info_nums="+info_nums,
					success:function(resultData){
						//如果请求成功,会执行该函数内容，resultData是响应数据
			 			if(resultData == "success"){
			               setTimeout(function(){
			               window.location.reload();
			              					},1000)
						}else{
							alert('未成功刪除数据');
						}
					}
				
				}); 
			   });
	});
});	

/* 顶部修改 */
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
        
        
        //--------------------------------------------------------------------
        var info_num = null;
        $("input[name='del_selected']:checked").each(function() {
          info_num = $(this).val();
        });
        $.ajax({
    		type:'post',
    		url:'${pageContext.request.contextPath}/getOne.action',
    		data:'info_num='+info_num,
    		success:function(resultData){
    			var a = resultData
    			/* t.text(data[o].clazz_name) */
    			$("#college_name1").text(a.college_name)
    			$("#major_name1").text(a.major_name)
    			$("#clazz_name1").text(a.clazz_name)
    			$("#info_num1").val(a.info_num)
    			$("#info_name1").val(a.info_name)
    			$("#info_gender").val(a.info_gender)
    			 /* $("input[name='info_gender']").val(a.info_gender).prop('checked', 'checked'); */
    			$("#class_id").val(a.clazz_id)
    			$("#info_id").val(a.info_id)
    		}
    	})
			//找到多选框所处的行
			/*  var tr = $(".cbox:checked").parents();
			console.log(tr);
			var college_name = tr.children("td.college_name").val();
			var major_name = tr.children("td.major_name").val();
			var clazz_name = tr.children("td.clazz_name").html();
			var info_num = tr.children("td.info_num").html();
			var info_name = tr.children("td.info_name").html();
			var info_gender = tr.children("td.info_gender").html();
			
			alert("tr"+tr+"info_num"+info_num+"info_name"+info_name+"info_gender"+info_gender+"clazz_name"+clazz_name+"major_name"+major_name+"college_name"+college_name)
			
			$("#college_name1").text(college_name);
			$("#major_name1").text(major_name);
			$("#clazz_name1").text(clazz_name);
			$("#info_num1").val(info_num);
  			$("#info_name1").val(info_name);
  			$("#info_gender").val(info_gender);*/
  			
  		$("#bg1").show();
      $("#edit_teacher").show();   
        });



//修改密码
function alterpwd(info_num){
	
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/updatePwd.action',
		data:"info_num="+info_num,
		success:function(resultData){
			//如果请求成功,会执行该函数内容，resultData是响应数据
              alert('修改成功');
		}
	})
}




window.onload=function(){
	
	getCollege()
} 

  //查询
/* function search(){

	 college_id = $(".a1").val();
	 major_id = $(".a2").val();
	 clazz_id = $(".a3").val();
	 nameOrnumber=$("search_student_info").text();
	 alert("------------------------------")
 	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/getStudent.action',
		data:"college_id="+college_id+"&major_id="+major_id+"&clazz_id="+clazz_id+"&nameOrnumber"+nameOrnumber,
		success:function(resultData){
			if(resultData == "success"){
				alert("resultData-----"+resultData)
				
				setTimeout(function(){
		               window.location.reload();
		              					},1000)
			}
		}
	})  
}  */
 

 //修改前查询
function detail(info_num){

	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/getOne.action',
		data:'info_num='+info_num,
		success:function(resultData){
			var a = resultData
			/* t.text(data[o].clazz_name) */
			$("#college_name1").text(a.college_name)
			$("#major_name1").text(a.major_name)
			$("#clazz_name1").text(a.clazz_name)
			$("#info_num1").val(a.info_num)
			$("#info_name1").val(a.info_name)
			$("#info_gender").val(a.info_gender)
			 /* $("input[name='info_gender']").val(a.info_gender).prop('checked', 'checked'); */
			$("#class_id").val(a.clazz_id)
			$("#info_id").val(a.info_id)
		}
	})
} 

//---------修改-------------
function edit_ture(){
	
	alert("aaa")
	
	clazz_id = $("#class_id").val();
	info_num = $("#info_num1").val();
	info_name = $("#info_name1").val();
	info_gender = $("#info_gender").val()
	info_id = $("#info_id").val()
	
 	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/update.action',
		data:"clazz_id="+clazz_id+"&info_num="+info_num+"&info_name="+info_name+"&info_gender="+info_gender+"&info_id="+info_id,
		success:function(resultData){
			if(resultData == "success"){
				
				setTimeout(function(){
		               window.location.reload();
		              					},1000)
			}
		}
	})  
	
}

//手动添加
function add_ture(){
	clazz_id = $("#add_class").val()
	info_num = $("#add_num").val()
	info_name = $("#add_name").val()
	info_gender = $("#add_gender").val()
	
	if(clazz_id==0 || info_id=="" || clazz_id==null){
		$("#add_class").after("<font class='err'>请选择班级</font>");
		return;
	};
	if(info_num==null || info_num==""){
		$("#add_name").after("<font class='err'>请输入学号</font>");
		return;
	};
	if(info_name==null || info_name=="" ){
		$("#add_name").after("<font class='err'>请输入姓名</font>");
		return;
	};
	
	 	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/addstu.action',
		data:"clazz_id="+clazz_id+"&info_num="+info_num+"&info_name="+info_name+"&info_gender="+info_gender,
		success:function(resultData){
			if(resultData == "success"){
				
				setTimeout(function(){
		               window.location.reload();
		              					},1000)
			}else if(resultData == "repeat"){
				alert("已存在的学号");
			}
		}
	}) 
	
	
}


/* 提示函数 */
function tip(){
        $("#tip").fadeIn(500)
        $("#tip").delay(1000)
        $("#tip").fadeOut(500)
}
</script>
</html>