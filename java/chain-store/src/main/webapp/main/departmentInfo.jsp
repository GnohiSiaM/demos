<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>departmentInfo</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/list.css" />
    <link rel="stylesheet" type="text/css" href="css/button.css" />
    <script type="text/javascript">
        function isAll() {
            if ('${sNumber}'=='all') {
                document.getElementById("all").innerHTML = '';
            }
        }
    </script>
  </head>

  <body onload="isAll()">
    <center>
      <h1 class="tittle">${sName}的部门信息</h1>
        <ul class="list">
          <li class="bgstart">
            <span class="n1">部门编号</span>
            <span class="n2">部门名称</span>
            <span class="n3">位置分布</span>
            <span class="n4">联系电话</span>
          </li>
          <c:forEach items="${dInfo}" var="department" varStatus="status" >
            <c:if test="${status.index % 2 == 0}"><li class="odd"></c:if>
            <c:if test="${status.index % 2 == 1}"><li class="even"></c:if>
              <a href="employee/info?dNumber=${department.getDNumber()}&dName=${department.getDName()}">
                <span class="n1">${department.getDNumber()}</span>
                <span class="n2">${department.getDName()}</span>
                <span class="n3">${department.getDLocation()}</span>
                <span class="n4">${department.getDPhoneNumber()}</span>
              </a>
              <a href="department/update?dNumber=${department.getDNumber()}">
                <img class="edit" src="image/edit.png"/>
              </a>
              <a href="department/delete?dNumber=${department.getDNumber()}" onclick="return confirm('是否确认删除')">
                <img class="delete" src="image/delete.png"/>
              </a>
            </li>
          </c:forEach>
          <li class="bgend"></li>
        </ul>
        <div id="all">
          <a href="main/departmentSave.jsp">
            <button class="modern socle" style="margin-left:30px;" type="button">添加部门</button>
          </a>
          <a href="supermarket/info"><button class="modern socle" type="button">上一级</button></a>
      </div>
    </center>
  </body>
</html>
