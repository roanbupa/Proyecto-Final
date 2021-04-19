<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MenuPrincipal.aspx.cs" Inherits="UI.MenuPrincipal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 386px;
            height: 251px;
        }
        .style10
        {
            height: 251px;
        }
        .style11
        {
            width: 383px;
            height: 251px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; height: 381px;">
        <tr>
            <td class="style9">
            </td>
            <td class="style11">
                <asp:Image ID="Image1" runat="server" Height="380px" 
                    ImageUrl="~/Imagenes/mundo y transporte.jpg" Width="517px" />
            </td>
            <td class="style10">
                </td>
        </tr>
    </table>
</asp:Content>
