<%@ Page Title="添加角色" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="CHSS.Web.CRole.Add" %>

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
    <script type="text/javascript">
        function selectAll(obj) {
            var checklist = obj.parentNode.parentNode.nextSibling.nextSibling.getElementsByTagName("input");
            for (var i = 0; i < checklist.length; i++) {
                checklist[i].checked = obj.checked;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">
    <li><a href="/WebForms/CRole/List.aspx">角色管理</a></li>
    <li><a href="/WebForms/CRole/UserList.aspx">用户角色设定</a></li>
    <li><a href="/WebForms/CFunction/List.aspx">功能列表</a></li>
    <li><a href="/WebForms/CModule/List.aspx">模块列表</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>添加角色</h1>

    <div style="width: 540px; margin: 0 auto;" id="MainDiv" runat="server">
        <div class="line">
            <label for="MainContent_txtRoleNumber" class="labelText">角色号</label>
            <asp:TextBox class="inputText" ID="txtRoleNumber" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtRoleName" class="labelText">角色名</label>
            <asp:TextBox class="inputText" ID="txtRoleName" runat="server"></asp:TextBox>
        </div>
        <div class="line">
            <label for="MainContent_txtRoleDescription" class="labelText">角色描述</label>
            <asp:TextBox TextMode="MultiLine" Height="80px" class="inputText" ID="txtRoleDescription" runat="server"></asp:TextBox>
        </div>
        <span class="thatSpan">------------------- 权限设置 (下次登录生效) -------------------</span>

        <asp:Repeater ID="MyRepeater" runat="server" onitemdatabound="Repeater_ItemDataBound">
            <ItemTemplate>
                <fieldset>
                    <legend><label>
                        <input type="checkbox" onchange="selectAll(this)" />
                        <asp:Label ID="MyLabel" runat="server" Text='<%# Eval("ModuName") %>'></asp:Label>
                    </label></legend>
                    <asp:CheckBoxList ID="MyCheckBoxList" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" ></asp:CheckBoxList>
               </fieldset>
           </ItemTemplate>
        </asp:Repeater>

    </div>
    <div style="width:200px;margin:10px auto;">
        <asp:Button ID="btnSave" runat="server" Text="保 存" OnClick="btnSave_Click" class="modern socle"></asp:Button>
        <asp:Button ID="btnCancle" runat="server" Text="取 消" OnClick="btnCancle_Click" class="modern socle" style="float:right;"></asp:Button>
    </div>
</asp:Content>
