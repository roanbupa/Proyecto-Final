<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Listado_Solicitudes_Para_El_Dia.aspx.cs" Inherits="UI.Listado_Solicitudes_Para_El_Dia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
        {
            font-family: Arimo;
            color: #0000FF;
        }
        .style9
        {
            width: 653px;
            text-align: justify;
        }
        .style10
        {
            font-family: Arimo;
            height: 42px;
            font-weight: 700;
            font-style: italic;
            color: #FFFFFF;
            text-align: center;
            background-color: #0000FF;
        }
        .style11
        {
            width: 208px;
            font-family: Arimo;
            font-weight: 700;
            font-style: italic;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; height: 201px;">
        <tr>
            <td class="style10" colspan="3" style="font-family: arimo">
                LISTADO DE SOLICITUDES POR FECHA</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4" style="font-family: arimo">
                ELEGIR FECHA:</td>
            <td style="text-align: center">
                <asp:Calendar ID="cldFecha" runat="server" BackColor="White" 
                    BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                    DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="10pt" 
                    ForeColor="#003399" Height="200px" Width="220px">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                        Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </td>
            <td>
                <asp:Button ID="btnListar" runat="server" onclick="btnListar_Click" 
                    Text="LISTAR" BackColor="#3366FF" Font-Names="Arimo" Font-Size="13pt" 
                    ForeColor="White" style="font-weight: 700" />
            </td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style9">
                <asp:GridView ID="grdSolicitudes" runat="server" AutoGenerateColumns="False" 
                    Width="950px" CellPadding="4" CssClass="style4" ForeColor="#333333" 
                    GridLines="Vertical" 
                    style="margin-left: 0px; margin-right: 25px; text-align: center;" 
                    onselectedindexchanged="grdSolicitudes_SelectedIndexChanged" 
                    Font-Names="Arimo" Font-Size="13pt">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="NumeroSistema" HeaderText="Numero de Sistema" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Direccion" HeaderText="Direccion" />
                        <asp:BoundField DataField="FechaEntrega" HeaderText="Fecha de Entrega" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                        <asp:BoundField DataField="Empleado.Usuario" HeaderText="Usuario" />
                        <asp:BoundField DataField="Paquete.Numero" HeaderText="Numero de Paquete" />
                        <asp:BoundField DataField="Paquete.Empresa.Rut" HeaderText="Rut" />
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Imagenes/mostrar.png" 
                            ShowSelectButton="True" />
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
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" colspan="3">
                <asp:Label ID="lblTituloP" runat="server" Font-Names="Arimo" Font-Size="13pt" 
                    ForeColor="Blue" Font-Bold="True" Font-Italic="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblPaquete" runat="server" 
                    style="font-family: Arimo; " Font-Bold="True" Font-Italic="True" 
                    Font-Names="Arimo" Font-Size="13pt" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8" colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" colspan="3">
                <asp:Label ID="lblTituloE" runat="server" Font-Names="Arimo" Font-Size="13pt" 
                    Font-Bold="True" Font-Italic="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblEmpresa" runat="server" 
                    style="font-family: Arimo; font-weight: 700; font-style: italic" 
                    Font-Bold="True" Font-Italic="True" Font-Names="Arimo" Font-Size="13pt" 
                    ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8" colspan="3">
                <asp:Label ID="lblError" runat="server" ForeColor="Blue" Font-Bold="True" 
                    Font-Italic="True" Font-Names="Arimo" Font-Size="13pt"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
