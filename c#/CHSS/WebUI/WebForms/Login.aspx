<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebUI.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="keywords" content="GnohiSiaM,hellomonday"/>
    <meta http-equiv="description" content="you are my girl"/>
    <meta name="author" content="hello_monday"/>
    <link rel="Icon" href="/Images/apple.ico" type="image/x-icon"/>
    <link rel="Shortcut Icon" href="/Images/apple.ico" type="image/x-icon"/>
    <link href="/Styles/validation.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
          .divBox{
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
            src: url('/Fonts/komikax_-webfont.eot');
            src: url('/Fonts/komikax_-webfont.eot?#iefix') format('embedded-opentype'),
                 url('/Fonts/komikax_-webfont.woff') format('woff'),
                 url('/Fonts/komikax_-webfont.ttf') format('truetype'),
                 url('/Fonts/komikax_-webfont.svg#komika_axisregular') format('svg');
            font-weight: normal;
            font-style: normal;
        }
        .GnohiSiaM{
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
        .GnohiSiaM abbr {
            color: firebrick;
        }
        .h3style{
             color: #fe6673;
            text-align: center;
            margin-top: 30px;
        }
        .astyle{
            text-decoration: none;
            color: #2387F5;
            font-size: 0.8em;
            float: right;
            margin-top: -1.7em;
            margin-right: 3.6em;
            opacity: 0.6;
        }
        .checkCode{
            vertical-align: middle; /*对img和input同时加此式样即可行内对齐*/
            box-shadow: 0 0 5px #222;
            margin-left: 5px;
            margin-top: -1px;
            border-radius: 4px;
            height: 32px;
        }
      </style>
    <script type="text/javascript">
        onload = function () {
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
<body style="background:#eee url(/Images/bg.png);margin:0;padding:0;">
    <form id="formLogin" runat="server">
        <div class="divBox">
              <span class="GnohiSiaM">XiDian<abbr title="Community Health Services System">CHSS</abbr></span>
              <div class="line" style="margin: 20px 30px;">
                <label for="userName" class="labelText" style="width: 60px;">账 号</label>
                <asp:TextBox ID="userName" class="inputText" style="width: 190px;" runat="server" required></asp:TextBox>
            </div>

            <div class="line" style="margin: 20px 30px;">
                <label for="password" class="labelText" style="width: 60px;">密 码</label>
                <asp:TextBox ID="password" TextMode="Password" class="inputText" style="width: 190px;" runat="server" required></asp:TextBox>
            </div>
            <a class="astyle" href="404.aspx">忘记密码?</a>

            <div class="line" style="margin: 20px 30px;">
                <label for="verifyCode" class="labelText" style="width: 60px;">验证码</label>
                <input class="inputText" style="width: 110px;" type="text" name="verifyCode" id="verifyCode" required/>
                <%--<asp:TextBox ID="verifyCode" class="inputText" style="width: 110px;" runat="server" required></asp:TextBox>--%>
                <label for="verifyCode"><img src="GetVerifyCode.aspx" alt="验证码" onclick="this.src='GetVerifyCode.aspx?'+Math.random();" class="checkCode" id="codeImg" title="点击更换"/></label>
            </div>

            <!--
                客户端点击事件先于服务器端点击事件执行

                对于服务器按钮控件（即<asp:Button>类型的按钮）：
                服务器响应事件：OnClick
                客户端响应属性：OnClientClick

                对于html按钮控件（即<input id="Button" type="button" runat="server">）
                服务器响应事件：OnServerClick
                客户端响应事件：onclick
            -->
            <button class="modern socle" type="submit" style="margin-left:70px" runat="server" id="submit" OnServerClick="submit_Click">登 录</button>
            <button class="modern socle" type="button" style="margin-left:40px" onclick="window.location.href='Register.aspx'">注 册</button>
            <h3 class="h3style" runat="server"><%= msg %></h3>
            <%--
                <%=服务端语言的表达式可以为有返回值的方法，但返回值不能太大%> --------- <% Respose.Write() %>
                <%可以执行服务器代码%>
                <%#数据绑定%>   ------------  <%# Eval() %>与<%# Bind() %>
            --%>
           </div>
    </form>
</body>
</html>
