<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registar_Solicitud.aspx.cs" Inherits="UI.Registar_Solicitud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style6
        {
        }
        .style7
        {
            font-family: Arimo;
            height: 42px;
        }
        .style8
        {
            width: 199px;
            font-family: Arimo;
        }
        .style9
        {
            font-family: Arimo;
            }
        .style10
        {
            height: 30px;
            }
        .style11
        {
            font-family: Arimo;
            width: 325px;
        }
        .style12
        {
            font-family: Arimo;
            height: 30px;
        }
        .style13
        {
            height: 30px;
        }
        .style14
        {
            font-family: Arimo;
            height: 99px;
        }
    .style15
    {
        font-family: Arimo;
        height: 42px;
    }
        .style16
        {
            height: 14px;
            width: 199px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br class="style4" />
    <table style="width:100%;">
        <tr>
            <td colspan="2" 
                
                style="text-align: center; font-style: italic; font-weight: 700; color: #FFFFFF; background-color: #0000FF; font-family: Arimo;" 
                class="style15">
                REGISTRAR SOLICITUDES</td>
        </tr>
        <tr>
            <td class="style4" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td>
    <asp:GridView ID="grdPaquetes" runat="server" AutoGenerateColumns="False" 
        onselectedindexchanged="grdPaquetes_SelectedIndexChanged" Width="750px" 
                    CellPadding="4" GridLines="None" CssClass="style4" ForeColor="#333333" 
                    style="margin-right: 0px; margin-top: 0px; text-align: center;" Height="165px" 
                    Font-Names="Arimo" Font-Size="13pt">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Numero" HeaderText="Numero" />
            <asp:BoundField DataField="empresa.Rut" HeaderText="Rut" />
            <asp:BoundField DataField="Peso" HeaderText="Peso" />
            <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
            <asp:CommandField ShowSelectButton="True" ButtonType="Image" 
                SelectImageUrl="~/Imagenes/mostrar.png" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
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
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="style10" colspan="2">
                <asp:Label ID="lblTitulo" runat="server" 
                    style="font-family: Arimo; color: #0000FF" Font-Bold="True" 
                    Font-Italic="True" Font-Names="Arimo" Font-Size="13pt" ForeColor="Blue"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style10" colspan="2">
                <asp:Label ID="lblEmpresa" runat="server" style="font-family: Arimo" 
                    Font-Bold="True" Font-Italic="True" Font-Names="Arimo" Font-Size="13pt" 
                    ForeColor="Black"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <table style="width: 100%; height: 231px;">
        <tr>
            <td class="style11">
                NOMBRE:</td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="style4" Width="200px" 
                    Font-Names="Arimo" Font-Size="13pt"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
                    ControlToValidate="txtNombre" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="confirmar"></asp:RequiredFieldValidator>
            </td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                DIRECION:</td>
            <td>
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="style4" Width="200px" 
                    Font-Names="Arimo" Font-Size="13pt"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" 
                    ControlToValidate="txtDireccion" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="confirmar"></asp:RequiredFieldValidator>
            </td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11" rowspan="2">
                FECHA DE ENTREGA:</td>
            <td rowspan="2">
                <asp:Calendar ID="cldFecha" runat="server" BackColor="White" 
                    BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                    DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="10pt" 
                    ForeColor="#003399" Height="192px" Width="220px">
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
            <td class="style14">
                </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:ImageButton ID="ImageButton1" runat="server" Height="35px" 
                    ImageUrl="~/Imagenes/deshacer.png" onclick="ImageButton1_Click" />
            </td>
        </tr>
        <tr>
            <td class="style9" colspan="2">
                <asp:Label ID="lblMensaje" runat="server" ForeColor="Green" Font-Names="Arimo" 
                    Font-Size="13pt"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnConfirmar" runat="server" BackColor="#3366FF" 
                    CssClass="style4" ForeColor="White" style="font-weight: 700" Text="Confirmar" 
                    ValidationGroup="confirmar" onclick="btnConfirmar_Click" Width="100px" 
                    Font-Names="Arimo" Font-Size="13pt" />
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
    <asp:Label ID="lblError" runat="server" CssClass="style4" ForeColor="Red" 
                    Font-Names="Arimo" Font-Size="13pt"></asp:Label>
            </td>
            <td class="style13">
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
