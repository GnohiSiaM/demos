<%@ Page Title="用户列表" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="WebUI.WebForms.CRole.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/myTable.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">
    <li><a href="/WebForms/CRole/List.aspx">角色管理</a></li>
    <li><a href="/WebForms/CRole/UserList.aspx">用户角色设定</a></li>
    <li><a href="/WebForms/CFunction/List.aspx">功能列表</a></li>
    <li><a href="/WebForms/CModule/List.aspx">模块列表</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>请选择要修改角色的用户</h1>
    <div class="keyDiv">
        <asp:TextBox ID="txtKeyword" runat="server" class="keyWord"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" class="modern socle"></asp:Button>
    </div>
    <asp:GridView ID="gridView" runat="server" AllowPaging="True" Width="100%" CellPadding="3"
        OnPageIndexChanging="gridView_PageIndexChanging" BorderWidth="1px" DataKeyNames="UID"
        AutoGenerateColumns="false" PageSize="8" RowStyle-HorizontalAlign="Center" style="border: 0 #eee;">
        <Columns>
            <asp:BoundField DataField="RealName" HeaderText="真实姓名" SortExpression="RealName" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="UserName" HeaderText="用户名" SortExpression="UserName" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="RoleName" HeaderText="角色" SortExpression="RoleName" ItemStyle-HorizontalAlign="Center" />
            <asp:HyperLinkField HeaderText="重设角色" ControlStyle-Width="50" DataNavigateUrlFields="UID" DataNavigateUrlFormatString="SetAuthority.aspx?id={0}" Text="修改" />
        </Columns>
    </asp:GridView>
</asp:Content>
