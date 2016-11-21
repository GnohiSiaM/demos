<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>
      <head>
        <base href="<%=basePath%>">
        <title>login</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="GnohiSiaM,hellomonday">
        <meta http-equiv="description" content="you are my girl">
        <meta name="author" content="hello_monday">
        <link rel="Icon" href="image/apple.ico" type="image/x-icon">
        <link rel="Shortcut Icon" href="image/apple.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/validation.css" type="text/css"/>
        <link rel="stylesheet" href="css/button.css" type="text/css"/>
        <style type="text/css">
            .divBox {
                background: #FAFAFA;
                width: 314px;
                margin-left: 56%;
                position:absolute;
                height: 100%;
            }
            .divBox:before,.divBox:after {
                position: absolute;
                content: "";
                height: 100%;
                width: 23%;
                border-radius: 50%;
                top: 0;
                z-index: -1;
            }
            .divBox:before {
                left: 4%;
                box-shadow: -23px 0px 40px rgba(0,0,0,0.32);
            }
            .divBox:after {
                right: 4%;
                box-shadow: 23px 0px 40px rgba(0,0,0,0.32);
            }
            @font-face {
              font-family: 'komika_axisregular';
              src: url('font/komikax_-webfont.eot');
              src: url('font/komikax_-webfont.eot?#iefix') format('embedded-opentype'),
                   url('font/komikax_-webfont.woff') format('woff'),
                   url('font/komikax_-webfont.ttf') format('truetype'),
                   url('font/komikax_-webfont.svg#komika_axisregular') format('svg');
              font-weight: normal;
              font-style: normal;
            }
            .GnohiSiaM {
                cursor: default;
                margin: 100px auto 50px;
                text-align: center;
                display: block;
                position: relative;
                text-decoration: none;
                font-size: 53px;
                font-family: komika_axisregular;
                font-variant: small-caps;
                text-shadow: 0px 2px 6px rgba(32, 32, 32, 1);
                color: whitesmoke;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                /*-webkit-box-reflect: below -12px -webkit-linear-gradient(top, transparent,transparent .8,rgba(3,3,3,.1));*/
                -webkit-box-reflect: below -12px -webkit-gradient(linear, 0 0, 0 100%, from(transparent), color-stop(.2, transparent), to(rgba(3,3,3,.1)));
            }
            .GnohiSiaM b {
                color: firebrick;
            }
            .h3style {
                 color: #fe6673;
                text-align: center;
                margin-top: 30px;
            }
            .astyle {
                text-decoration: none;
                color: #2387F5;
                font-size: 0.8em;
                float: right;
                margin-top: -1.7em;
                margin-right: 3.6em;
                opacity: 0.6;
            }
            .checkCode {
                vertical-align: middle; /*对img和input同时加此式样即可行内对齐*/
                box-shadow: 0 0 5px #222;
                margin-left: 5px;
                margin-top: -1px;
                border-radius: 4px;
            }
        </style>
        <script type="text/javascript">
            onload = function(){
                var userName = document.getElementById("userName");
                var password = document.getElementById("password");
                if (userName.value == '') {
                    userName.focus();
                } else {
                    password.focus();
                }
            }
        </script>
    </head>

    <body style="margin:0; padding:0; background:#f0f0f0 url(image/bg.png); font-family:Microsoft Yahei;">
        <script>
            if ('null' != '<%=request.getSession().getAttribute("userName")%>') {
                window.location = 'index.jsp';
            }
        </script>

        <div class="divBox">
            <span class="GnohiSiaM">GnohiS<b>iaM</b></span>
            <form action="LoginServlet" method="post">
                <div class="line" style="margin: 20px 30px;">
                    <label for="userName" class="labelText" style="width: 60px;">账 号</label>
                    <%    String name="";
                        if(null != request.getParameter("name")) name = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
                    %>
                    <input class="inputText" style="width: 190px;" type="text" id="userName" name="userName" value="<%=name%>${name}" required/>
                </div>

                <div class="line" style="margin: 20px 30px;">
                    <label for="password" class="labelText" style="width: 60px;">密 码</label>
                    <input class="inputText" style="width: 190px;" type="password" id="password" name="password" required/>
                </div>
                <a class="astyle" href="404.jsp">忘记密码?</a>

                <div class="line" style="margin: 20px 30px;">
                    <label for="inputValidCode" class="labelText" style="width: 60px;">验证码</label>
                    <input class="inputText" style="width: 102px;" type="text" name="inputValidCode" id="inputValidCode" required/>
                    <img src="ValidateCodeServlet" alt="验证码" onclick="this.src='ValidateCodeServlet?'+Math.random();" class="checkCode" id="codeImg" title="点击更换"/>
                </div>

                <button class="modern socle" type="submit" style="margin-left:70px">登 录</button>
                <button class="modern socle" type="button" style="margin-left:40px" onclick="window.location.href='formValidation.jsp'">注 册</button>
                <h3 class="h3style">${msg}</h3>
            </form>
        </div>
    </body>
</html>
