﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="CHSS.Web.CFunction.Show" Title="显示页" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
                <tr>
                    <td class="tdbg">

<table cellSpacing="0" cellPadding="0" width="100%" border="0">
    <tr>
    <td height="25" width="30%" align="right">
        FID
    ：</td>
    <td height="25" width="*" align="left">
        <asp:Label id="lblFID" runat="server"></asp:Label>
    </td></tr>
    <tr>
    <td height="25" width="30%" align="right">
        FuncName
    ：</td>
    <td height="25" width="*" align="left">
        <asp:Label id="lblFuncName" runat="server"></asp:Label>
    </td></tr>
    <tr>
    <td height="25" width="30%" align="right">
        FuncAbbr
    ：</td>
    <td height="25" width="*" align="left">
        <asp:Label id="lblFuncAbbr" runat="server"></asp:Label>
    </td></tr>
    <tr>
    <td height="25" width="30%" align="right">
        MID
    ：</td>
    <td height="25" width="*" align="left">
        <asp:Label id="lblMID" runat="server"></asp:Label>
    </td></tr>
</table>

                    </td>
                </tr>
            </table>
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
</asp:Content>--%>



