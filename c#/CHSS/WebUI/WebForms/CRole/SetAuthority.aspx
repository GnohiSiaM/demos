<%@ Page Title="设定用户角色" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetAuthority.aspx.cs" Inherits="WebUI.WebForms.CRole.SetAuthority" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        td
        {
            width: 180px; /*text-align: center;*/
            color: #666;
        }
        tr
        {
            height: 30px;
        }
        fieldset
        {
            border-radius: 9px;
            width: 560px;
            margin: 30px auto 6px;
            padding: 5px 40px 10px;
            border: 1px solid #ccc;
            color: #666;
        }
        legend
        {
            margin: 10px auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">
    <li><a href="/WebForms/CRole/List.aspx">角色管理</a></li>
    <li><a href="/WebForms/CRole/UserList.aspx">用户角色设定</a></li>
    <li><a href="/WebForms/CFunction/List.aspx">功能列表</a></li>
    <li><a href="/WebForms/CModule/List.aspx">模块列表</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>设定用户角色</h1>
    <div>
        <fieldset>
            <legend> 请为 -= <asp:Label ID="lblUserName" runat="server" Text="Label" Font-Bold="true" ></asp:Label> =- 设定角色 </legend>
            <asp:RadioButtonList ID="MyRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatColumns="3"></asp:RadioButtonList>
        </fieldset>
    </div>
    <div style="width:200px;margin:10px auto;">
        <asp:Button ID="btnSave" runat="server" Text="保 存" OnClick="btnSave_Click" class="modern socle"></asp:Button>
        <asp:Button ID="btnCancle" runat="server" Text="取 消" OnClick="btnCancle_Click" class="modern socle" style="float:right;"></asp:Button>
    </div>
</asp:Content>
