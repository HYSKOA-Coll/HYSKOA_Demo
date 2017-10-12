<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>班级管理</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/page.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/manage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.rightinfo{width: 96%;margin-left: 1.5%; margin-top: 2%}
.pull-right{margin-top: -18px; margin-bottom: 16px; margin-right: 90px;}
#search_student_info{border: 1px solid #c8cccf; width: 200px; height: 35px; font-size: 14px;}
#select_student{border: 1px solid #2a8cea; width: 98px; height: 35px; background:#2a8cea;color: white;}
select{border:1px solid #fff; appearance:none;-moz-appearance:none; -webkit-appearance:none; -ms-appearance:none; padding: 5px 10px 5px 5px;
		background-color:#fff;}
.form-control{width: 150px; height:38px; background: url("${pageContext.request.contextPath}/admin/images/arrow.png") no-repeat scroll right center transparent;}
tr{height: 40px;}
td,th{text-align: center; font-size: 14px;}
.table_thead{background-color: #EFEFF0}
</style>
</head>
<body>
	<div class="rightinfo">
        <div class="tools">
            <ul class="toolbar">
               <li onclick="add_class()"><span><img src="${pageContext.request.contextPath}/admin/images/t01.png" /></span>添加</li>
               <li id="edit_click"><span><img src="${pageContext.request.contextPath}/admin/images/t02.png" /></span>修改</li>
               <li id="delete_click"><span><img src="${pageContext.request.contextPath}/admin/images/t03.png" /></span>删除</li>
               <li id="search_click"><span><img src="${pageContext.request.contextPath}/admin/images/t04.png" /></span>刷新</li>
         	 </ul><br/>
         	 <form action="${pageContext.request.contextPath}/getall.action" method="post" class="kk">
           <ul class="pull-right clearfix list-inline">
           
               <li>
                  <select class="form-control" id="choose-room-id" name="dname">
                    <option id="choose-de" class="choose-rr">--请选择学院--</option>
                    <option id="choose-de" class="choose-rr" value="1">bbb</option>
                    	<option id="choose-de" class="choose-rr">ccc</option>
                    <option id="choose-de" class="choose-rr">ddd</option>
                  </select>
               </li>
               <li>
                  <select class="form-control" id="choose_major_id" name="major_id">
                          <option id="choose-ma">--请选择专业--</option>
                          <option id="choose-ma" value="1">aaaa</option>
                          <option id="choose-ma">aaaa</option>
                          <option id="choose-ma">aaaa</option>
                  </select>
               </li>
               <li>
                       <input type="text" placeholder="&nbsp;&nbsp;输入班级名称查询" name="clazz_name" id="search_student_info">
               </li>
               <li>
                       <input type="submit" value="查询"  class="select_btn" id="select_class" onclick="search()">
               </li>
         </ul>
         </form>
        </div>
       <script>
	     $(".kk").submit(function(){
	    	
	    	alert("正在查询");
	    	
	    }) 
	    
	    
	    
	</script>
       
       
       <div id="content"></div>
<table class="table table-bordered table-striped table-hover" style="margin-top: 20px;">
  <thead>
    <tr class="table_thead">
     <td width="20px;"><input type="checkbox" name="del_selected" onClick=canclepic(); value="56"></td>
      <th>序号</th>
      <th>学院</th>
      <th>专业</th>
      <th>班级</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${pb.datas}" var="clazz">
    <tr>
     <td width="20px;"><input  class="cbox" type="checkbox" name="del_selected" value=${clazz.clazz_id}></td>
      <input id="ud_id" type="hidden" value="${clazz.clazz_id}">
      <td class="clazz_id">${clazz.clazz_id}</td>
      <td>${clazz.dname}</td>
      <td>${clazz.major_name}</td>
      <td class="clazz_name">${clazz.clazz_name}</td>
  	  <td>
        <a href="javascript:void(0)" onclick="edit_sure()">修改</a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0)" onclick="del_teacher(${clazz.clazz_id})" >删除</a>&nbsp;&nbsp;&nbsp;
     </td>      
    </tr>
     </c:forEach>
  </tbody>
</table> 

</div>

<div id="pageButton">
			<button type="button" onclick="getList('',1)">首页</button>
			<button type="button" onclick="getList('',${pb.pageNow-1})">上一页</button>
			<button type="button" onclick="getList('',${pb.pageNow+1})">下一页</button>
			<button type="button" onclick="getList('',${pb.totalPages})">尾页</button>
		</div>
<!-- 添加弹窗 -->
<div class="tip" id="add_class" style="width: 550px; display: none;">
        <div class="tiptop">
                <span>添加班级</span><a></a>
        </div>
        <div class="tipinfo">
        <form action="addclazz.action" method="post">
                <div class="clearfix">
                        <span class="pull-left">学院*</span>
                        <p>
                               <select id="add_department_id" onchange="javascript:changedepartment(this.value,'major_id','class_id');">
                                        <option value="">--请选择学院--</option>
                                                   <option id="choose-de" class="choose-rr" value="1">bbb</option>
                    	<option id="choose-de" class="choose-rr" value="2">ccc</option>
                    <option id="choose-de" class="choose-rr"value="3">ddd</option>
                                </select> 
                                
                        </p>
                </div>
                
         <!-- 添加 -->       
                <div class="clearfix">
                
                        <span class="pull-left">专业*</span>
                        <p>
                              <select id="major_id" name="major_id">
                                        <option value="1">--请选择专业--</option>
                                   
                          <option id="choose-ma" value="1">aaaa</option>
                          <option id="choose-ma">aaaa</option>
                          <option id="choose-ma">aaaa</option>
                                </select> 
	                        </p>
                </div>
                <div class="clearfix">
                        <span class="pull-left">班级*</span>
                        <p><input id="class_name_add" type="text" name="clazz_name"></p>
                </div>
                <div class="tipbtn">
                        <input onclick="add_sure()" class="sure" value="确 定" type="submit">&nbsp;
                        <input class="cancel" id="add_cancel" value="返 回" type="button">
                </div>
                </form>
        </div>
</div>


<!-- 修改 -->
<div class="tip" id="edit_teacher" style="width: 550px;">
        <div class="tiptop">
                <span>修改教师信息</span><a></a>
        </div>
        <div class="tipinfo">
                <div class="clearfix">
                        <span class="pull-left">班级名称*</span>
                        <p>
                          <input id="clazz_name" id="clazz_name" type="text"><input id="editid" style="display:none;">
                          <input id="clazz_id" id="clazz_id" type="hidden">
                        </p>
                </div>
        </div>
        <div class="tipbtn">
           <input type="button" class="sure" value="确 定"  onclick="edit_sure()"/>&nbsp; 
           <input type="button" class="cancel" onclick="edit_cancel()" value="取消" />
        </div>
</div>

<div class="tip" id="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo"> <span><img src="admin/images/ticon.png"></span>
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
/**************************列表查询*******************************  */
function getList(name_num,pageNow){
	alert("ajax")
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/select.action',
		data:'&pageNow='+pageNow,
		success:
			
		 function(resultData){
			$("body").html(resultData)
		} 
		
	})
}
window.onload = function(){

	selectAll()
	getList(name_num,pageNow);
}
/* function changedepartment(department_id,major_,clasz){
        if(department_id!=null&&department_id!=""){
                          jQuery.post("/manage/department/majorBydepartment",{ department_id:department_id},
                                 function(rs){
                                        $("#"+major_).empty();
                                        $('#'+major_).append('<option value="" >请选择专业</option>'); 
                                 
                                 $.each(rs, function(i, r) {
                                                var id = r.id;
                                                var name =r.major_name
                                                jQuery('#'+major_).append('<option value="'+id+'" >'+name+'</option>'); 
                                });
                         });
          }
}
 */
$("#search_click").click(function getList(name_num,pageNow){
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/select.action',
		data:'&pageNow='+pageNow,
		success:
			
		 function(resultData){
			$("body").html(resultData)
		} 
		
	})
});
$(".tiptop a").click(function(){
        clear_reset();
});
function clear_reset(){
        clear_add();  
        $("#bg1").hide();
   $(".tip").fadeOut(200);
}

/* function _load_(pageIndex){
        load_(pageIndex);
}
function search(){
        load_(1);
}
function load_(pageIndex){
        var class_id = $("#search_class_id").val();
        var class_name = $("#search_class_name").val();
        var department_id = $("#condition_department_id option:selected").val();
        var major_id = $("#condition_major_id option:selected").val();
        var class_name = $("#search_class_name").val();
        
        self.location.href = "/manage/class/?page_index=" + pageIndex 
                                + "&class_id="  + class_id
                                + "&major_id="  + major_id
                                + "&department_id=" + department_id
                                + "&class_name=" + class_name;
} */
/* 添加 */
function add_class(){
        $("#add_class").show();
        $("#bg1").show();
}


$("#add_cancel").click(function(){
        $("#bg1").hide();
        $("#add_class").hide();
        clear_add();
})
function clear_add(){
        $("#id").val("");
        $("#name").val("");
        $("#id").next("font").remove();
        $("#name").next("font").remove();
}
/* 添加 */
function add_sure(){
        
        $("#add_department_id").next('font').remove();
        if($("#add_department_id").val()=="" || $("#add_department_id").val()==null){
                $("#add_department_id").after('<font class="err" >请选择学院</font>');
                return false;
    }
        $("#add_major_id").next('font').remove();
        if($("#add_major_id").val()=="" || $("#add_major_id").val()==null){
                $("#add_major_id").after('<font class="err" > 请选择专业</font>');
                return false;
    }
        $("#class_name_add").next("font").remove();
        if ($("#class_name_add").val()=="" || $("#class_name_add").val()==null){
                $("#class_name_add").after("<font class='err'>请输入班级名称</font>");
                return false;
        }
        jQuery.ajax({
                url:"/manage/class/add_class",
                type:"post",
                data:{major_id:$("#add_major_id option:selected").val(),
                          class_name:$("#class_name_add").val()
                        },
                success : function(re){
                        if (re=="success"){
                                $("#tip_ts").html("操作成功");
                                tip();
                                setTimeout(function(){
                                window.location.reload();
                                },1000)
                                $("#add_class").hide();
                                $("#id").val("");
                                $("#name").val("");
                        }else{
                                $("#tip_ts").html("操作失败");
                                tip();
                        }
                }
        })
}
 
/* 修改 */

$("#edit_click").click(function(){
	alert("aaaaa");
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
		var clazz_name = tr.children("td.clazz_name").html();
		var clazz_id = tr.children("td.clazz_id").html();
		alert("clazz_name-------"+clazz_name+"clazz_id-------"+clazz_id)
		$("#clazz_name").val(clazz_name);
		$("#clazz_id").val(clazz_id);
		
		$("#bg1").show();
 	   $("#edit_teacher").show();  
        
        });
        
function edit_sure(){
	
	alert("aaaaaaaaaaaa")
 	clazz_name = $("#clazz_name").val().trim();
	clazz_id = $("#clazz_id").val().trim();
	alert("clazz_name-------"+clazz_name+"clazz_id-------"+clazz_id)
	//提交时判断输入框是否为空 ， 为空则提示必填
	 if(clazz_name==null || clazz_name==""){
		$("#clazz_name").after("<font class='err'>请输入工号</font>");
		return;
	};
	alert("clazz------"+clazz_name)
	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/updataclazz.action',
		data:"clazz_name="+clazz_name+"&clazz_id="+clazz_id,
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
 		//获取选中box的值，返回一个数组
 		var infoNums = []
 		$(".cbox:checked").each(function(){
 			infoNums.push($(this).val())
 		}) 		
 		console.log(infoNums)
 		var info_ids=infoNums.join(",");
    $("#bg1").hide();
    $("#delete_tip").fadeOut(200);						

 	$.ajax({
 		type:'POST',
 		url:'${pageContext.request.contextPath}/deleteclazzs.action',
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
  function del_teacher(clazz_id){
	 alert(clazz_id)
    $("#bg1").show();
    $("#delete_tip").fadeIn(200);
    
    $("#delete_btn").click(function(){
    $.ajax({
 		type:'POST',
 		url:'${pageContext.request.contextPath}/deleteclazz.action',
 		data:"clazz_id="+clazz_id,
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

/* 提示函数 */
function tip(){
        $("#tip").fadeIn(500)
        $("#tip").delay(1000)
        $("#tip").fadeOut(500)
}
</script>

<script type="text/javascript">

  function getlist(){
	  
	  alert("00");
	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/getall.action',
		data:'pageNow='+pageNow,
		success:function(resultData){
			$("#fourm").html(resultData)
			}
		})
		 }
  
 
  
  var pageNow=1; 
  window.onload = function(){
/*   	setInterval(function(){setCurrTime()}, 1000) */
   	getList("",1)
   	selectAll();
   }
					 
</script>
<script type="text/javascript">


function selectAll(){
	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/selectAll.action',
		success:function(resultData){
			var data = resultData;
			for(var o in data){
	     /*  alert("id:"+data[o].id+" value:"+data[o].department_name+"  list"+ data[o].list);  */
	      var t = $("<option></option>");
	      t.text(data[o].department_name)
	      t.val(data[o].id)
	      /* alert(t+"1111111") */
	      	$(".choose-rr").after(t)
	      	var data1 = data[o].list;
			} 

			}
		})
 };


 $(document).ready(function (){
	
	
	$("select#choose-room-id").change(function(){
	     var s = $(this).val();
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/selectMajor.action?id='+s,
			success:function(resultData){
				var data = resultData;
				
				 if(data == null){
					$(".aaaa").remove();
					return;
				}else{
					$(".aaaa").remove();
					for(var o in data){
					      var t = $("<option></option>");
					      t.text(data[o].major_name)
					      t.val(data[o].id)
					      t.attr("clazz","aaaa")
					      	$("#choose-ma").after(t)
							}
				}
				}
			})
   }); 
	
	 $("select#select-room").change(function(){
	     var s = $(this).val();
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/selectMajor.action?id='+s,
			success:function(resultData){
				var data = resultData;
				
				 alert("data");
				 if(data == null){
					$(".aaa").remove();
					return;
				}else{
					$(".aaa").remove();
					for(var o in data){
					       alert("id:"+data[o].id+" value:"+data[o].major_name); 
					      var t = $("<option></option>");
					      t.text(data[o].major_name)
					      t.val(data[o].id)
					      t.attr("class","aaa")
					      alert(t+"2222222")
					      	$("#choose-oo").after(t)
							}
				}
				}
			})
   });
}) 

</script>
</body>
</html>