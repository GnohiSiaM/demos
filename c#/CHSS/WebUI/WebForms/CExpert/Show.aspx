<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="CHSS.Web.CExpert.Show" Title="专家详细信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/validation.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .line label
        {
            width: 100px;
        }
        #MainContent_Image
        {
            height: 110px;
            width: 110px;
            margin: 0 auto;
            display: block;
            border: 6px solid #eee;
            border-radius: 12px;
            box-shadow: 0 0 6px #333;
            position: absolute;
            right: 70px;
            top: 6px;
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
    <h1>专家详细信息</h1>
    <div style="width: 520px; margin: 0 auto; position: relative;">
        <asp:Image ID="Image" runat="server" AlternateText="头像" />
        <div class="line">
            <label for="MainContent_txtEID" class="labelText">EID</label>
            <asp:TextBox class="inputText" ID="txtEID" ReadOnly="true" runat="server" style="width: 210px;"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtExpeName" class="labelText">专家姓名</label>
            <asp:TextBox class="inputText" ID="txtExpeName" ReadOnly="true" runat="server" style="width: 210px;"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtExpePhone" class="labelText">电话号码</label>
            <asp:TextBox class="inputText" ID="txtExpePhone" ReadOnly="true" runat="server" style="width: 210px;"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtExpeAddDate" class="labelText">添加日期</label>
            <asp:TextBox class="inputText" ID="txtExpeAddDate" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtExpeDescription" class="labelText">专家描述</label>
            <asp:TextBox TextMode="MultiLine" Height="80px" ReadOnly="true" class="inputText" ID="txtExpeDescription" runat="server"></asp:TextBox>
        </div>
    </div>
    <div style="width: 200px; margin: 10px auto;">
        <input value="列 表" type="button" onclick="window.location.href='List.aspx';" class="modern socle" />
        <asp:Button ID="btnModify" runat="server" Text="编 辑" class="modern socle" OnClick="btnModify_Click" Style="float: right;"></asp:Button>
    </div>
</asp:Content>
