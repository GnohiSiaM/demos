<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="WebUI._404" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>404</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="keywords" content="GnohiSiaM,hellomonday"/>
    <meta http-equiv="description" content="you are my girl"/>
    <meta name="author" content="hello_monday"/>
    <link rel="Icon" href="/Images/apple.ico" type="image/x-icon"/>
    <link rel="Shortcut Icon" href="/Images/apple.ico" type="image/x-icon"/>
    <link href="/Styles/tuckedCorners.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/flexbox.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/gear.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .body_bg {
          background: #ECECEC url(/Images/bg.png);
          font-family: Microsoft Yahei;
          font-size: 14px;
          color: #3c3c3c;
          margin: 0;
        }
        p {
            font-size: 100px;
            margin: -166px 0 0 50px;
            color: #3DB1E7;
            text-shadow:
                -1px -1px 1px rgba(255, 255, 255, 0.1),
                1px 1px 1px rgba(0, 0, 0, 0.5);
        }
        p:last-child {
            font-size: 30px;
            margin-top: -20px;
        }
        #bubble{
          position: absolute;
          width: 100%;
          height: 100%;
          top: 0;
          left: 0;
          z-index: -1;
        }
    </style>
</head>
  <body class="body_bg flexbox">

    <div class="tucked-corners-top" onclick="history.back();" title="点击返回上一页">
      <div class="tucked-corners-bottom">

          <div class="gears">
            <div class="gear gear-t">
                <img src="/Images/gear.png" alt=""/>
            </div>
            <div class="gear gear-r">
                <img src="/Images/gear.png" alt=""/>
            </div>
            <div class="gear gear-l">
                <img src="/Images/gear.png" alt=""/>
            </div>
        </div>

        <p>404</p>
        <p>正在施工,敬请期待...</p>
      </div>
    </div>

    <canvas id="bubble"></canvas>
    <script type="text/javascript">
        onload = function () {
            window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame

            canvas = document.querySelector('canvas')
            ctx = canvas.getContext('2d')

            onresize = function () {
                canvas.width = canvas.clientWidth
                canvas.height = canvas.clientHeight
            }
            onresize();


            onmousemove = function (e) {
                rect = canvas.getBoundingClientRect();
                gravityPoint = {
                    x: e.clientX - rect.left,
                    y: e.clientY - rect.top
                }
            }

            gravityPoint = {
                x: canvas.width / 2,
                y: canvas.height / 2
            }
            gravityStrength = 10
            particles = []

            calculate = function () {
                for (var i = 0; i < particles.length; i++) {
                    p = particles[i]
                    x = gravityPoint.x - p.x
                    y = gravityPoint.y - p.y
                    a = x * x + y * y
                    a = a = a > 100 ? gravityStrength / a : gravityStrength / 100
                    p.xv = (p.xv + a * x) * 0.99
                    p.yv = (p.yv + a * y) * 0.99
                    p.x += p.xv
                    p.y += p.yv
                    p.a *= 0.99
                }
            }

            draw = function () {
                ctx.clearRect(0, 0, canvas.width, canvas.height)
                for (var i = 0; i < particles.length; i++) {
                    p = particles[i]
                    ctx.globalAlpha = p.a
                    ctx.fillStyle = p.c
                    ctx.beginPath()
                    ctx.arc(p.x, p.y, p.s, 0, 2 * Math.PI)
                    ctx.fill()
                }
            }

            newParticle = function () {
                type = (Math.random() * 2 | 0)
                particles.push({
                    x: gravityPoint.x - 5 + 10 * Math.random(),
                    y: gravityPoint.y - 5 + 10 * Math.random(),
                    xv: type ? 18 * Math.random() - 9 : 24 * Math.random() - 12,
                    yv: type ? 18 * Math.random() - 9 : 24 * Math.random() - 12,
                    c: type ? 'rgba(30,' + ((250 * Math.random()) | 0) + ',' + ((230 * Math.random()) | 0) + ',0.5)' : 'rgba(107, 147, 228,0.9)',
                    s: type ? 5 + 10 * Math.random() : 1,
                    a: 1
                })
                if (particles.length > 100) { particles.shift() }
            }

            setInterval(newParticle, 50)

            loop = function () {
                draw()
                calculate()
                requestAnimationFrame(loop)
            }
            requestAnimationFrame(loop)
        }
    </script>
  </body>
</html>
