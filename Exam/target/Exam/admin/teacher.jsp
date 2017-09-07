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
</body>
</html>