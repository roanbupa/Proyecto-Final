<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Listado_Estado_Solicitudes.aspx.cs" Inherits="UI.Listado_Estado_Solicitudes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style6
        {
            width: 537px;
        }
        .style7
        {
            width: 298px;
            font-family: Arimo;
        }
        .style8
        {
            width: 298px;
            text-align: center;
        }
        .style9
        {
            text-align: left;
        }
        .style10
        {
            text-align: center;
        }
        .style11
        {
            width: 298px;
            text-align: center;
            font-family: Arimo;
        }
        .style12
        {
            text-align: left;
            font-family: Arimo;
        }
        .style13
        {
            text-align: center;
            font-family: Arimo;
        }
        .style14
        {
            font-family: Arimo;
            font-weight: 700;
            font-style: italic;
            color: #FFFFFF;
            height: 42px;
            text-align: center;
            background-color: #0000FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style14" colspan="3" style="font-family: Arimo">
                LISTADO DE ESTADO DE SOLICITUD</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                <span class="style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </span>
                <asp:DropDownList ID="cboEmpresa" runat="server" Height="21px" Width="282px" 
                    CssClass="style4" Font-Bold="True" Font-Italic="True" Font-Names="Arimo" 
                    Font-Size="13pt">
                </asp:DropDownList>
            </td>
            <td class="style11">
                &nbsp;</td>
            <td class="style10">
                <asp:Button ID="btnListar" runat="server" onclick="btnListar_Click" 
                    style="text-align: center; font-weight: 700;" Text="Listar" Width="100px" 
                    BackColor="#3366FF" CssClass="style4" Font-Names="Arimo" Font-Size="13pt" 
                    ForeColor="White" Font-Bold="True" />
            </td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style7">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                <asp:GridView ID="grdPaquete" runat="server" AutoGenerateColumns="False" 
                    onselectedindexchanged="grdPaquete_SelectedIndexChanged" Width="750px" 
                    CellPadding="4" CssClass="style4" ForeColor="#333333" GridLines="None" 
                    Font-Names="Arimo" Font-Size="13pt" style="text-align: center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Numero" HeaderText="Numero" />
                        <asp:BoundField DataField="Peso" HeaderText="Peso" />
                        <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                        <asp:CommandField ShowSelectButton="True" ButtonType="Image" 
                            SelectImageUrl="~/Imagenes/mostrar.png" />
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
            <td class="style11">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12" colspan="3">
                <asp:Label ID="lblTitulo" runat="server" 
                    style="font-weight: 700; font-style: italic; color: #0000FF" 
                    Font-Bold="True" Font-Italic="True" Font-Names="Arimo" Font-Size="13pt" 
                    ForeColor="Blue"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style9" colspan="3">
                <asp:Label ID="lblSolicitud" runat="server" 
                    style="font-family: Arimo; font-style: italic; font-weight: 700" 
                    Font-Bold="True" Font-Italic="True" Font-Names="Arimo" Font-Size="13pt" 
                    ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style9">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" 
                    style="text-align: left; font-family: Arimo" Font-Names="Arimo" 
                    Font-Size="13pt"></asp:Label>
            </td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
