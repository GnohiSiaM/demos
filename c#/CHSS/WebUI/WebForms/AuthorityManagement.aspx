<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AuthorityManagement.aspx.cs" Inherits="WebUI.WebForms.AuthorityManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>权限管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">
    <li><a href="/WebForms/CRole/List.aspx">角色管理</a></li>
    <li><a href="/WebForms/CRole/UserList.aspx">用户角色设定</a></li>
    <li><a href="/WebForms/CFunction/List.aspx">功能列表</a></li>
    <li><a href="/WebForms/CModule/List.aspx">模块列表</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="linkDiv">
        <a href="/WebForms/CRole/List.aspx">角色管理</a>
    </div>
    <div class="linkDiv">
        <a href="/WebForms/CRole/UserList.aspx">用户角色设定</a>
    </div>
    <div class="linkDiv">
        <a href="/WebForms/CFunction/List.aspx">功能列表</a>
    </div>
    <div class="linkDiv">
        <a href="/WebForms/CModule/List.aspx">模块列表</a>
    </div>
</asp:Content>
