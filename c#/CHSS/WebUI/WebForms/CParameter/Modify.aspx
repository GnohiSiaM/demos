<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="CHSS.Web.CParameter.Modify" Title="修改参数" %>
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
    <h1>修改参数</h1>
    <div style="width: 520px; margin: 0 auto;">
        <div class="line">
            <label for="MainContent_txtPID" class="labelText">参数ID</label>
            <asp:TextBox class="inputText" ID="txtPID" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtParaName" class="labelText">参数名</label>
            <asp:TextBox class="inputText" ID="txtParaName" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtParaUnit" class="labelText">参数单位</label>
            <asp:TextBox class="inputText" ID="txtParaUnit" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtParaValue" class="labelText">参数值</label>
            <asp:TextBox class="inputText" ID="txtParaValue" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtParaMaxValue" class="labelText">最大值</label>
            <asp:TextBox class="inputText" ID="txtParaMaxValue" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtParaMiniValue" class="labelText">最小值</label>
            <asp:TextBox class="inputText" ID="txtParaMiniValue" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtParaDescription" class="labelText">参数说明</label>
            <asp:TextBox TextMode="MultiLine" Height="80px" class="inputText" ID="txtParaDescription" runat="server"></asp:TextBox>
        </div>
    </div>
    <div style="width:200px;margin:10px auto;">
        <asp:Button ID="btnSave" runat="server" Text="保 存" OnClick="btnSave_Click" class="modern socle"></asp:Button>
        <asp:Button ID="btnCancle" runat="server" Text="取 消" OnClick="btnCancle_Click" class="modern socle" style="float:right;"></asp:Button>
    </div>
</asp:Content>

