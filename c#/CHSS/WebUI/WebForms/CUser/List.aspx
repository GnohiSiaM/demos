<%@ Page Title="用户列表" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="CHSS.Web.CUser.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/myTable.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
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
    <h1>用户列表</h1>
    <div class="keyDiv">
        <asp:TextBox ID="txtKeyword" runat="server" class="keyWord"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" class="modern socle"></asp:Button>
    </div>
    <asp:GridView ID="gridView" runat="server" AllowPaging="True" Width="100%" CellPadding="3"
        OnPageIndexChanging="gridView_PageIndexChanging" BorderWidth="1px" DataKeyNames="UID"
        OnRowDataBound="gridView_RowDataBound" AutoGenerateColumns="false" PageSize="8"
        RowStyle-HorizontalAlign="Center" OnRowCreated="gridView_OnRowCreated" style="border: 0 #eee;">
        <Columns>
            <asp:TemplateField ControlStyle-Width="30" HeaderText="选择">
                <ItemTemplate>
                    <asp:CheckBox ID="DeleteThis" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RealName" HeaderText="姓名" SortExpression="RealName" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="UserName" HeaderText="用户名" SortExpression="UserName" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="RoleName" HeaderText="角色" SortExpression="RoleName" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Gender" HeaderText="性别" SortExpression="Gender" ItemStyle-HorizontalAlign="Center" />
            <%--<asp:BoundField DataField="BornDate" HeaderText="出生日期" SortExpression="BornDate" ItemStyle-HorizontalAlign="Center" />--%>
            <asp:BoundField DataField="Address" HeaderText="地址" SortExpression="Address" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="IDNumber" HeaderText="身份证" SortExpression="IDNumber" ItemStyle-HorizontalAlign="Center" />
            <%--<asp:BoundField DataField="RID" HeaderText="RID" SortExpression="RID" ItemStyle-HorizontalAlign="Center" />--%>
            <%--<asp:BoundField DataField="Password" HeaderText="密码" SortExpression="Password" ItemStyle-HorizontalAlign="Center" />--%>
            <asp:BoundField DataField="Phone" HeaderText="电话号码" SortExpression="Phone" ItemStyle-HorizontalAlign="Center" />
            <asp:HyperLinkField HeaderText="详细" ControlStyle-Width="50" DataNavigateUrlFields="UID" DataNavigateUrlFormatString="Show.aspx?id={0}" Text="详细" />
            <asp:HyperLinkField HeaderText="编辑" ControlStyle-Width="50" DataNavigateUrlFields="UID" DataNavigateUrlFormatString="Modify.aspx?id={0}" Text="编辑" />
        </Columns>
    </asp:GridView>
    <div style="width:200px;margin:10px auto;">
        <asp:Button ID="btnDelete" runat="server" Text="删 除" OnClick="btnDelete_Click" class="modern socle"></asp:Button>
        <asp:Button ID="btnAdd" runat="server" Text="添 加" onclick="btnAdd_Click" class="modern socle" style="float:right;"></asp:Button>
    </div>
</asp:Content>
