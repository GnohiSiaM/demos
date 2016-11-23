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
        <title>supermarketInfo</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <link rel="stylesheet" type="text/css" href="css/list.css" />
        <link rel="stylesheet" type="text/css" href="css/button.css" />
    </head>

    <body>
        <center>
            <div class="tittle">连锁商场信息</div>
            <ul class="list">
                <li class="bgstart">
                    <span class="n1">商场编号</span>
                    <span class="n2">商场名称</span>
                    <span class="n3">地址</span>
                    <span class="n4">联系电话</span>
                </li>
                <c:forEach items="${sInfo}" var="supermarket" varStatus="status" >
                    <c:if test="${status.index % 2 == 0}"><li class="odd"></c:if>
                    <c:if test="${status.index % 2 == 1}"><li class="even"></c:if>
                        <a href="department/info?sNumber=${supermarket.getSNumber()}&sName=${supermarket.getSName()}">
                            <span class="n1">${supermarket.getSNumber()}</span>
                            <span class="n2">${supermarket.getSName()}</span>
                            <span class="n3">${supermarket.getSAddress()}</span>
                            <span class="n4">${supermarket.getSPhoneNumber()}</span>
                        </a>
                        <a href="supermarket/update?sNumber=${supermarket.getSNumber()}">
                            <img class="edit" src="image/edit.png"/>
                        </a>
                        <a href="supermarket/delete?sNumber=${supermarket.getSNumber()}" onclick="return confirm('是否确认删除')">
                            <img class="delete" src="image/delete.png"/>
                        </a>
                    </li>
                </c:forEach>
                <li class="bgend"></li>
            </ul>
            <a href="main/supermarketSave.jsp">
                <button class="modern socle" type="button">添加商场</button>
            </a>
        </center>
    </body>
</html>
