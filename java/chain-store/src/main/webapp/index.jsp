<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>menu</title>
    <link rel="Icon" href="image/favicon.ico" type="image/x-icon">
    <link rel="Shortcut Icon" href="image/favicon.ico" type="image/x-icon">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/menu.css" />
    <script type="text/javascript" src="js/meny.min.js"></script>
  </head>

 <body class=" meny-left " style="-webkit-perspective: 800px; -webkit-perspective-origin-x: 0px; -webkit-perspective-origin-y: 50%;">
    <div class="meny" style="width: 260px; height: 100%; position: fixed; display: block; z-index: 1; -webkit-transform-origin: 100% 50%;
                        -webkit-transition: all 0.5s ease; -webkit-transform: translateX(-100%) translateX(6px) scale(1.01) rotateY(-30deg);">
            <h2 style="color:#174867; margin-left:23px">USER : ${uname }</h2>
            <div class="navbox">
                <ul class="nav">
                     <li><a href="SupInfoServlet" onclick="return ahref(this);">商场管理</a></li>
                     <li><a href="DepInfoServlet?sNumber=all&sName=全部" onclick="return ahref(this);">部门管理</a></li>
                     <li><a href="EmpInfoServlet?dNumber=all&dName=全部" onclick="return ahref(this);">员工管理</a></li>
                     <li><a href="main/404.jsp" onclick="return ahref(this);">新进员工</a></li>
                     <li><a href="ManInfoServlet" onclick="return ahref(this);">管理部门经理</a></li>
                     <li><a href="LogoutServlet" onclick="return confirm('确认退出？');">退 出</a></li>
                 </ul>
            </div>
    </div>

    <div class="meny-arrow"></div>

    <div id="cont" class="contents" style="-webkit-transform-origin: 0px 50%; -webkit-transition: all 0.5s ease;">
        <iframe src="main/welcome.jsp"></iframe>
    </div>

    <script>
        var meny = Meny.create({
                        menuElement: document.querySelector( '.meny' ),
                        contentsElement: document.querySelector( '.contents' ),
                        position: Meny.getQuery().p || 'left',
                        height: 200,
                        width: 260,
                        threshold: 40});
    </script>

    <script>
        var aobj = null;
        var inHTML = '';
        var cont = document.getElementById("cont");
        function ahref(obj) {
            if(aobj!= null) {
                aobj.innerHTML = inHTML;
            }
            cont.style.padding = '0px';
            cont.innerHTML = '<iframe src="'+ obj.href +'"></iframe>';
            aobj = obj;
            inHTML = obj.innerHTML;
            obj.innerHTML='<span style="color:#fe6673">'+inHTML+'<span>';
            //event.returnValue=false;   //SHIT IE竟然不兼容
            return false;
        }
    </script>
</body>
</html>
