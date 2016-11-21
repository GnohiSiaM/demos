<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <!--<base href="<%=basePath%>">-->
        <title>表单验证</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="GnohiSiaM,hellomonday">
        <meta http-equiv="description" content="you are my girl">
        <meta name="author" content="hello_monday">
        <link rel="Icon" href="image/apple.ico" type="image/x-icon">
        <link rel="Shortcut Icon" href="image/apple.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/fancybox.css?v=2.1.5" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/validation.css"/>
        <link rel="stylesheet" type="text/css" href="css/circle.css"/>
        <link rel="stylesheet" type="text/css" href="css/datepicker.css"></link>
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="js/bootstrap-datepicker.zh-CN.js" charset="UTF-8"></script>
        <script type="text/javascript" src="js/fancybox.js?v=2.1.5"></script>
        <script type="text/javascript" src="js/formValidation.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".fancybox").fancybox({
                    padding: 10,
                    title: null
                });
                $('#birthday').datepicker({
                    format: "yyyy-mm-dd",
                    language: "zh-CN",
                    //todayBtn: "linked",
                    calendarWeeks: true,
                    autoclose: true,
                    todayHighlight: true
                });
            });
        </script>
    </head>

    <body style="background:#f0f0f0 url(image/bg.png); display:flex; font-family:Microsoft Yahei;">
        <div class="bg"></div>

        <!-- 一个带特效的漂浮圆形登陆连接  -->
        <a href="login.jsp" class="circle" title="Click to login">
            login<strong>GnohiSiaM</strong>.com
        </a>

          <!-- 注册表单  -->
        <div class="box shadow">
            <div class="ribbon"></div>

            <span class="subhead">
                "<a href="#messages" class="fancybox" title="弹出隐藏的DIV">服务条款</a>"、
                "<a href="testHTML5.jsp" class="fancybox fancybox.iframe" title="弹出JSP">用户须知</a>"、
                "<a href="image/banner1.jpg" class="fancybox" title="弹出图片">隐私权相关政策</a>"
            </span>
            <h2 class="mainTitle">练习表单验证 (JS+AJAX) &amp; CSS3 &amp; 弹窗效果</h2>

            <form action="RegisterServlet" method="post" onSubmit="return validation('Submit')" autocomplete="off">
                <div class="line">
                    <label for="username" class="labelText">账 号</label>
                    <input class="inputText" type="text" id="username" name="username" placeholder="只能含有字母、数字、汉字及下划线"/>
                    <label for="username" class="tips status1">请输入用户名</label><br>
                </div>

                <div class="line">
                    <label for="password" class="labelText">密 码</label>
                    <input class="inputText" type="password" id="password" name="password" placeholder="请使用大小写字母、数字和符号的组合" onKeyUp="passwordGrade(this)"/>
                    <label for="password" class="tips status1">请输入密码</label><br>
                </div>

                <div class="line">
                    <label for="repass" class="labelText">重输密码</label>
                    <input class="inputText" type="password" id="repass" name="repass"/>
                    <label for="repass" class="tips status1">请再次输入密码</label><br>
                </div>

                <div class="line">
                    <label for="email" class="labelText">E-mail</label>
                    <input class="inputText" type="text" id="email" name="email"/>
                    <label for="email" class="tips status1">请输入邮箱地址</label><br>
                </div>

                <div class="line">
                    <label for="phonenumber" class="labelText">手机号</label>
                    <input class="inputText" type="text" id="phonenumber" name="phonenumber"/>
                    <label for="phonenumber" class="tips status1">请输入手机号码</label><br>
                </div>

                <div class="line">
                    <label for="url" class="labelText">个人主页</label>
                    <input class="inputText" type="text" id="url" name="url" placeholder="例如：http://www.GnohiSiaM.com"/>
                    <label for="url" class="tips status1">请输入个人主页</label><br>
                </div>

                <div class="line">
                    <label for="idcard" class="labelText">身份证</label>
                    <input class="inputText" type="text" id="idcard" name="idcard"/>
                    <label for="idcard" class="tips status1">请输入身份证号</label><br>
                </div>

                <div class="line">
                    <label for="birthday" class="labelText">出生年月</label>
                    <input class="inputText" type="text" id="birthday" name="birthday"/>
                    <label for="birthday" class="tips status1">选填</label><br>
                </div>

                <div class="line">
                    <label for="address" class="labelText">居住地址</label>
                    <input class="inputText" type="text" id="address" name="address"/>
                    <label for="address" class="tips status1">选填</label><br>
                </div>

                <label style="color:#777">
                    <input type="checkbox" id="checkbox" value="true"/>
                    我已认真阅读并同意小红网的《<a href="agreement.jsp"class="link fancybox fancybox.iframe">使用协议 </a>》。
                </label>
                <input  id="submit" type="button" title="需同意协议才能注册" class="disabled" value="注册"/>
            </form>
        </div>

          <!-- Messages are shown when a link with these attributes are clicked: href="#messages" class="fancybox"  -->
          <div id="messages" style="display:none;">
               <h3 style="text-align: center">这是一个隐藏的DIV (display: none)</h3>
            <div style="display:table; background:#D4E4E4; height:420px; width:600px;">
                <div style="display:table-cell; vertical-align:middle;">
                    <div style="text-align:center;">测试居中</div>
                    <div style="margin:0px auto; background:#C1C2C3; width:70px; height:30px;"></div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            if ('${msg}' != '') {
                alert('${msg}');
            }
        </script>
    </body>
</html>
