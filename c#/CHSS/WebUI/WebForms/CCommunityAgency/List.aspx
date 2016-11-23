﻿<%@ Page Title="社区机构列表" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="CHSS.Web.CCommunityAgency.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/myTable.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
    <style>
        td:nth-child(3)
        {
            width: 45%;
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
    <h1>社区机构列表</h1>
    <div class="keyDiv">
        <asp:TextBox ID="txtKeyword" runat="server" class="keyWord"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" class="modern socle"></asp:Button>
    </div>
    <br />
    <asp:GridView ID="gridView" style="border: 0 #eee;" runat="server" AllowPaging="True" Width="100%" CellPadding="3" OnPageIndexChanging="gridView_PageIndexChanging" BorderWidth="1px"
        DataKeyNames="CID" OnRowDataBound="gridView_RowDataBound" AutoGenerateColumns="false" PageSize="10" RowStyle-HorizontalAlign="Center" OnRowCreated="gridView_OnRowCreated">
        <Columns>
            <asp:TemplateField ControlStyle-Width="30" HeaderText="选择">
                <ItemTemplate>
                    <asp:CheckBox ID="DeleteThis" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CommName" HeaderText="名称" SortExpression="CommName" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="CommDescription" HeaderText="社区机构描述" SortExpression="CommDescription" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="CommAddDate" HeaderText="添加日期" SortExpression="CommAddDate" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="RealName" HeaderText="最后编辑人" SortExpression="RealName" ItemStyle-HorizontalAlign="Center" />
            <%--<asp:BoundField DataField="UID" HeaderText="UID" SortExpression="UID" ItemStyle-HorizontalAlign="Center" />--%>
            <asp:HyperLinkField HeaderText="详细" ControlStyle-Width="50" DataNavigateUrlFields="CID" DataNavigateUrlFormatString="Show.aspx?id={0}" Text="详细" />
            <asp:HyperLinkField HeaderText="编辑" ControlStyle-Width="50" DataNavigateUrlFields="CID" DataNavigateUrlFormatString="Modify.aspx?id={0}" Text="编辑" />
            <asp:TemplateField ControlStyle-Width="50" HeaderText="删除" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div style="width: 200px; margin: 10px auto;">
        <asp:Button ID="btnDelete" runat="server" Text="删 除" OnClick="btnDelete_Click" class="modern socle"></asp:Button>
        <asp:Button ID="btnAdd" runat="server" Text="添 加" OnClick="btnAdd_Click" class="modern socle" Style="float: right;"></asp:Button>
    </div>
</asp:Content>
