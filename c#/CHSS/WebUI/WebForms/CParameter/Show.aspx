<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="CHSS.Web.CParameter.Show" Title="参数信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/validation.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .line label{
            width:100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">
    <li><a href="/WebForms/ResourceManagement.aspx">资源管理</a></li>
    <li><a href="/WebForms/AuthorityManagement.aspx">权限管理</a></li>
    <li><a href="/WebForms/CParameter/List.aspx">参数管理</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>参数信息</h1>
    <div style="width: 520px; margin: 0 auto;">
        <div class="line">
            <label for="MainContent_txtPID" class="labelText">参数ID</label>
            <asp:TextBox class="inputText" ID="txtPID" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtParaName" class="labelText">参数名</label>
            <asp:TextBox class="inputText" ID="txtParaName" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtParaUnit" class="labelText">参数单位</label>
            <asp:TextBox class="inputText" ID="txtParaUnit" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtParaValue" class="labelText">参数值</label>
            <asp:TextBox class="inputText" ID="txtParaValue" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtParaMaxValue" class="labelText">最大值</label>
            <asp:TextBox class="inputText" ID="txtParaMaxValue" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtParaMiniValue" class="labelText">最小值</label>
            <asp:TextBox class="inputText" ID="txtParaMiniValue" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtParaDescription" class="labelText">参数说明</label>
            <asp:TextBox TextMode="MultiLine" Height="80px" class="inputText" ID="txtParaDescription" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
    </div>
    <div style="width:200px;margin:10px auto;">
        <input value="列 表" type="button" OnClick="window.location.href='List.aspx';" class="modern socle"/>
        <asp:Button ID="btnModify" runat="server" Text="编 辑" class="modern socle" onclick="btnModify_Click" style="float:right;"></asp:Button>
    </div>
</asp:Content>
