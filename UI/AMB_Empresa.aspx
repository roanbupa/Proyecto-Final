<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AMB_Empresa.aspx.cs" Inherits="UI.AMB_Empresa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style12
    {
        height: 39px;
            font-style: italic;
            text-align: center;
            color: #FFFFFF;
        background-color: #0000FF;
    }
        .style27
        {
            height: 26px;
            width: 14%;
        }
        .style28
        {
    }
        .style30
        {
            height: 26px;
            width: 55%;
        }
        .style33
    {
        height: 26px;
        font-family: Arimo;
        width: 718px;
    }
        .style34
        {
            height: 30px;
        }
        .style35
        {
            font-family: Arimo;
            width: 718px;
            height: 30px;
        }
        .style36
        {
            width: 55%;
            text-align: left;
            height: 30px;
        }
        .style37
        {
            height: 30px;
            width: 14%;
        }
        .style38
        {
            width: 55%;
            text-align: left;
        }
        .style39
        {
            width: 718px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%; height: 231px;">
    <tr>
        <td class="style12" colspan="4" bgcolor="#0066FF">
            <strong style="font-family: Arimo">ABM EMPRESAS</strong></td>
    </tr>
    <tr>
        <td colspan="2" class="style39">
            &nbsp;</td>
        <td class="style38">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" class="style39" style="font-family: arimo">
            RUT:</td>
        <td class="style38">
            <asp:TextBox ID="txtRut" runat="server" Width="200px" Font-Names="Arimo" 
                Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvRut" runat="server" 
                ControlToValidate="txtRut" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="buscarrut"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvRut" runat="server" ControlToValidate="txtRut" 
                ErrorMessage="Valor debe ser numerico" ForeColor="Red" Operator="GreaterThan" 
                Type="Integer" ValidationGroup="buscarrut" ValueToCompare="0" 
                style="font-family: Arimo" Font-Names="Arimo" Font-Size="13pt"></asp:CompareValidator>
        </td>
        <td>
            <asp:ImageButton ID="imbtnBuscar" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/icons8-search.gif" onclick="imbtnBuscar_Click" 
                ValidationGroup="buscarrut" Width="35px" />
        </td>
    </tr>
    <tr>
        <td colspan="2" class="style39" style="font-family: arimo">
            NOMBRE:</td>
        <td class="style38">
            <asp:TextBox ID="txtNombre" runat="server" Width="200px" Font-Names="Arimo" 
                Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
                ControlToValidate="txtNombre" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="agregarmodificar"></asp:RequiredFieldValidator>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="style33" style="font-family: arimo">
            TELEFONO:</td>
        <td class="style30">
            <asp:TextBox ID="txtTelefono" runat="server" Width="200px" Font-Names="Arimo" 
                Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" 
                ControlToValidate="txtTelefono" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="agregarmodificar"></asp:RequiredFieldValidator>
        </td>
        <td class="style27">
        </td>
    </tr>
    <tr>
        <td colspan="2" class="style35" style="font-family: arimo">
            MAIL:</td>
        <td class="style36">
            <asp:TextBox ID="txtMail" runat="server" Width="200px" Font-Names="Arimo" 
                Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMail" runat="server" 
                ControlToValidate="txtMail" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="agregarmodificar"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revMail" runat="server" 
                ControlToValidate="txtMail" ErrorMessage="Mail incorrecto" ForeColor="Red" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="agregarmodificar" style="font-family: Arimo" 
                Font-Names="Arimo" Font-Size="13pt"></asp:RegularExpressionValidator>
        </td>
        <td class="style37">
            <asp:ImageButton ID="ibtnDeshacer" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/deshacer.png" onclick="ibtnDeshacer_Click" />
            </td>
    </tr>
    <tr>
        <td colspan="2" class="style39">
            &nbsp;</td>
        <td class="style38">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:ImageButton ID="ibtnAgregar" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/agregar.png" onclick="ibtnAgregar_Click" 
                ValidationGroup="agregarmodificar" Width="35px" />
        </td>
        <td class="style28" colspan="2">
                    <asp:ImageButton ID="ibtnModificar" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/editar.png" onclick="ibtnModificar_Click" 
                ValidationGroup="agregarmodificar" Width="35px" />
                    </td>
        <td>
            <asp:ImageButton ID="ibtnEliminar" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/papelera.png" onclick="ibtnEliminar_Click" 
                Width="35px" />
        </td>
    </tr>
    <tr>
        <td class="style34" colspan="4">
            <asp:Label ID="lblMensaje" runat="server" style="font-family: Arimo" 
                ForeColor="Green" Font-Names="Arimo" Font-Size="13pt"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="4" class="style34">
            <asp:Label ID="lblError" runat="server" ForeColor="Red" 
                style="font-family: Arimo" Font-Names="Arimo" Font-Size="13pt"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
