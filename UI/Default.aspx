<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 484px;
        }
        .style3
        {
            width: 229px;
            height: 120px;
        }
        .style5
        {
            height: 120px;
        }
        .style6
        {
            font-family: Arimo;
            text-align: center;
        }
        .style8
        {
            width: 229px;
            font-family: Arimo;
        }
        .style9
        {
            height: 32px;
        }
        .style10
        {
            width: 484px;
            height: 32px;
        }
        .style11
        {
            height: 32px;
            width: 229px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:98%; height: 499px;">
            <tr>
                <td class="style11">
                    <asp:Button ID="btnLogIn" runat="server" BackColor="#3366FF" ForeColor="White" 
                        Text="Login" Width="100px" onclick="btnLogIn_Click" 
                        style="text-align: center; font-family: Arimo; font-weight: 700" 
                        Font-Names="Arimo" Font-Size="13pt" Font-Bold="True" />
                    </td>
                <td class="style10">
                </td>
                <td class="style9">
                    </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td style="text-align: center">
                    <asp:Image ID="imbLogo" runat="server" Height="247px" 
                        ImageUrl="~/Imagenes/logo.jpg" Width="419px" CssClass="style6" />
                </td>
                <td class="style5">
                    </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style2">
                    <asp:GridView ID="grdSolicitudes" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        onselectedindexchanged="grdSolicitudes_SelectedIndexChanged" 
                        CssClass="style6" style="margin-right: 0px; margin-top: 0px" Width="750px" 
                        Font-Names="Arimo" Font-Size="13pt">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="NumeroSistema" HeaderText="Numero de Solicitud" />
                            <asp:BoundField DataField="Direccion" HeaderText="Direccion" />
                            <asp:BoundField DataField="FechaEntrega" HeaderText="Fecha de Entrega" />
                            <asp:BoundField DataField="Estado" HeaderText="Estado" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
                <td style="text-align: right">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" colspan="3">
                    <asp:Label ID="lblError" runat="server" CssClass="style6" ForeColor="Red" 
                        Font-Names="Arimo" Font-Size="13pt"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
