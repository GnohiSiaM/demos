<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>login</title>
    <link rel="Icon" href="image/favicon.ico" type="image/x-icon">
    <link rel="Shortcut Icon" href="image/favicon.ico" type="image/x-icon">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/button.css">
    <style type="text/css">
        body {
              background: #f0f0f0;
              background:-webkit-gradient(linear, left top, left bottom, from(#ccc), to(#fff));
        }
        .text {
              color:grey;
              font-size:18;
        }
        .wrapper {
                padding: 30px 23px 10px;
                width: 500px;
                display: block;
                background: #f0f0f0;
                background: rgba(0,0,0,0.06);
                border-radius: 20px;
                border: 1px solid rgba(0,0,0,0.1);
                box-shadow: inset 0 2px 10px rgba(0,0,0,0.1);
        }
        .mac {
              display: inline;
              border: none;
              border-radius: 20px;
              padding: 5px 8px;
              color: #333;
              box-shadow: inset 0 2px 0 rgba(0,0,0,.2), 0 0 4px rgba(0,0,0,0.1);
              margin-bottom: 12px;
        }
        .mac:focus {
              outline: none;
              box-shadow: inset 0 2px 0 rgba(0,0,0,.2), 0 0 4px rgba(0,0,0,0.1), 0 0 5px 1px #51CBEE;
        }
    </style>
  </head>

  <body>
      <form action="login" method="post">
        <center style="margin-top:170px">
          <div class="wrapper">
            <h1 style="color:#9C7B87; text-shadow:0 -1px 1px rgba(0,0,0,0.7);">连锁商场管理系统</h1>
            <div class="text">账号 : <input class="mac" name="name" type="text"/></div>
            <div class="text">密码 : <input class="mac" name="password" type="password"/></div>
            <button class="modern socle" type="submit">Login</button>
            <button class="modern socle" type="reset" style="margin-left:30px">Reset</button>
            <h2 style="color:#fe6673">${msg}</h2>
          </div>
        </center>
    </form>
  </body>
</html>
