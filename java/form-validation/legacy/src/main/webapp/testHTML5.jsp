<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>HTML5-FormValidation</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="GnohiSiaM,hellomonday">
        <meta http-equiv="description" content="you are my girl">
        <meta name="author" content="hello_monday">
        <link rel="Icon" href="static/image/apple.ico" type="image/x-icon">
        <link rel="Shortcut Icon" href="static/image/apple.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="static/css/validation.css"/>
        <link rel="stylesheet" type="text/css" href="static/css/flexbox.css"/>
        <style type="text/css">
            .divBox {
                position: relative;
                width: 485px;
                height: 490px;
                padding: 10px 50px 25px;
                background: #FAFAFA;
                border-radius: 6px;
                box-shadow: 0px 2px 12px rgba(0, 0, 0, 0.2);
            }
            .divBox:before {
                content: '';
                left: 0;
                position: absolute;
                width: 130px;
                height: 30px;
                border-left: 1px dashed rgba(0, 0, 0, 0.1);
                border-right: 1px dashed rgba(0, 0, 0, 0.1);
                background: rgba(0, 0, 0, 0.1);
                background: -webkit-gradient(linear, 555% 20%, 0% 92%, from(rgba(0, 0, 0, 0.1)), to(rgba(0, 0, 0, 0.0)), color-stop(.1,rgba(0, 0, 0, 0.2)));
                background: -webkit-linear-gradient(555% 0 180deg, rgba(0,0,0,0.1), rgba(0,0,0,0.2) 10%, rgba(0,0,0,0.0));
                background: -o-linear-gradient(555% 0 180deg, rgba(0,0,0,0.1), rgba(0,0,0,0.2) 10%, rgba(0,0,0,0.0));
                background: -moz-linear-gradient(555% 0 180deg, rgba(0,0,0,0.1), rgba(0,0,0,0.2) 10%, rgba(0,0,0,0.0));
                box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.2);
                -webkit-transform: translate(-50px,10px) skew(10deg,10deg) rotate(-50deg);
                -moz-transform: translate(-50px,10px) skew(10deg,10deg) rotate(-50deg);
                -o-transform: translate(-50px,10px) skew(10deg,10deg) rotate(-50deg);
                transform: translate(-50px,10px) skew(10deg,10deg) rotate(-50deg);
            }
            .divBox:after {
                content: '';
                position: absolute;
                right: -1.6em;
                top: 11em;
                width: 180px;
                height: 38px;
                border-left: 1px dashed rgba(0, 0, 0, 0.1);
                border-right: 1px dashed rgba(0, 0, 0, 0.1);
                background: rgba(0, 0, 0, 0.1);
                background: -webkit-gradient(linear, 555% 20%, 0% 92%, from(rgba(0, 0, 0, 0.1)), to(rgba(0, 0, 0, 0.0)), color-stop(.1,rgba(0, 0, 0, 0.2)));
                background: -moz-linear-gradient(555% 0 180deg, rgba(0,0,0,0.1), rgba(0,0,0,0.2) 10%, rgba(0,0,0,0.0));
                border-left: 1px dashed rgba(0, 0, 0, 0.1);
                border-right: 1px dashed rgba(0, 0, 0, 0.1);
                box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.2);
                -webkit-transform: rotate(90deg) skew(0,0) translate(100px,-65px);
                -moz-transform: rotate(90deg) skew(0,0) translate(100px,-65px);
                -o-transform: rotate(90deg) skew(0,0) translate(100px,-65px);
                -ms-transform: rotate(90deg) skew(0,0) translate(100px,-65px);
                transform: rotate(90deg) skew(0,0) translate(100px,-65px);
            }
            .myText {
                margin: 6px;
                text-align: center;
                font-family: 'Jim Nightshade', cursive;
                font-size: 32px;
                font-weight: bold;
                color: rgb(41, 180, 240);
                text-shadow: 0 1px 0 rgba(0,0,0,0.3);
            }
        </style>
    </head>

    <body class="flexbox" style="background:#f0f0f0 url(static/image/bg.png); font-family:Microsoft Yahei;">
        <div class="divBox">
            <p class="myText">HTML5 - Form Validation</p>
            <form action="RegisterServlet" method="post">
                <div class="line">
                    <label for="name" class="labelText">账 号</label>
                    <input class="inputText" type="text" id="name" name="name" required pattern="^\S+$"/><br>
                </div>

                <div class="line">
                    <label for="password" class="labelText">密 码</label>
                    <input class="inputText" type="password" id="password" name="password" required pattern="^\S+$"/><br>
                </div>

                <div class="line">
                    <label for="repass" class="labelText">重输密码</label>
                    <input class="inputText" type="password" id="repass" name="repass" required pattern="^\S+$"/><br>
                </div>

                <div class="line">
                    <label for="email" class="labelText">E-mail</label>
                    <input class="inputText" type="email" id="email" name="email" required/><br>
                </div>

                <div class="line">
                    <label for="phonenumber" class="labelText">手机号</label>
                    <input class="inputText" type="tel" id="phonenumber" name="phonenumber" required pattern="^((\(\d{3}\))|(\d{3}\-))?13[0-9]\d{8}|15[0-9]\d{8}|18[0-9]\d{8}$"/><br>
                </div>

                <div class="line">
                    <label for="url" class="labelText">个人主页</label>
                    <input class="inputText" type="URL" id="url" name="url" required /><br>
                </div>

                <div class="line">
                    <label for="idcard" class="labelText">身份证</label>
                    <input class="inputText" type="text" id="idcard" name="idcard" required pattern="(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)"/><br>
                </div>

                <div class="line">
                    <label for="address" class="labelText">居住地址</label>
                    <input class="inputText" type="text" id="address" name="address" required/><br>
                </div>

                <div class="line">
                    <label for="birthday" class="labelText">出生年月</label>
                    <input class="inputText" type="text" id="birthday" name="birthday" required/><br>
                </div>

                <center><button id="submit" type="submit"class="enabled">注  册</button></center>
            </form>
        </div>
    </body>
</html>
