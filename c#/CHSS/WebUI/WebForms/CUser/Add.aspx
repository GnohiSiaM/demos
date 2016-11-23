<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Add.aspx.cs"
    Inherits="CHSS.Web.CUser.Add" Title="增加页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/validation.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/datepicker.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="/Scripts/bootstrap-datepicker.zh-CN.js" type="text/javascript" charset="UTF-8"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#MainContent_txtBornDate').datepicker({
                format: "yyyy年m月d日",
                todayBtn: "linked",
                language: "zh-CN",
                calendarWeeks: true,
                autoclose: true,
                todayHighlight: true
            });
        });
    </script>
    <style type="text/css">
        .line label{
            width:100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">
    <li><a href="/WebForms/CBusinessAgent/List.aspx">管理业务坐席</a></li>
    <li><a href="/WebForms/CAmbulance/List.aspx">管理救护车</a></li>
    <li><a href="/WebForms/CCommunityAgency/List.aspx">管理社区机构</a></li>
    <li><a href="/WebForms/CUser/List.aspx">管理用户</a></li>
    <li><a href="/WebForms/CExpert/List.aspx">管理专家</a></li>
    <li><a href="/WebForms/CMedicalEquipment/List.aspx">管理医疗设备</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>添加用户</h1>
    <div style="width: 520px; margin: 0 auto;">
        <div class="line">
            <label for="MainContent_txtRealName" class="labelText">真实姓名</label>
            <asp:TextBox class="inputText" ID="txtRealName" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtUserName" class="labelText">用户名</label>
            <asp:TextBox class="inputText" ID="txtUserName" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtPassword" class="labelText">密码</label>
            <asp:TextBox class="inputText" ID="txtPassword" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtGender" class="labelText">性别</label>
            <label class="inputText" style="line-height:34px;display:inline-block;width:180px;border-radius:0;text-align:center;"><input name="gender" type="radio" value="男" /> 男</label>
            <label class="inputText" style="line-height:34px;display:inline-block;width:180px;border-left:0;text-align:center;"><input name="gender" type="radio" value="女" /> 女</label>
        </div>
        <div class="line">
            <label for="MainContent_txtBornDate" class="labelText">出生日期</label>
            <asp:TextBox class="inputText" ID="txtBornDate" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtPhone" class="labelText">电话号码</label>
            <asp:TextBox class="inputText" ID="txtPhone" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtAddress" class="labelText">居住地址</label>
            <asp:TextBox class="inputText" ID="txtAddress" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtIDNumber" class="labelText">身份证号</label>
            <asp:TextBox class="inputText" ID="txtIDNumber" runat="server"></asp:TextBox>
        </div>
        <%--<div class="line">
            <label for="MainContent_txtRID" class="labelText">RID</label>
            <asp:TextBox class="inputText" ID="txtRID" runat="server"></asp:TextBox>
        </div>--%>
    </div>
    <div style="width:200px;margin:10px auto;">
        <asp:Button ID="btnSave" runat="server" Text="保 存" OnClick="btnSave_Click" class="modern socle"></asp:Button>
        <asp:Button ID="btnCancle" runat="server" Text="取 消" OnClick="btnCancle_Click" class="modern socle" style="float:right;"></asp:Button>
    </div>
</asp:Content>
