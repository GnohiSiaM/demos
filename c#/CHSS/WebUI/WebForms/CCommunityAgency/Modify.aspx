<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="CHSS.Web.CCommunityAgency.Modify" Title="修改社区机构信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/validation.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/datepicker.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="/Scripts/bootstrap-datepicker.zh-CN.js" type="text/javascript" charset="UTF-8"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#MainContent_txtCommAddDate').datepicker({
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
        .line label
        {
            width: 100px;
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
    <h1>修改社区机构信息</h1>
    <div style="width: 520px; margin: 0 auto;">
        <div class="line">
            <label for="MainContent_txtCID" class="labelText">CID</label>
            <asp:TextBox class="inputText" ID="txtCID" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtCommName" class="labelText">机构名称</label>
            <asp:TextBox class="inputText" ID="txtCommName" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtCommAddDate" class="labelText">添加日期</label>
            <asp:TextBox class="inputText" ID="txtCommAddDate" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtCommDescription" class="labelText">机构描述</label>
            <asp:TextBox TextMode="MultiLine" Height="80px" class="inputText" ID="txtCommDescription" runat="server"></asp:TextBox>
        </div>
    </div>
    <div style="width:200px;margin:10px auto;">
        <asp:Button ID="btnSave" runat="server" Text="保 存" OnClick="btnSave_Click" class="modern socle"></asp:Button>
        <asp:Button ID="btnCancle" runat="server" Text="取 消" OnClick="btnCancle_Click" class="modern socle" style="float:right;"></asp:Button>
    </div>
</asp:Content>
