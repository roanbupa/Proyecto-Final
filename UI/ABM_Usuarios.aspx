<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABM_Usuarios.aspx.cs" Inherits="UI.ABM_Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style6
    {
        font-family: Arimo;
        color: #FFFFFF;
            height: 42px;
        }
    .style8
    {
            width: 451px;
        }
    .style9
    {
            font-family: Arimo;
            width: 451px;
        }
    .style10
    {
            width: 472px;
        }
        .style11
        {
            height: 30px;
            font-family: Arimo;
        }
        .style12
        {
            width: 472px;
            height: 30px;
        }
        .style13
        {
            height: 30px;
            font-family: Arimo;
            width: 451px;
        }
        .style14
        {
            height: 30px;
        }
        .style15
        {
            font-family: Arimo;
            color: #FFFFFF;
            height: 42px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%; height: 231px;">
    <tr>
        <td class="style15" colspan="3" 
            style="text-align: center; background-color: #0000FF; font-family: arimo;">
            <strong style="font-family: arimo"><em style="font-family: arimo; ">ABM USUARIO</em></strong></td>
    </tr>
    <tr>
        <td class="style8">
            &nbsp;</td>
        <td class="style10">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8" style="font-family: arimo">
            USUARIO:</td>
        <td class="style10" style="font-family: arimo">
            <asp:TextBox ID="txtUsuario" runat="server" Width="200px" Font-Names="Arimo" 
                Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" 
                ControlToValidate="txtUsuario" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="AgregarEditar"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:ImageButton ID="ibtnBuscar" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/icons8-search.gif" Width="35px" 
                onclick="ibtnBuscar_Click" />
        </td>
    </tr>
    <tr>
        <td class="style9" style="font-family: arimo">
            CONTRASEÑA:</td>
        <td class="style10" style="font-family: arimo">
            <asp:TextBox ID="txtContrasena" runat="server" Width="200px" Font-Names="Arimo" 
                Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvContrasena" runat="server" 
                ControlToValidate="txtContrasena" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="AgregarEditar"></asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style13" style="font-family: arimo">
            CONFIRMAR CONTRASEÑA:</td>
        <td class="style12" style="font-family: arimo">
            <asp:TextBox ID="txtConfirmarContrasena" runat="server" Width="200px" 
                Font-Names="Arimo" Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvConfirmar" runat="server" 
                ControlToValidate="txtConfirmarContrasena" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="AgregarEditar"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvConfirmarContrasena" runat="server" 
                ControlToCompare="txtContrasena" ControlToValidate="txtConfirmarContrasena" 
                ErrorMessage="Las contraseñas no coinciden" ForeColor="Red" 
                style="font-family: Arimo" ValidationGroup="AgregarEditar" 
                Font-Names="Arimo" Font-Size="13pt"></asp:CompareValidator>
        </td>
        <td class="style11">
            </td>
    </tr>
    <tr>
        <td class="style9" style="font-family: arimo">
            NOMBRE:</td>
        <td class="style10" style="font-family: arimo">
            <asp:TextBox ID="txtNombre" runat="server" Width="200px" Font-Names="Arimo" 
                Font-Size="13pt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
                ControlToValidate="txtNombre" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="AgregarEditar"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:ImageButton ID="ibtnDeshacer" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/deshacer.png" onclick="ibtnDeshacer_Click" />
        </td>
    </tr>
    <tr>
        <td class="style8">
            &nbsp;</td>
        <td class="style10" style="font-family: arimo">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
            <asp:ImageButton ID="ibtnAgregar" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/agregar.png" Width="35px" 
                onclick="ibtnAgregar_Click" ValidationGroup="AgregarEditar" />
        </td>
        <td class="style10">
            <asp:ImageButton ID="ibtnModificar" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/editar.png" Width="35px" 
                onclick="ibtnModificar_Click" ValidationGroup="AgregarEditar" />
        </td>
        <td>
            <asp:ImageButton ID="ibtnEliminar" runat="server" Height="35px" 
                ImageUrl="~/Imagenes/papelera.png" onclick="ibtnEliminar_Click" />
        </td>
    </tr>
    <tr>
        <td class="style14" colspan="3" style="font-family: arimo">
            <asp:Label ID="lblMensaje" runat="server" style="font-family: Arimo" 
                ForeColor="Green" Font-Names="Arimo" Font-Bold="False" Font-Italic="False" 
                Font-Size="13pt"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="font-family: arimo">
            <asp:Label ID="lblError" runat="server" ForeColor="Red" 
                style="font-family: Arimo" Font-Names="Arimo" Font-Size="13pt"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
