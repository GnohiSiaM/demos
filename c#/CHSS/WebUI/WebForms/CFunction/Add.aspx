﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Add.aspx.cs" Inherits="CHSS.Web.CFunction.Add" Title="增加页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
        <tr>
            <td class="tdbg">

<table cellSpacing="0" cellPadding="0" width="100%" border="0">
    <tr>
    <td height="25" width="30%" align="right">
        FuncName
    ：</td>
    <td height="25" width="*" align="left">
        <asp:TextBox id="txtFuncName" runat="server" Width="200px"></asp:TextBox>
    </td></tr>
    <tr>
    <td height="25" width="30%" align="right">
        FuncAbbr
    ：</td>
    <td height="25" width="*" align="left">
        <asp:TextBox id="txtFuncAbbr" runat="server" Width="200px"></asp:TextBox>
    </td></tr>
    <tr>
    <td height="25" width="30%" align="right">
        MID
    ：</td>
    <td height="25" width="*" align="left">
        <asp:TextBox id="txtMID" runat="server" Width="200px"></asp:TextBox>
    </td></tr>
</table>

            </td>
        </tr>
        <tr>
            <td class="tdbg" align="center" valign="bottom">
                <asp:Button ID="btnSave" runat="server" Text="保存"
                    OnClick="btnSave_Click" class="inputbutton" onmouseover="this.className='inputbutton_hover'"
                    onmouseout="this.className='inputbutton'"></asp:Button>
                <asp:Button ID="btnCancle" runat="server" Text="取消"
                    OnClick="btnCancle_Click" class="inputbutton" onmouseover="this.className='inputbutton_hover'"
                    onmouseout="this.className='inputbutton'"></asp:Button>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
</asp:Content>--%>
