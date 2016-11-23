﻿<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="CHSS.Web.CBusinessAgent.Add" Title="添加业务坐席" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/validation.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/datepicker.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="/Scripts/bootstrap-datepicker.zh-CN.js" type="text/javascript" charset="UTF-8"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#MainContent_txtBusiAddDate').datepicker({
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
    <h1>添加业务坐席</h1>
    <div style="width: 520px; margin: 0 auto;">
        <div class="line">
            <label for="MainContent_txtBusiName" class="labelText">姓名</label>
            <asp:TextBox class="inputText" ID="txtBusiName" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtBusiAddDate" class="labelText">添加日期</label>
            <asp:TextBox class="inputText" ID="txtBusiAddDate" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtBusiPhone" class="labelText">电话号码</label>
            <asp:TextBox class="inputText" ID="txtBusiPhone" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtBusiDescription" class="labelText">设备描述</label>
            <asp:TextBox TextMode="MultiLine" Height="80px" class="inputText" ID="txtBusiDescription" runat="server"></asp:TextBox>
        </div>
    </div>
    <div style="width:200px;margin:10px auto;">
        <asp:Button ID="btnSave" runat="server" Text="保 存" OnClick="btnSave_Click" class="modern socle"></asp:Button>
        <asp:Button ID="btnCancle" runat="server" Text="取 消" OnClick="btnCancle_Click" class="modern socle" style="float:right;"></asp:Button>
    </div>
</asp:Content>
