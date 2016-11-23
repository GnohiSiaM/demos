<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ParameterSetting.aspx.cs" Inherits="WebUI.WebForms.ParameterSetting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>参数设置</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">
    <li><a href="#">增加系统运行参数</a></li>
    <li><a href="#">删除系统运行参数</a></li>
    <li><a href="#">查看系统运行参数</a></li>
    <li><a href="#">修改系统运行参数</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="linkDiv">
        <a href="#">增加系统运行参数</a>
    </div>
    <div class="linkDiv">
        <a href="#">删除系统运行参数</a>
    </div>
    <div class="linkDiv">
        <a href="#">查看系统运行参数</a>
    </div>
    <div class="linkDiv">
        <a href="#">修改系统运行参数</a>
    </div>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />

</asp:Content>
