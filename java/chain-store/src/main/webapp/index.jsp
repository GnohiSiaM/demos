<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>homepage</title>
        <link rel="Icon" href="image/favicon.ico" type="image/x-icon">
        <link rel="Shortcut Icon" href="image/favicon.ico" type="image/x-icon">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <link rel="stylesheet" type="text/css" href="css/meny.css" />
        <script type="text/javascript" src="js/meny.min.js"></script>
    </head>

    <body class="meny-left">
        <div class="meny" >
            <h2 style="color:#174867">当前用户: ${uname}</h2>
            <div class="navbox">
                <ul class="nav">
                    <li><a href="supermarket/info" onclick="return switchIframeSrc(this);">商场管理</a></li>
                    <li><a href="department/info?sNumber=all&sName=全部" onclick="return switchIframeSrc(this);">部门管理</a></li>
                    <li><a href="employee/info?dNumber=all&dName=全部" onclick="return switchIframeSrc(this);">员工管理</a></li>
                    <li><a href="manager/info" onclick="return switchIframeSrc(this);">管理部门经理</a></li>
                    <li><a href="main/404.jsp" onclick="return switchIframeSrc(this);">新进员工</a></li>
                    <li><a href="logout">退 出</a></li>
                </ul>
            </div>
        </div>

        <div class="meny-arrow"></div>

        <iframe id="iframe" class="contents"></iframe>

        <script>
            var meny = Meny.create({
                menuElement: document.querySelector( '.meny' ),
                contentsElement: document.querySelector( '.contents' ),
                position: Meny.getQuery().p || 'left',
                height: 200,
                width: 260,
                threshold: 40
            });

            var previousObject = null;
            var previousHTML = '';
            var iframe = document.getElementById("iframe");
            function switchIframeSrc(object) {
                if (previousObject != null) {
                    previousObject.innerHTML = previousHTML;
                }
                iframe.src = object.href;
                previousObject = object;
                previousHTML = previousObject.innerHTML;
                object.innerHTML = '<span style="color:#fe6673">' + object.innerHTML + '<span>';
                //event.returnValue=false;   // IE不兼容
                return false;
            }
            document.getElementsByTagName("A")[0].click();
        </script>
    </body>
</html>
