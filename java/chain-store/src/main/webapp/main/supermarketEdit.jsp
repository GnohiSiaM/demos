<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>supermarketEdit</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <link rel="stylesheet" type="text/css" href="css/button.css">
        <link rel="stylesheet" type="text/css" href="css/form.css">
    </head>

    <body>
        <form action="supermarket/update" method="post">
            <center><div class="wrapper">
                <div>
                    <span class="text">商场编号：</span>
                    <input class="mac" style="color:#BD7D7D" readonly type="text" name="sNumber" value="${supermarket.getSNumber()}"/>
                </div>
                <div>
                    <span class="text">商场名称：</span>
                    <input class="mac" type="text" name="sName" value="${supermarket.getSName()}"/>
                </div>
                <div>
                    <span class="text">地 址：</span>
                    <input class="mac" type="text" name="sAddress" value="${supermarket.getSAddress()}"/>
                </div>
                <div>
                    <span class="text">联系电话：</span>
                    <input class="mac" type="text" name="sPhoneNumber" value="${supermarket.getSPhoneNumber()}"/>
                </div>
                <button class="modern socle" style="margin-left:30px;" type="submit">确定</button>
                <button class="modern socle" onclick="history.go(-1)" type="button">返回</button>
            </div></center>
        </form>
    </body>
</html>
