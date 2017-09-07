<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet" type="text/css" />
<title>学院管理</title>
<style type="text/css">
th{font-size: 15px;}
.trtitle{height: 40px; text-align: left;}
.trtitle th input{margin-left: 11px;}
</style>
</head>
<body>
	<div class="rightinfo">
                <div class="tools">
                        <ul class="toolbar">
                                <li id="add_click"><span><img src="${pageContext.request.contextPath}/admin/images/t01.png"/></span>添加</li>
                                <li id="delete_click"><span><img src="${pageContext.request.contextPath}/admin/images/t03.png" /></span>删除</li>
                                <li id="search_click"><span><img src="${pageContext.request.contextPath}/admin/images/t04.png" /></span>刷新</li>
                        </ul>
                </div>
        <table class="tablelist">
                <thead>
                        <tr class="trtitle">
                                <th width="50"><input type="checkbox" name="del_manager" value="7"/></th>
                                <th width="50"><i class="sort"><img src="${pageContext.request.contextPath}/admin/images/px.gif" /></i></th>
                                <th>学院/专业</th>
                                <th>专业类型</th>
                                <th>操作</th>
                        </tr>
                </thead>
                <tbody id="tblMain">
                    <tr style="background-color: #f3f3f3">
                            <td><input type="checkbox" name="del_manager" value="7"/></td>
                            <td>1</td>
                            <td>人文学院</td>
                            <td></td>
                            <td style="cursor: pointer;">添加专业</td>
                    </tr>
                     <tr>
                            <td></td>
                            <td></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;应英语用</td>
                            <td></td>
                            <td style="cursor: pointer;">删除专业</td>
                     </tr>
                     
                     <tr>
                            <td></td>
                            <td></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;应英语用</td>
                            <td></td>
                            <td style="cursor: pointer;">删除专业</td>
                     </tr>
                      <tr style="background-color: #f3f3f3">
                            <td><input type="checkbox" name="del_manager" value="7"/></td>
                            <td>2</td>
                            <td>人文学院</td>
                            <td></td>
                            <td style="cursor: pointer;">添加专业</td>
                    </tr>
                     <tr>
                            <td></td>
                            <td></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;应英语用</td>
                            <td></td>
                            <td style="cursor: pointer;">删除专业</td>
                     </tr>
                   
                </tbody>
</table>
</div>
</body>
</html>