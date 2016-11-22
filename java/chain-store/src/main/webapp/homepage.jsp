<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>Homepage</title>
    <link rel="Icon" href="image/favicon.ico" type="image/x-icon">
    <link rel="Shortcut Icon" href="image/favicon.ico" type="image/x-icon">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="js/meny.min.js"></script>
    <style>
        body {
            padding:0;
            margin:0;
            background-color: #ECECEC;
        }
        .navbox {
            margin: 90px 0 0 10px;
            position: relative;
            float: left;
            width: 200px;
            clear: none;
        }
        ul.nav {
            list-style: none;
            display: block;
            width: 200px;
            position: relative;
            top: 10px;
            left: 10px;
            padding: 60px 0 60px 0;
            background: url('image/shad2.png') no-repeat;
            -webkit-background-size: 50% 100%;
               -moz-background-size: 50% 100%;
                -ms-background-size: 50% 100%;
                 -o-background-size: 50% 100%;
                    background-size: 50% 100%;
        }
        li {
            margin: 5px 0 0 0;
            font-weight: bold;
        }
        ul.nav li a {
            -webkit-transition: all 0.3s ease-out;
               -moz-transition: all 0.3s ease-out;
                -ms-transition: all 0.3s ease-out;
                 -o-transition: all 0.3s ease-out;
                    transition: all 0.3s ease-out;
            background: #cbcbcb url('image/border.png') no-repeat;
            color: #174867;
            padding: 7px 15px 7px 15px;
            -webkit-border-top-right-radius: 10px;
               -moz-border-top-right-radius: 10px;
                -ms-border-top-right-radius: 10px;
                 -o-border-top-right-radius: 10px;
                    border-top-right-radius: 10px;
            -webkit-border-bottom-right-radius: 10px;
               -moz-border-bottom-right-radius: 10px;
                -ms-border-bottom-right-radius: 10px;
                 -o-border-bottom-right-radius: 10px;
                    border-bottom-right-radius: 10px;
            width: 130px;
            display: block;
            text-decoration: none;
            -webkit-box-shadow: 2px 2px 4px #888;
               -moz-box-shadow: 2px 2px 4px #888;
                -ms-box-shadow: 2px 2px 4px #888;
                 -o-box-shadow: 2px 2px 4px #888;
                    box-shadow: 2px 2px 4px #888;
        }
        ul.nav li a:hover {
            color: #67a5cd;
            background: #ebebeb url('image/border.png') no-repeat;
            padding: 7px 15px 7px 30px;
        }
        iframe {
            position: absolute;
            padding: 0;
            margin: 0;
            width: 1156;
            height: 100%;
            border: 0;
            float: left;
        }
    </style>
  </head>

  <body>

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

    <iframe id="frame" src="main/welcome.jsp"></iframe>

    <script>
        var aobj = null;
        var inHTML = '';
        var iframeObj = document.getElementById("frame");
        function ahref(obj) {
            if (aobj!= null) {
                aobj.innerHTML = inHTML;
            }
            iframeObj.src = obj.href;
            aobj = obj;
            inHTML = obj.innerHTML;
            obj.innerHTML='<span style="color:#fe6673">'+inHTML+'<span>';
            //event.returnValue=false;   //SHIT IE竟然不兼容
            return false;
        }
    </script>
  </body>
</html>
