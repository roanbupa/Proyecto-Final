<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AMB_Paquetes.aspx.cs" Inherits="UI.AMB_Paquetes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style5
    {
        width: 449px;
    }
    .style7
    {
        height: 42px;
        color: #FFFFFF;
    }
        .style9
        {
            width: 451px;
            font-family: Arimo;
            height: 30px;
        }
        .style10
        {
            width: 590px;
            height: 30px;
        }
        .style11
        {
            height: 30px;
        }
        .style12
        {
            height: 30px;
        }
        .style13
        {
            width: 451px;
            height: 31px;
        }
        .style14
        {
            width: 590px;
            height: 31px;
        }
        .style15
        {
            height: 31px;
        }
        .style16
        {
            width: 451px;
            font-family: Arimo;
            height: 21px;
        }
        .style17
        {
            width: 590px;
            height: 21px;
        }
        .style18
        {
            height: 21px;
        }
        .style19
        {
            width: 451px;
            font-family: Arimo;
            height: 24px;
        }
        .style20
        {
            width: 590px;
            height: 24px;
        }
        .style21
        {
            height: 24px;
        }
        .style22
        {
            height: 23px;
        }
        .style23
        {
            width: 590px;
            height: 23px;
        }
        .style24
        {
            height: 23px;
            width: 451px;
        }
        .style25
        {
            height: 42px;
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%; height: 231px;">
    <tr>
        <td class="style25" colspan="3" 
            
            style="text-align: center; font-family: Arimo; font-weight: 700; background-color: #0000FF">
            <em style="background-color: #0000FF; font-family: arimo;">ABM PAQUETES</em></td>
    </tr>
    <tr>
        <td class="style19">
            </td>
        <td class="style20">
        </td>
        <td class="style21">
            </td>
    </tr>
    <tr>
        <td class="style9" style="font-family: arimo">
            RUT:</td>
        <td class="style10" style="font-family: arimo">
            <asp:TextBox ID="txtRut" runat="server" Width="200px" Font-Names="Arimo" 
                Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvRut" runat="server" 
                ControlToValidate="txtRut" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="buscarpaquete"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpfRut" runat="server" 
                ControlToValidate="txtRut" ErrorMessage="El valor debe ser numerico" 
                ForeColor="Red" Operator="GreaterThan" style="font-family: Arimo" 
                Type="Integer" ValueToCompare="0" Font-Names="Arimo" Font-Size="13pt"></asp:CompareValidator>
        </td>
        <td class="style11">
            </td>
    </tr>
    <tr>
        <td class="style16" style="font-family: arimo">
            NUMERO:</td>
        <td class="style17" style="font-family: arimo">
            <asp:TextBox ID="txtNumero" runat="server" Width="200px" Font-Names="Arimo" 
                Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNumero" runat="server" 
                ControlToValidate="txtNumero" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="buscarpaquete"></asp:RequiredFieldValidator>
        </td>
        <td class="style18">
            <asp:ImageButton ID="ibtnBuscar" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/icons8-search.gif" onclick="ibtnBuscar_Click" 
                Width="35px" ValidationGroup="buscarpaquete" />
        </td>
    </tr>
    <tr>
        <td class="style9" style="font-family: arimo">
            PESO:</td>
        <td class="style10" style="font-family: arimo">
            <asp:TextBox ID="txtPeso" runat="server" Width="200px" Font-Names="Arimo" 
                Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPeso" runat="server" 
                ControlToValidate="txtPeso" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="agregarbuscar"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvPeso" runat="server" ControlToValidate="txtPeso" 
                ErrorMessage="Debe de ser mayor a 0" ForeColor="Red" Operator="GreaterThan" 
                style="font-family: Arimo" Type="Integer" ValidationGroup="agregarbuscar" 
                ValueToCompare="0" Font-Names="Arimo" Font-Size="13pt"></asp:CompareValidator>
        </td>
        <td class="style11">
            </td>
    </tr>
    <tr>
        <td class="style9" style="font-family: arimo">
            TIPO:</td>
        <td class="style10">
            <asp:TextBox ID="txtTipo" runat="server" Width="200px" Font-Names="Arimo" 
                Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTipo" runat="server" 
                ControlToValidate="txtTipo" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="agregarbuscar"></asp:RequiredFieldValidator>
            <asp:Label ID="lblTipo" runat="server" Text="(Fragil, Comun, Bulto)" 
                Font-Names="Arimo" Font-Size="13pt"></asp:Label>
        </td>
        <td class="style11">
            </td>
    </tr>
    <tr>
        <td class="style9" style="font-family: arimo">
            DESCRIPCION:</td>
        <td class="style10">
            <asp:TextBox ID="txtDescripcion" runat="server" Height="35px" Width="200px" 
                Font-Names="Arimo" Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" 
                ControlToValidate="txtDescripcion" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="agregarbuscar"></asp:RequiredFieldValidator>
        </td>
        <td class="style11">
            <asp:ImageButton ID="ibtnDeshacer" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/deshacer.png" onclick="ibtnDeshacer_Click" />
            </td>
    </tr>
    <tr>
        <td class="style24">
            </td>
        <td class="style23">
            </td>
        <td style="margin-left: 40px" class="style22">
            </td>
    </tr>
    <tr>
        <td class="style13">
            <asp:ImageButton ID="ibtnAgregar" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/agregar.png" onclick="ibtnAgregar_Click" Width="35px" 
                ValidationGroup="agregarbuscar" />
        </td>
        <td class="style14">
            <asp:ImageButton ID="ibtnModificar" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/editar.png" onclick="ibtnModificar_Click" 
                Width="35px" ValidationGroup="agregarbuscar" />
        </td>
        <td style="margin-left: 40px" class="style15">
            <asp:ImageButton ID="ibtnEliminar" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/papelera.png" onclick="ibtnEliminar_Click" Width="35px" />
        </td>
    </tr>
    <tr>
        <td class="style12" colspan="3">
            <asp:Label ID="lblMensaje" runat="server" ForeColor="Green" 
                style="font-family: Arimo" Font-Names="Arimo" Font-Size="13pt"></asp:Label>
            </td>
    </tr>
    <tr>
        <td class="style12" colspan="3">
            <asp:Label ID="lblError" runat="server" style="font-family: Arimo" 
                ForeColor="Red" Font-Names="Arimo" Font-Size="13pt"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
