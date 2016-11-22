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
    <title>employeeInfo</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/list.css">
    <link rel="stylesheet" type="text/css" href="css/button.css">
    <style>
        .tittleII {
            margin: 10px 0 0 -290px;
            font-size: 20;
            color: #919FD4;
            text-shadow: 0 -1px 1px rgba(0,0,0,0.7);
        }
    </style>
    <script type="text/javascript">
        function confirmDel() {
            if ( confirm("！！是否确认删除！！") ) {
                return true;
            } else {
                return false;
            }
        }
        function isAll() {
                if ('${dNumber}'=='all') {
                    document.getElementById("all").innerHTML = '';
                    document.getElementById("MInfo").outerHTML = '';
                }
                if ('${MInfo.eName}'=='') {
                    document.getElementById("MInfo").outerHTML = '';
                }
            }
    </script>
  </head>

  <body onload="isAll()">
   <center>
      <div class="tittle">${dName }的员工信息</div>
      <div class="tittleII" id="MInfo">经理：${MInfo.eName } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 入职时间：${MInfo.startTime }</div>
      <ul class="list">
          <li class="bgstart">
                <span class="n1">员工编号</span>
                <span class="n2">姓名</span>
                <span class="n3I">岗位</span>
                <span class="n3II">电话号码</span>
                <span class="n4">工资</span>
        </li>
           <c:forEach items="${eInfo}" var="empInfo" varStatus="status" >
            <c:if test="${status.index % 2 == 0}">
                <li class="odd">
                    <a>
                        <span class="n1">${empInfo.eNumber}</span>
                        <span class="n2">${empInfo.eName}</span>
                        <span class="n3I">${empInfo.ePosition}</span>
                        <span class="n3II">${empInfo.ePhoneNumber}</span>
                        <span class="n4">${empInfo.eSalary}</span>
                    </a>
                    <a href="EmpEditServlet?eNumber=${empInfo.eNumber}">
                        <img class="edit" src="image/edit.png"/>
                    </a>
                    <a href="EmpDeleteServlet?eNumber=${empInfo.eNumber}" onclick="return confirmDel()">
                        <img class="delete" src="image/delete.png"/>
                    </a>
                </li>
            </c:if>

            <c:if test="${status.index % 2 == 1}">
                <li class="even">
                    <a>
                        <span class="n1">${empInfo.eNumber}</span>
                        <span class="n2">${empInfo.eName}</span>
                        <span class="n3I">${empInfo.ePosition}</span>
                        <span class="n3II">${empInfo.ePhoneNumber}</span>
                        <span class="n4">${empInfo.eSalary}</span>
                    </a>
                    <a href="EmpEditServlet?eNumber=${empInfo.eNumber}">
                        <img class="edit" src="image/edit.png"/>
                    </a>
                    <a href="EmpDeleteServlet?eNumber=${empInfo.eNumber}" onclick="return confirmDel()">
                        <img class="delete" src="image/delete.png"/>
                    </a>
                </li>
            </c:if>
        </c:forEach>
        <li class="bgend"></li>
     </ul>
     <div id="all">
         <a href="main/employeeSave.jsp">
             <button class="modern socle" style="margin-left:30px;" type="button">添加员工</button>
         </a>
         <a href="DepInfoServlet?sNumber=${sNumber}&sName=${sName}">
             <button class="modern socle" type="button">上一级</button>
         </a>
     </div>
   </center>
  </body>
</html>
