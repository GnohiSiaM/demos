<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebUI.Main.Index" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms"
    TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>index</title>
    <style>
        .title
        {
            color: #00A0D9;
            font-size: 80px;
            font-weight: bold;
            text-align: center;
            display: inline-block;
            width: 100%;
            letter-spacing: 5px;
            text-shadow:
                #686868 0px 0px 2px, #DDD 0px 1px 1px,
                #D6D6D6 0px 2px 1px, #CCC 0px 3px 1px,
                #C5C5C5 0px 4px 1px, #C1C1C1 0px 5px 1px,
                #BBB 0px 6px 1px, #777 0px 7px 1px,
                rgba(100, 100, 100, 0.4) 0px 8px 3px,
                rgba(100, 100, 100, 0.0980392) 0px 9px 5px,
                rgba(100, 100, 100, 0.14902) 0px 10px 7px,
                rgba(100, 100, 100, 0.2) 0px 11px 9px,
                rgba(100, 100, 100, 0.247059) 0px 12px 11px,
                rgba(100, 100, 100, 0.298039) 0px 13px 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">
    <li><a href="/WebForms/ResourceManagement.aspx">资源管理</a></li>
    <li><a href="/WebForms/CParameter/List.aspx">参数设置</a></li>
    <li><a href="/WebForms/AuthorityManagement.aspx">权限管理</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="text" runat="server" class="title" Text="…请先登录再操作…"></asp:Label>
    <span class="title">欢迎使用</span>
    <span class="title">社区医疗服务系统</span>
</asp:Content>
