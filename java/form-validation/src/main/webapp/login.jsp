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
        <link rel="Icon" href="static/image/apple.ico" type="image/x-icon">
        <link rel="Shortcut Icon" href="static/image/apple.ico" type="image/x-icon">
        <link rel="stylesheet" href="static/css/validation.css" type="text/css"/>
        <link rel="stylesheet" href="static/css/button.css" type="text/css"/>
        <link rel="stylesheet" href="static/css/carousel.css" type="text/css"/>
        <style type="text/css">
            .loginBox {
                background: #FAFAFA;
                width: 314px;
                margin-left: 70%;
                position:absolute;
                height: 100%;
            }
            .loginBox:before, .loginBox:after {
                position: absolute;
                content: "";
                height: 100%;
                width: 23%;
                border-radius: 50%;
                top: 0;
                z-index: -1;
            }
            .loginBox:before {
                left: 4%;
                box-shadow: -23px 0px 40px rgba(0,0,0,0.32);
            }
            .loginBox:after {
                right: 4%;
                box-shadow: 23px 0px 40px rgba(0,0,0,0.32);
            }
            @font-face {
              font-family: 'komika_axisregular';
              src: url('static/font/komikax_-webfont.eot');
              src: url('static/font/komikax_-webfont.eot?#iefix') format('embedded-opentype'),
                   url('static/font/komikax_-webfont.woff') format('woff'),
                   url('static/font/komikax_-webfont.ttf') format('truetype'),
                   url('static/font/komikax_-webfont.svg#komika_axisregular') format('svg');
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
        <script src="static/js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                if ($('#name').value == '') {
                    $('#name').focus();
                } else {
                    $('#password').focus();
                }
            }
        </script>
    </head>

    <body style="margin:0; padding:0; background:#f0f0f0 url(static/image/bg.png); font-family:Microsoft Yahei;">
        <script>
            if ('null' != '<%=request.getSession().getAttribute("name")%>') {
                window.location = 'index.jsp';
            }
        </script>

        <div id="carousel">
            <canvas id="process">环形进度条</canvas>
            <ul id="switch_image">
                <li><a href="#"><img src="static/image/carousel1.jpg" /></a><span>welcome</span></li>
                <li><a href="#"><img src="static/image/carousel2.jpg" /></a><span>GnohiSiaM</span></li>
                <li><a href="#"><img src="static/image/carousel3.jpg" /></a><span>hello monday</span></li>
                <li><a href="#"><img src="static/image/carousel4.jpg" /></a><span>apple</span></li>
                <li><a href="#"><img src="static/image/carousel5.jpg" /></a><span>banana</span></li>
                <li><a href="#"><img src="static/image/carousel6.jpg" /></a><span>mango</span></li>
            </ul>
            <div class="previous">➤</div>
            <div class="next">➤</div>
            <ul id="switch_index">
                <li class="active">1</li>
                <li >2</li>
                <li >3</li>
                <li >4</li>
                <li >5</li>
                <li >6</li>
            </ul>
        </div>

        <div class="loginBox">
            <span class="GnohiSiaM">GnohiS<b>iaM</b></span>
            <form action="login" method="post">
                <div class="line" style="margin: 20px 30px;">
                    <label for="name" class="labelText" style="width: 60px;">账 号</label>
                    <%
                        String name = null == request.getParameter("name") ? "" : new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
                    %>
                    <input class="inputText" style="width: 190px;" type="text" id="name" name="name" value="<%=name%>" required/>
                </div>

                <div class="line" style="margin: 20px 30px;">
                    <label for="password" class="labelText" style="width: 60px;">密 码</label>
                    <input class="inputText" style="width: 190px;" type="password" id="password" name="password" required/>
                </div>
                <a class="astyle" href="404.jsp">忘记密码?</a>

                <div class="line" style="margin: 20px 30px;">
                    <label for="code" class="labelText" style="width: 60px;">验证码</label>
                    <input class="inputText" style="width: 102px;" type="text" name="code" id="code" required/>
                    <img src="validateCode" alt="验证码" onclick="this.src='validateCode?'+Math.random();" class="checkCode" id="codeImg" title="点击更换"/>
                </div>

                <button class="modern socle" type="submit" style="margin-left:70px">登 录</button>
                <button class="modern socle" type="button" style="margin-left:40px" onclick="window.location.href='register.jsp'">注 册</button>
                <h3 class="h3style">${msg}</h3>
            </form>
        </div>

        <script type=text/javascript>
            //图片轮转函数
            $(document).ready(function() {
                var $carousel = $('#carousel'),
                    $switch_index = $('#switch_index li'),
                    $switch_image = $('#switch_image li'),
                    $previous = $('.previous'),
                    $next = $('.next'),
                    $canvas = $('#process'),
                    index = 0,
                    timer, timerOfBar,
                    radius = 18,
                    process = 0,
                    context = $canvas[0].getContext('2d');    // 拿到绘图上下文,目前只支持"2d"
                    //$canvas[0]或$canvas.get(0)可以将jQuery对象转换成DOM对象

                //!-----圆环进度条-----
                $canvas.attr('width', 2 * radius).attr('height', 2 * radius);    //设定canvas控件的大小
                //设定线条的式样
                context.lineCap="round";
                context.shadowColor = 'rgba(0,0,0,0.5)';
                context.shadowOffsetX = 0;
                context.shadowOffsetY = 0;
                context.shadowBlur = 3;
                context.lineWidth = 3;
                // 画背景圆环
                function drawCircle() {
                    context.clearRect(0, 0, 2 * radius, 2 * radius);    //将绘图区域清空
                    context.beginPath();
                    //圆心(r,r),半径r-4,从角度0(弧度)开始,画到2PI结束,最后一个参数是方向顺时针还是逆时针
                    context.arc(radius, radius, radius - 4, 0, Math.PI * 2, true);
                    context.strokeStyle = 'rgba(190, 190, 190, .8)';
                    context.closePath();
                    context.stroke();    //与画实心圆的区别,fill是填充,stroke是画线
                }
                // 画圆弧
                function drawArc() {
                    process = process < 99 ? process + 1 : 0;    //设定进度
                    context.beginPath();
                    context.arc(radius, radius, radius-4, -Math.PI/2, Math.PI*2*process/100-Math.PI/2, false);
                    context.strokeStyle = 'rgba(255, 255, 255, .8)';
                    context.stroke();
                    context.closePath();
                }
                // 画圆环进度条
                function drawProcess() {
                    drawCircle();
                    drawArc();
                }
                //----------!

                function getNext() {        //获取下一张图片
                    index = index < 5 ? index + 1 : 0 ;
                    change(index);
                }
                function getPrevious() {    //获取上一张图片
                    index = index > 0 ? index - 1 : 5 ;
                    change(index);
                }
                function change(n) {        //切换图片
                    $switch_image.fadeOut('normal').eq(n).fadeIn('normal');
                    $switch_index.removeClass('active').eq(n).addClass('active').blur();
                    process = 0;
                }
                function autoRun() {        //自动执行切换下一张图片功能，时间间隔为3000毫秒
                    timerOfBar = setInterval(drawProcess, 30);
                    timer = setInterval(getNext, 3000);
                }

                autoRun();
                $carousel.hover(            //鼠标移动到图片上时停止切换图片
                    function() {
                        $previous.add($next).stop(true, true).fadeIn('normal');
                        $canvas.fadeOut('normal');
                        clearInterval(timer);
                        clearInterval(timerOfBar);
                    },
                    function() {
                        $previous.add($next).fadeOut('normal');
                        $canvas.stop(true, true).fadeIn('normal');
                        process = 0;
                        autoRun();
                    }
                );
                $switch_index.on('click',function() {    //根据编号切换图片
                    var temp = $(this).html() - 1;
                    if (index != temp) {
                        index = temp;
                        change(index);
                    }
                });
                $previous.on('click', getPrevious);
                $next.on('click', getNext);
            });
        </script>
    </body>
</html>
