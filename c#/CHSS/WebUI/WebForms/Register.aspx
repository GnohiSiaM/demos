<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebUI.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="keywords" content="GnohiSiaM,hellomonday" />
    <meta http-equiv="description" content="you are my girl" />
    <meta name="author" content="hello_monday" />
    <link rel="Icon" href="/Images/apple.ico" type="image/x-icon" />
    <link rel="Shortcut Icon" href="/Images/apple.ico" type="image/x-icon" />
    <link href="/Styles/fancybox.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/validation.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/circle.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/datepicker.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="/Scripts/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="/Scripts/bootstrap-datepicker.zh-CN.js" charset="UTF-8"></script>
    <script src="/Scripts/fancybox.js" type="text/javascript"></script>
    <script src="/Scripts/formValidation.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".fancybox").fancybox({
                padding: 10,
                title: null
            });
            $('#birthday').datepicker({
                format: "yyyy年m月d日",
                todayBtn: "linked",
                language: "zh-CN",
                calendarWeeks: true,
                autoclose: true,
                todayHighlight: true
            });
        });
    </script>
    <style>
        p{
            word-break: break-all;
            word-wrap: break-word; /* 这两行可保证网页不会被撑开 */
            color: #066;
            text-indent: 2em;
            margin-top: 1em;
            padding: 5px;
            border-bottom: 1px dashed #9C9C9C;
        }
    </style>
</head>
<body style="background: #eee url(/Images/bg.png); margin: 0; padding: 0;">
    <form id="formRegister" runat="server" onsubmit="return validation('Submit')" autocomplete="off">
        <div class="bg"></div>

        <!-- 一个带特效的漂浮圆形登陆连接  -->
        <a href="Login.aspx" class="circle" title="Click to login">login<strong>CHSS</strong>.com </a>

        <!-- 注册表单  -->
        <div class="box shadow">
            <div class="ribbon"></div>

            <span class="subhead">
                "<a href="#agreement" class="fancybox" title="弹出DIV">服务条款</a>"、 
                "<a href="404.aspx" class="fancybox fancybox.iframe" title="弹出aspx">用户须知</a>"、
                "<a href="/Images/gear.png" class="fancybox" title="弹出图片">隐私权相关政策</a>"
            </span>
            <h2 class="mainTitle">欢迎注册社区医疗服务系统</h2>
            <div class="line">
                <label for="username" class="labelText">账 号</label>
                <asp:TextBox class="inputText" type="text" ID="username" name="username" placeholder="只能含有字母、数字、汉字及下划线" runat="server"></asp:TextBox>
                <label for="username" class="tips status1">请输入用户名</label><br />
            </div>
            <div class="line">
                <label for="password" class="labelText">密 码</label>
                <asp:TextBox class="inputText" type="password" ID="password" name="password" placeholder="请使用大小写字母、数字和符号的组合" onKeyUp="passwordGrade(this)" runat="server"></asp:TextBox>
                <label for="password" class="tips status1">请输入密码</label><br />
            </div>
            <div class="line">
                <label for="repass" class="labelText">重输密码</label>
                <asp:TextBox class="inputText" type="password" ID="repass" name="repass" runat="server"></asp:TextBox>
                <label for="repass" class="tips status1">请再次输入密码</label><br />
            </div>
            <div class="line">
                <label for="email" class="labelText">E-mail</label>
                <asp:TextBox class="inputText" type="text" ID="email" name="email" runat="server"></asp:TextBox>
                <label for="email" class="tips status1">请输入邮箱地址</label><br />
            </div>
            <div class="line">
                <label for="phonenumber" class="labelText">手机号</label>
                <asp:TextBox class="inputText" type="text" ID="phonenumber" name="phonenumber" runat="server"></asp:TextBox>
                <label for="phonenumber" class="tips status1">请输入手机号码</label><br />
            </div>
            <div class="line">
                <label for="url" class="labelText">个人主页</label>
                <asp:TextBox class="inputText" type="text" ID="url" name="url" placeholder="例如：http://www.GnohiSiaM.com" runat="server"></asp:TextBox>
                <label for="url" class="tips status1">请输入个人主页</label><br />
            </div>
            <div class="line">
                <label for="idcard" class="labelText">身份证</label>
                <asp:TextBox class="inputText" type="text" ID="idcard" name="idcard" runat="server"></asp:TextBox>
                <label for="idcard" class="tips status1">请输入身份证号</label><br />
            </div>
            <div class="line">
                <label for="address" class="labelText">居住地址</label>
                <asp:TextBox class="inputText" type="text" ID="address" name="address" runat="server"></asp:TextBox>
                <label for="address" class="tips status1">选填</label><br />
            </div>
            <div class="line">
                <label for="birthday" class="labelText">出生年月</label>
                <asp:TextBox class="inputText" type="text" ID="birthday" name="birthday" runat="server"></asp:TextBox>
                <label for="birthday" class="tips status1">选填</label><br />
            </div>
            <div class="line">
                <label class="labelText" for="">性 别</label>
                <label class="inputText" style="line-height: 34px; display: inline-block; width: 180px; border-radius: 0; text-align: center;"><input name="gender" type="radio" value="男" />男</label>
                <label class="inputText" style="line-height: 34px; display: inline-block; width: 180px; border-left: 0; text-align: center;"><input name="gender" type="radio" value="女" />女</label>
                <label class="tips status1">选填</label><br />
            </div>

            <label style="color: #777">
                <input type="checkbox" id="checkbox" value="true" />
                我已认真阅读并同意CHSS的《<a href="#agreement" class="link fancybox">使用协议 </a>》。
            </label>
            <asp:Button ID="submit" runat="server" title="需同意协议才能注册" class="disabled" Text="注册" OnClick="submit_Click" Enabled="False" />
        </div>
    </form>

    <div id="agreement" style="display: none; width: 800px;">
        <p>
            CHSS网（以下简称“CHSS”）根据以下服务条款为您提供服务。这些条款可由CHSS随时更新，且毋须另行通知。
            CHSS使用协议（以下简称“使用协议”）一旦发生变动，CHSS将在网页上公布修改内容。修改后的使用协议一旦
            在网页上公布即有效代替原来的使用协议。此外，当您使用CHSS特殊服务时，您和CHSS应遵守CHSS随时公布的与
            该服务相关的指引和规则。前述所有的指引和规则，均构成本使用协议的一部分。
        </p>
        <p>
            您在使用CHSS提供的各项服务之前，应仔细阅读本使用协议。如您不同意本使用协议及/或随时对其的修改，请您
            立即停止使用CHSS网所提供的全部服务；您一旦使用CHSS服务，即视为您已了解并完全同意本使用协议各项内容，
            包括CHSS对使用协议随时所做的任何修改，并成为CHSS用户（以下简称“用户”）。
        </p>
        <p>
            CHSS目前向用户提供如下服务：发布并分享对图书、电影、音乐的评论；收藏图书、电影、音乐；在CHSS中发布
            话题、日记、上传图片；在同城中发布或参加各类活动。除非本使用协议另有其它明示规定，增加或强化目前本
            服务的任何新功能，包括所推出的新产品，均受到本使用协议之规范。您了解并同意，本服务仅依其当前所呈现
            的状况提供，对于任何用户信息或个人化设定之时效、删除、传递错误、未予储存或其它任何问题，CHSS均不承
            担任何责任。CHSS保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。
        </p>
        <p>
            您同意遵守中华人民共和国相关法律法规的所有规定，并对以任何方式使用您的密码和您的帐号使用本服务的任何
            行为及其结果承担全部责任。如您的行为违反国家法律和法规的任何规定，有可能构成犯罪的，将被追究刑事责任，
            并由您承担全部法律责任。
        </p>
        <p>
            同时如果CHSS有理由认为您的任何行为，包括但不限于您的任何言论和其它行为违反或可能违反国家法律和法规的
            任何规定，CHSS可在任何时候不经任何事先通知终止向您提供服务。
        </p>
        <p>
            为了能使用本服务，您同意以下事项：依本服务注册提示请您填写正确的注册邮箱、密码和名号，并确保今后更新的
            登录邮箱、名号、头像等资料的有效性和合法性。若您提供任何违法、不道德或CHSS认为不适合在CHSS上展示的资料；
            或者CHSS有理由怀疑你的资料属于程序或恶意操作，CHSS有权暂停或终止您的帐号，并拒绝您于现在和未来使用本
            服务之全部或任何部分。
        </p>
        <p>
            CHSS无须对任何用户的任何登记资料承担任何责任，包括但不限于鉴别、核实任何登记资料的真实性、正确性、完整性、
            适用性及/或是否为最新资料的责任。
        </p>
        <p>
            您提供的登记资料及CHSS保留的有关您的若干其它资料将受到中国有关隐私的法律和本公司《隐私声明》之规范。
        </p>
        <p>
            根据有关法律法规，CHSS在此郑重提请您注意，任何经由本服务而发布、上传的文字、资讯、资料、音乐、照片、图形、
            视讯、信息或其它资料（以下简称“内容 ”），无论系公开还是私下传送，均由内容提供者承担责任。CHSS仅为用户
            提供内容存储空间，无法控制经由本服务传送之内容，因此不保证内容的正确性、完整性或品质。您已预知使用本服务
            时，可能会接触到令人不快、不适当或令人厌恶之内容。在任何情况下，CHSS均不为任何内容负责，但CHSS有权依法停止
            传输任何前述内容并采取相应行动，包括但不限于暂停用户使用本服务的全部或部分，保存有关记录，并向有关机关报告。
        </p>
        <p>
            您了解并同意，本服务及本服务所使用之相关软件（以下简称“软件”）含有受到相关知识产权及其它法律保护之专有
            保密资料。您也了解并同意，经由本服务或广告商向您呈现之赞助广告或信息所包含之内容，亦受到著作权、商标权、
            服务商标、专利权或其它专属权利之法律保护。未经CHSS或广告商明示授权，您不得修改、出租、出借、出售、散布本
            服务或软件之任何部份或全部，或据以制作衍生著作，或使用擅自修改后的软件，包括但不限于为了未经授权而使用本
            服务之目的。CHSS仅授予您个人、不可移转及非专属之使用权，使您得于单机计算机使用其软件之目的码，但您不得
            （并不得允许任何第三人）复制、修改、创作衍生著作、进行还原工程、反向组译，或以其它方式发现原始码，或出售、
            转让、再授权或提供软件设定担保，或以其它方式移转软件之任何权利。您同意将通过由CHSS所提供的界面而非任何其
            它途径使用本服务。
        </p>
    </div>
</body>
</html>
