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
        function confirmDel() {
            if ( confirm("！！是否确认删除！！") ) {
                return true;
            } else {
                return false;
            }
        }

        function isAll() {
            if ('${sNumber}'=='all') {
                document.getElementById("all").innerHTML = '';
            }
        }
    </script>
  </head>

  <body onload="isAll()">
   <center>
    <h1 class="tittle">${sName }的部门信息</h1>
      <ul class="list">
          <li class="bgstart">
                <span class="n1">部门编号</span>
                <span class="n2">部门名称</span>
                <span class="n3">位置分布</span>
                <span class="n4">联系电话</span>
        </li>
           <c:forEach items="${dInfo}" var="depInfo" varStatus="status" >
            <c:if test="${status.index % 2 == 0}">
                <li class="odd">
                    <a href="EmpInfoServlet?dNumber=${depInfo.dNumber}&dName=${depInfo.dName}">
                        <span class="n1">${depInfo.dNumber}</span>
                        <span class="n2">${depInfo.dName}</span>
                        <span class="n3">${depInfo.dLocation}</span>
                        <span class="n4">${depInfo.dPhoneNumber}</span>
                    </a>
                    <a href="DepEditServlet?dNumber=${depInfo.dNumber}">
                        <img class="edit" src="image/edit.png"/>
                    </a>
                    <a href="DepDeleteServlet?dNumber=${depInfo.dNumber}" onclick="return confirmDel()">
                        <img class="delete" src="image/delete.png"/>
                    </a>
                </li>
            </c:if>

            <c:if test="${status.index % 2 == 1}">
                <li class="even">
                    <a href="EmpInfoServlet?dNumber=${depInfo.dNumber}&dName=${depInfo.dName}">
                        <span class="n1">${depInfo.dNumber}</span>
                        <span class="n2">${depInfo.dName}</span>
                        <span class="n3">${depInfo.dLocation}</span>
                        <span class="n4">${depInfo.dPhoneNumber}</span>
                    </a>
                    <a href="DepEditServlet?dNumber=${depInfo.dNumber}">
                        <img class="edit" src="image/edit.png"/>
                    </a>
                    <a href="DepDeleteServlet?dNumber=${depInfo.dNumber}" onclick="return confirmDel()">
                        <img class="delete" src="image/delete.png"/>
                    </a>
                </li>
            </c:if>
        </c:forEach>
        <li class="bgend"></li>
     </ul>
     <div id="all">
         <a href="main/departmentSave.jsp">
             <button class="modern socle" style="margin-left:30px;" type="button">添加部门</button>
         </a>
         <a href="SupInfoServlet"><button class="modern socle" type="button">上一级</button></a>
     </div>
   </center>
  </body>
</html>
