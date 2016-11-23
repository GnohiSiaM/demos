<%@ Page Title="功能列表" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="CHSS.Web.CFunction.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/myTable.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">
    <li><a href="/WebForms/CRole/List.aspx">角色管理</a></li>
    <li><a href="/WebForms/CRole/UserList.aspx">用户角色设定</a></li>
    <li><a href="/WebForms/CFunction/List.aspx">功能列表</a></li>
    <li><a href="/WebForms/CModule/List.aspx">模块列表</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>功能列表</h1>
    <div class="keyDiv">
        <asp:TextBox ID="txtKeyword" runat="server" class="keyWord"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" class="modern socle"></asp:Button>
    </div>
    <asp:GridView ID="gridView" style="border: 0 #eee;" runat="server" AllowPaging="True" Width="100%" CellPadding="3" OnPageIndexChanging="gridView_PageIndexChanging" BorderWidth="1px"
        DataKeyNames="FID" AutoGenerateColumns="false" PageSize="10" RowStyle-HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="FID" HeaderText="功能ID" SortExpression="FID" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="FuncName" HeaderText="功能名称" SortExpression="FuncName" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="FuncAbbr" HeaderText="功能标识" SortExpression="FuncAbbr" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="MID" HeaderText="所属模块ID" SortExpression="MID" ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </asp:GridView>
</asp:Content>
