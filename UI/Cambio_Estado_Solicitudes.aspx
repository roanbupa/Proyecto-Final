<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cambio_Estado_Solicitudes.aspx.cs" Inherits="UI.Cambio_Estado_Solicitudes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
    {
        }
        .style9
        {
            width: 681px;
        }
        .style10
        {
            height: 41px;
            text-align: center;
            color: #FFFFFF;
            font-family: Arimo;
            font-weight: 700;
            font-style: italic;
            background-color: #0000FF;
        }
        .style11
        {
            font-weight: bold;
        }
        .style12
        {
            font-family: Arimo;
            color: #0000FF;
        }
        .style13
        {
            font-style: italic;
            font-weight: bold;
            color: #0000FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; height: 239px;">
    <tr>
        <td class="style10" colspan="3" style="font-family: arimo">
            CAMBIO DE ESTADO DE SOLICITUD</td>
    </tr>
    <tr>
        <td class="style8">
            &nbsp;</td>
        <td class="style9">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
            &nbsp;</td>
        <td class="style9">
            <asp:GridView ID="grdSolicitudes" runat="server" AutoGenerateColumns="False" 
                onselectedindexchanged="grdSolicitudes_SelectedIndexChanged" 
                CellPadding="4" CssClass="style4" ForeColor="#333333" GridLines="None" 
                Height="102px" style="text-align: center" Width="1050px" Font-Names="Arimo" 
                Font-Size="13pt">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="NumeroSistema" HeaderText="Numero de Solicitud" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Direccion" HeaderText="Direccion" />
                    <asp:BoundField DataField="FechaEntrega" HeaderText="Fecha de Entrega" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    <asp:BoundField DataField="Empleado.Usuario" HeaderText="Usuario" />
                    <asp:BoundField DataField="Paquete.Numero" HeaderText="Numero de Paquete" />
                    <asp:BoundField DataField="Paquete.Empresa.Rut" HeaderText="Rut" />
                    <asp:CommandField HeaderText="Cambiar Estado" ShowSelectButton="True" 
                        ButtonType="Image" SelectImageUrl="~/Imagenes/cambiar.png" />
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
        <td class="style4">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style13" colspan="3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style11" colspan="3">
            <asp:Label ID="lblError" runat="server" CssClass="style12" Font-Names="Arimo" 
                Font-Size="13pt" Font-Bold="True" Font-Italic="True"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
