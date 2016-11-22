<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>banner</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="GnohiSiaM,hellomonday">
        <meta http-equiv="description" content="you are my girl">
        <meta name="author" content="hello_monday">
        <link rel="Icon" href="static/image/apple.ico" type="image/x-icon">
        <link rel="Shortcut Icon" href="static/image/apple.ico" type="image/x-icon">
        <link rel="stylesheet" href="static/css/banner.css" type="text/css"/>
        <script src="static/js/jquery-1.10.2.min.js"></script>
    </head>
    <body style="background:#ECECEC url(static/image/bg.png)">
        <div id="banner">
            <canvas id="process">环形进度条</canvas>
            <ul id="switch_image">
                <li><a href="#"><img src="static/image/banner1.jpg" alt="" /></a><span>如果你喜欢,那就继续往下点击.</span></li>
                <li><a href="#"><img src="static/image/banner2.jpg" alt="" /></a><span>GnohiSiaM</span></li>
                <li><a href="#"><img src="static/image/banner3.jpg" alt="" /></a><span>HelloMonday</span></li>
                <li><a href="#"><img src="static/image/banner4.jpg" alt="" /></a><span>Banana</span></li>
                <li><a href="#"><img src="static/image/banner5.jpg" alt="" /></a><span>Apple</span></li>
                <li><a href="#"><img src="static/image/banner6.jpg" alt="" /></a><span>Mango</span></li>
            </ul>
            <div class="previous">&lt;</div>
            <div class="next">&gt;</div>
            <ul id="switch_index">
                <li class="active">1</li>
                <li >2</li>
                <li >3</li>
                <li >4</li>
                <li >5</li>
                <li >6</li>
            </ul>
        </div>

        <script type=text/javascript>
            //图片轮转函数
            $(document).ready(function() {
                var $banner = $('#banner'),
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
                $banner.hover(            //鼠标移动到图片上时停止切换图片
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
