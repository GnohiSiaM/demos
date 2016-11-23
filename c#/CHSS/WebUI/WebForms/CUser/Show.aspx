<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Show.aspx.cs"
    Inherits="CHSS.Web.CUser.Show" Title="显示页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/validation.css" rel="stylesheet" type="text/css" />
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
    <h1>用户详细信息</h1>
    <div style="width: 520px; margin: 0 auto;">
        <div class="line">
            <label for="MainContent_UID" class="labelText">UID</label>
            <asp:TextBox class="inputText" ID="UID" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_RealName" class="labelText">真实姓名</label>
            <asp:TextBox class="inputText" ID="RealName" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_UserName" class="labelText">用户名</label>
            <asp:TextBox class="inputText" ID="UserName" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_Password" class="labelText">密码</label>
            <asp:TextBox class="inputText" ID="Password" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_Gender" class="labelText">性别</label>
            <asp:TextBox class="inputText" ID="Gender" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_BornDate" class="labelText">出生日期</label>
            <asp:TextBox class="inputText" ID="BornDate" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_Phone" class="labelText">电话号码</label>
            <asp:TextBox class="inputText" ID="Phone" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_Address" class="labelText">居住地址</label>
            <asp:TextBox class="inputText" ID="Address" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_IDNumber" class="labelText">身份证号</label>
            <asp:TextBox class="inputText" ID="IDNumber" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_RoleName" class="labelText">角色</label>
            <asp:TextBox class="inputText" ID="RoleName" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
    </div>
    <div style="width:200px;margin:10px auto;">
        <input value="列 表" type="button" OnClick="window.location.href='List.aspx';" class="modern socle"/>
        <asp:Button ID="btnModify" runat="server" Text="编 辑" class="modern socle" onclick="btnModify_Click" style="float:right;"></asp:Button>
    </div>
</asp:Content>
