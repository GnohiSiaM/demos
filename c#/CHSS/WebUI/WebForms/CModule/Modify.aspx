<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="CHSS.Web.CModule.Modify" Title="修改页" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
        <tr>
            <td class="tdbg">

<table cellSpacing="0" cellPadding="0" width="100%" border="0">
    <tr>
    <td height="25" width="30%" align="right">
        MID
    ：</td>
    <td height="25" width="*" align="left">
        <asp:label id="lblMID" runat="server"></asp:label>
    </td></tr>
    <tr>
    <td height="25" width="30%" align="right">
        ModuName
    ：</td>
    <td height="25" width="*" align="left">
        <asp:TextBox id="txtModuName" runat="server" Width="200px"></asp:TextBox>
    </td></tr>
    <tr>
    <td height="25" width="30%" align="right">
        ModuNumber
    ：</td>
    <td height="25" width="*" align="left">
        <asp:TextBox id="txtModuNumber" runat="server" Width="200px"></asp:TextBox>
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
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
</asp:Content>--%>

