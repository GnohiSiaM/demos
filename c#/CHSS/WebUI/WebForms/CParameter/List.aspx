<%@ Page Title="参数表" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="CHSS.Web.CParameter.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/myTable.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">
    <li><a href="/WebForms/ResourceManagement.aspx">资源管理</a></li>
    <li><a href="/WebForms/AuthorityManagement.aspx">权限管理</a></li>
    <li><a href="/WebForms/CParameter/List.aspx">参数管理</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>参数表</h1>
    <div class="keyDiv">
        <asp:TextBox ID="txtKeyword" runat="server" class="keyWord"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" class="modern socle"></asp:Button>
    </div>
    <asp:GridView ID="gridView" style="border: 0 #eee;" runat="server" AllowPaging="True" Width="100%" CellPadding="3" OnPageIndexChanging="gridView_PageIndexChanging" BorderWidth="1px"
        DataKeyNames="PID" OnRowDataBound="gridView_RowDataBound" AutoGenerateColumns="false" PageSize="10" RowStyle-HorizontalAlign="Center" OnRowCreated="gridView_OnRowCreated">
        <Columns>
            <asp:TemplateField ControlStyle-Width="30" HeaderText="选择">
                <ItemTemplate>
                    <asp:CheckBox ID="DeleteThis" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ParaName" HeaderText="参数名" SortExpression="ParaName" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="ParaValue" HeaderText="参数值" SortExpression="ParaValue" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="ParaMaxValue" HeaderText="最大值" SortExpression="ParaMaxValue" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="ParaMiniValue" HeaderText="最小值" SortExpression="ParaMiniValue" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="ParaUnit" HeaderText="参数单位" SortExpression="ParaUnit" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="ParaDescription" HeaderText="参数说明" SortExpression="ParaDescription" ItemStyle-HorizontalAlign="Center" />
            <asp:HyperLinkField HeaderText="详细" ControlStyle-Width="50" DataNavigateUrlFields="PID" DataNavigateUrlFormatString="Show.aspx?id={0}" Text="详细" />
            <asp:HyperLinkField HeaderText="编辑" ControlStyle-Width="50" DataNavigateUrlFields="PID" DataNavigateUrlFormatString="Modify.aspx?id={0}" Text="编辑" />
            <asp:TemplateField ControlStyle-Width="50" HeaderText="删除" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div style="width:200px;margin:10px auto;">
        <asp:Button ID="btnDelete" runat="server" Text="删 除" OnClick="btnDelete_Click" class="modern socle"></asp:Button>
        <asp:Button ID="btnAdd" runat="server" Text="添 加" onclick="btnAdd_Click" class="modern socle" style="float:right;"></asp:Button>
    </div>
</asp:Content>
