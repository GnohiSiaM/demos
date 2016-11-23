<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>404</title>
        <link rel="stylesheet" type="text/css" href="css/404.css"/>
    </head>

    <body>
        <div class="demo">
             <p style="margin-left:-52px; margin-top:170px">
                 <span>4</span><span>0</span><span>4</span>
             </p>
             <p class="secondline">
                 <span>Oops!</span>
                 <span>Page</span>
                 <span>Not</span>
                 <span>Found.</span>
             </p>
        </div>
    </body>
</html>
