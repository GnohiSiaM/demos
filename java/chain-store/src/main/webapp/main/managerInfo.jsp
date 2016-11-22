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
    <title>managerInfo</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/list.css">
    <link rel="stylesheet" type="text/css" href="css/button.css">
    <script type="text/javascript">
        function confirmDel() {
            if ( confirm("是否取消其经理职务?\n(确认后不会删除该员工的信息)") ) {
                return true;
            } else {
                return false;
            }
        }
    </script>
  </head>

  <body>
   <center>
      <div class="tittle">部门经理信息</div>
      <ul class="list">
          <li class="bgstart">
                <span class="n1">员工编号</span>
                <span class="n2">姓名</span>
                <span class="n3I">所属商场</span>
                <span class="n3II">所属部门</span>
                <span class="n4">上任时间</span>
        </li>
           <c:forEach items="${mInfo}" var="manInfo" varStatus="status" >
            <c:if test="${status.index % 2 == 0}">
                <li class="odd">
                    <a>
                        <span class="n1">${manInfo.eNumber}</span>
                        <span class="n2">${manInfo.eName}</span>
                        <span class="n3I">${manInfo.sName}</span>
                        <span class="n3II">${manInfo.dName}</span>
                        <span class="n4">${manInfo.startTime}</span>
                    </a>
                    <a href="ManDeleteServlet?eNumber=${manInfo.eNumber}" onclick="return confirmDel()">
                        <img class="edit" src="image/delete.png"/>
                    </a>
                </li>
            </c:if>

            <c:if test="${status.index % 2 == 1}">
                <li class="even">
                    <a>
                        <span class="n1">${manInfo.eNumber}</span>
                        <span class="n2">${manInfo.eName}</span>
                        <span class="n3I">${manInfo.sName}</span>
                        <span class="n3II">${manInfo.dName}</span>
                        <span class="n4">${manInfo.startTime}</span>
                    </a>
                    <a href="ManDeleteServlet?eNumber=${manInfo.eNumber}" onclick="return confirmDel()">
                        <img class="edit" src="image/delete.png"/>
                    </a>
                </li>
            </c:if>
        </c:forEach>
        <li class="bgend"></li>
     </ul>
     <a href="ManSaveServlet">
         <button class="modern socle" style="margin-left:30px;" type="button">设置部门经理</button>
     </a>
   </center>
  </body>
</html>
