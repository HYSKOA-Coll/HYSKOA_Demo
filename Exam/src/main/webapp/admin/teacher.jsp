<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>老师管理</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/manage.css" rel="stylesheet" type="text/css" />
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
               <li id="search_click"><span><img src="${pageContext.request.contextPath}/admin/images/t04.png" /></span>刷新</li>
         	 </ul>
           <ul class="pull-right clearfix list-inline" style="margin-right: 100px;">
               <li>
                  <input type="text" placeholder="&nbsp;&nbsp;输入教师姓名/工号查询" id="search_teacher_info">
               </li>
               <li>
                  <input type="button" value="查询"  class="select_btn" id="select_teacher" onclick="search()">
               </li>
            </ul>
        </div>
       
<table class="table table-bordered table-striped table-hover" style="margin-top: 20px;">
  <thead>
    <tr class="table_thead">
     <td width="20px;"><input type="checkbox" name="del_selected" onClick=canclepic(); value="56"></td>
      <th>序号</th>
      <th>工号</th>
      <th>姓名</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
    <tr>
     <td width="20px;"><input type="checkbox" name="del_selected" onClick=canclepic(); value="56"></td>
      <td>1</td>
      <td>10001</td>
      <td>TAO</td>
  	  <td>
        <a href="javascript:void(0)" onclick="teacher_detail(56)">修改</a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0)" onclick="del_teacher(56)" >删除</a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0)" onclick="alterpwd(56)">重置密码</a>
     </td>      
    </tr>
     <tr>
      <td width="20px;"><input type="checkbox" name="del_selected" onClick=canclepic(); value="56"></td>
      <td>2</td>
      <td>10002</td>
      <td>WANG</td>
  	  <td>
        <a href="javascript:void(0)" onclick="teacher_detail(56)">修改</a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0)" onclick="del_teacher(56)" >删除</a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0)" onclick="alterpwd(56)">重置密码</a>
     </td>      
    </tr>
      <tr>
      <td width="20px;"><input type="checkbox" name="del_selected" onClick=canclepic(); value="56"></td>
      <td>2</td>
      <td>10002</td>
      <td>WANG</td>
  	  <td>
        <a href="javascript:void(0)" onclick="teacher_detail(56)">修改</a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0)" onclick="del_teacher(56)" >删除</a>&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0)" onclick="alterpwd(56)">重置密码</a>
     </td>      
    </tr>
  </tbody>
</table>
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
                <p><input id="id" placeholder="教师工号" type="text"></p>
             </div>
             <div class="clearfix">
                 <span class="pull-left">姓名*</span>
                 <p><input id="name" type="text"></p>
             </div>
             <div class="tipbtns">
                <input type="button" onclick="add_sure()" class="sure" value="确 定" />&nbsp;
                <input type="button" class="cancel" id="add_write_cancel" value="返 回" />
             </div>
         </div>
                <!-- 批量导入 -->
          <div id="import_teacher_div" style="display: none;margin-top: 20px;">
             <div class="add_info">
                 <ul>
                   <li><i><a href="javascript:void(0)" onclick="download_model()" class="text-primary">去下载excel模板</a></i></li>
                   <li><input type="file" id="myExcel" name="myExcel" accept="application/vnd.ms-excel"></li>
                 </ul>
             </div>
             <div class="tipbtns">
                 <input type="button" id="import_teacher" class="sure" value="导 入" />&nbsp;
                 <input type="button" class="cancel" id="add_import_cancel" value="返 回" />
             </div>
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
                                <input id="edit_id" placeholder="教师工号" type="text"><input id="editid" style="display: none;">
                        </p>
                </div>
                <div class="clearfix">
                        <span class="pull-left">姓名*</span>
                        <p>
                                <input id="edit_name" type="text">
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
        <div class="tipinfo"> <span><img src="${pageContext.request.contextPath}/admin/images/t01.png" /></span>
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
                <span><img src="${pageContext.request.contextPath}/admin/images/t01.png" /></span>
                <div class="tipright">
                        <p id="ok_tip">确定删除选定数据吗？</p>
                </div>
        </div>
        <div class="tipbtn">
                <input type="button" id="delete_sure" class="sure" value="确定" />&nbsp;
                <input type="button" class="cancel" id="delete_cancel" value="取消" />
        </div>
</div>
<script type="text/javascript">

$(".tiptop a").click(function(){
    clear_reset();
});
function clear_reset(){
    clear_add();  
    $("#bg1").hide();
		$(".tip").fadeOut(200);
}

$("#add_click").click(function(){
	$("#add_teacher").show();
	 $("#bg1").show();
	
});
function clear_add(){
    $("#id").val("");
    $("#name").val("");
    $("#id").next("font").remove();
    $("#name").next("font").remove();
}

</script>
</body>
</html>