<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResourceManagement.aspx.cs" Inherits="WebUI.WebForms.ResourceManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>资源管理</title>
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
    <div class="linkDiv">
        <a href="/WebForms/CBusinessAgent/List.aspx">管理业务坐席</a>
    </div>
    <div class="linkDiv">
        <a href="/WebForms/CAmbulance/List.aspx">管理救护车</a>
    </div>
    <div class="linkDiv">
        <a href="/WebForms/CCommunityAgency/List.aspx">管理社区机构</a>
    </div>
    <div class="linkDiv">
        <a href="/WebForms/CUser/List.aspx">管理用户</a>
    </div>
    <div class="linkDiv">
        <a href="/WebForms/CExpert/List.aspx">管理专家</a>
    </div>
    <div class="linkDiv">
        <a href="/WebForms/CMedicalEquipment/List.aspx">管理医疗设备</a>
    </div>
</asp:Content>
