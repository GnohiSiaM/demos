<%@ Page Title="角色详细内容" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="CHSS.Web.CRole.Show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Styles/validation.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/button.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .line label
        {
            width: 130px;
        }
        fieldset
        {
            border-radius: 9px;
            width: 410px;
            margin-top: 6px; 
            padding: 5px 40px 10px;
            border: 1px solid #ccc;
            color: #666;
        }
        td
        {
            width: 200px;
            /*text-align: center;*/
            color: #666;
        }
        legend
        {
            margin-left: -20px;
        }
        .thatSpan
        {
            display: inline-block;
            margin: 20px 26px 0px;
            color: #666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">
    <li><a href="/WebForms/CRole/List.aspx">角色管理</a></li>
    <li><a href="/WebForms/CRole/UserList.aspx">用户角色设定</a></li>
    <li><a href="/WebForms/CFunction/List.aspx">功能列表</a></li>
    <li><a href="/WebForms/CModule/List.aspx">模块列表</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>角色详细信息</h1>
    
    <div style="width: 540px; margin: 0 auto;" id="MainDiv" runat="server">
        <div class="line">
            <label for="MainContent_txtRID" class="labelText">RID</label>
            <asp:TextBox class="inputText" ID="txtRID" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtRoleNumber" class="labelText">角色号</label>
            <asp:TextBox class="inputText" ID="txtRoleNumber" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtRoleName" class="labelText">角色名</label>
            <asp:TextBox class="inputText" ID="txtRoleName" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtRoleDescription" class="labelText">角色描述</label>
            <asp:TextBox TextMode="MultiLine" Height="80px" class="inputText" ID="txtRoleDescription" ReadOnly="true" runat="server"></asp:TextBox>
        </div>
        <span class="thatSpan">------------------------- 权 限 设 置 -------------------------</span>

        <asp:Repeater ID="MyRepeater" runat="server" onitemdatabound="Repeater_ItemDataBound">
            <ItemTemplate>
                <fieldset>
                    <legend>
                        <asp:Label ID="MyLabel" runat="server" Text='<%# Eval("ModuName") %>'></asp:Label>
                    </legend>
                    <asp:CheckBoxList ID="MyCheckBoxList" runat="server" RepeatColumns="2" Enabled="false" RepeatDirection="Horizontal" ></asp:CheckBoxList>
               </fieldset>
           </ItemTemplate>
        </asp:Repeater>

    </div>
    
    <div style="width:200px;margin:10px auto;">
        <input value="列 表" type="button" OnClick="window.location.href='List.aspx';" class="modern socle"/>
        <asp:Button ID="btnModify" runat="server" Text="编 辑" class="modern socle" onclick="btnModify_Click" style="float:right;"></asp:Button>
    </div>
</asp:Content>
