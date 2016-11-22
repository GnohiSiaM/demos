<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>Agreement</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="GnohiSiaM,hellomonday">
        <meta http-equiv="description" content="you are my girl">
        <meta name="author" content="hello_monday">
        <link rel="Icon" href="static/image/apple.ico" type="image/x-icon">
        <link rel="Shortcut Icon" href="static/image/apple.ico" type="image/x-icon">
        <style>
            @font-face {
                font-family: 'beyond_wonderlandregular';
                src: url('static/font/beyond_wonderland-webfont.eot');
                src: url('static/font/beyond_wonderland-webfont.eot?#iefix') format('embedded-opentype'),
                     url('static/font/beyond_wonderland-webfont.woff') format('woff'),
                     url('static/font/beyond_wonderland-webfont.ttf') format('truetype'),
                     url('static/font/beyond_wonderland-webfont.svg#beyond_wonderlandregular') format('svg');
                font-weight: normal;
                font-style: normal;
            }
            .agreement {
                color: #066;
                margin-top: 0;
                text-align: center;
                font-family: beyond_wonderlandregular;
                font-size: 100px;
                font-weight: normal;
                font-variant: small-caps;
                text-shadow: -3px 3px 16px rgba(66, 66, 66, 0.66);
                cursor: default;
                margin-bottom: 0;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                transition: -webkit-filter 1s;
            }
            .agreement:hover {
                -webkit-filter: blur(230px);
            }
            p {
                word-break: break-all;
                word-wrap: break-word;    /* 这两行可保证网页不会被撑开 */
                color: #066;
                text-indent: 2em;
                margin-top: 1em;
                padding: 5px;
                border-bottom: 1px dashed #9C9C9C;
            }
            .box {
                width: 740px;
                margin: 20px auto;
                padding: 20px;
                box-shadow: 0px 0px 32px #666;
                background: #fff;
                background: -webkit-linear-gradient(-32deg, transparent 100px, #fff 500px);
            }
        </style>
    </head>
    <body style="background:#f0f0f0 url(static/image/bg.png); font-family:Microsoft Yahei;">
        <div class="box">
            <h1 class="agreement" >Agreement</h1>
            <P>
                GnohiSiaM网（以下简称“GnohiSiaM”）根据以下服务条款为您提供服务。这些条款可由GnohiSiaM随时更新，且毋须另行通知。GnohiSiaM使用协议（以下简称“使用协议”）一旦发生变动，GnohiSiaM将在网页上公布修改内容。修改后的使用协议一旦在网页上公布即有效代替原来的使用协议。此外，当您使用GnohiSiaM特殊服务时，您和GnohiSiaM应遵守GnohiSiaM随时公布的与该服务相关的指引和规则。前述所有的指引和规则，均构成本使用协议的一部分。
            </P>
            <p>
                您在使用GnohiSiaM提供的各项服务之前，应仔细阅读本使用协议。如您不同意本使用协议及/或随时对其的修改，请您立即停止使用GnohiSiaM网所提供的全部服务；您一旦使用GnohiSiaM服务，即视为您已了解并完全同意本使用协议各项内容，包括GnohiSiaM对使用协议随时所做的任何修改，并成为GnohiSiaM用户（以下简称“用户”）。
            </p>
            <p>
                您同意遵守中华人民共和国相关法律法规的所有规定，并对以任何方式使用您的密码和您的帐号使用本服务的任何行为及其结果承担全部责任。如您的行为违反国家法律和法规的任何规定，有可能构成犯罪的，将被追究刑事责任，并由您承担全部法律责任。
            </p>
            <p>
                同时如果GnohiSiaM有理由认为您的任何行为，包括但不限于您的任何言论和其它行为违反或可能违反国家法律和法规的任何规定，GnohiSiaM可在任何时候不经任何事先通知终止向您提供服务。
            </p>
            <p>
                为了能使用本服务，您同意以下事项：依本服务注册提示请您填写正确的注册邮箱、密码和名号，并确保今后更新的登录邮箱、名号、头像等资料的有效性和合法性。若您提供任何违法、不道德或GnohiSiaM认为不适合在GnohiSiaM上展示的资料；或者GnohiSiaM有理由怀疑你的资料属于程序或恶意操作，GnohiSiaM有权暂停或终止您的帐号，并拒绝您于现在和未来使用本服务之全部或任何部分。
            </p>
            <p>
                GnohiSiaM无须对任何用户的任何登记资料承担任何责任，包括但不限于鉴别、核实任何登记资料的真实性、正确性、完整性、适用性及/或是否为最新资料的责任。
            </p>
            <p>
                您提供的登记资料及GnohiSiaM保留的有关您的若干其它资料将受到中国有关隐私的法律和本公司《隐私声明》之规范。
            </p>
            <p>
                根据有关法律法规，GnohiSiaM在此郑重提请您注意，任何经由本服务而发布、上传的文字、资讯、资料、音乐、照片、图形、视讯、信息或其它资料（以下简称“内容 ”），无论系公开还是私下传送，均由内容提供者承担责任。GnohiSiaM仅为用户提供内容存储空间，无法控制经由本服务传送之内容，因此不保证内容的正确性、完整性或品质。您已预知使用本服务时，可能会接触到令人不快、不适当或令人厌恶之内容。在任何情况下，GnohiSiaM均不为任何内容负责，但GnohiSiaM有权依法停止传输任何前述内容并采取相应行动，包括但不限于暂停用户使用本服务的全部或部分，保存有关记录，并向有关机关报告。
            </p>
            <p>
                您了解并同意，本服务及本服务所使用之相关软件（以下简称“软件”）含有受到相关知识产权及其它法律保护之专有保密资料。您也了解并同意，经由本服务或广告商向您呈现之赞助广告或信息所包含之内容，亦受到著作权、商标权、服务商标、专利权或其它专属权利之法律保护。未经GnohiSiaM或广告商明示授权，您不得修改、出租、出借、出售、散布本服务或软件之任何部份或全部，或据以制作衍生著作，或使用擅自修改后的软件，包括但不限于为了未经授权而使用本服务之目的。GnohiSiaM仅授予您个人、不可移转及非专属之使用权，使您得于单机计算机使用其软件之目的码，但您不得（并不得允许任何第三人）复制、修改、创作衍生著作、进行还原工程、反向组译，或以其它方式发现原始码，或出售、转让、再授权或提供软件设定担保，或以其它方式移转软件之任何权利。您同意将通过由GnohiSiaM所提供的界面而非任何其它途径使用本服务。
            </p>
        </div>
    </body>
</html>
