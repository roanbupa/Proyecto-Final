<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logueo.aspx.cs" Inherits="UI.Logueo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 300px;
            text-align: center;
            height: 34px;
        }
        .style3
        {
            font-family: Arimo;
            }
        .style14
        {
            font-family: Arimo;
            width: 248px;
            height: 34px;
        }
        .style25
        {
            height: 28px;
            width: 248px;
        }
        .style26
        {
            width: 300px;
            text-align: center;
            height: 28px;
        }
        .style28
        {
            width: 300px;
            text-align: center;
            height: 45px;
        }
        .style29
        {
            height: 45px;
            width: 248px;
        }
        .style30
        {
            color: #FFFFFF;
        }
        #form1
        {
            height: 565px;
            width: 1279px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="right" 
        style="background-image: url('Imagenes/mundo.jpg'); background-repeat: no-repeat; height: 701px; width: 1275px; z-index: 1; left: 10px; top: 15px; position: absolute;">
    
        <table style="width:33%; height: 124px;">
            <tr>
                <td class="style14" style="font-family: arimo">
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style14" style="font-family: arimo">
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style14" style="font-family: arimo">
                    <span class="style30">USUARIO</span></td>
                <td class="style1">
                    <asp:TextBox ID="txtUsuario" runat="server" Width="200px" CssClass="style3" 
                        Font-Names="Arimo" Font-Size="13pt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" 
                        ControlToValidate="txtUsuario" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="validarusu" CssClass="style3"></asp:RequiredFieldValidator>
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="font-family: arimo" class="style25">
                    <span class="style30">CONTRASEÑA</span>:</td>
                <td class="style26">
                    <asp:TextBox ID="txtContresena" runat="server" TextMode="Password" 
                        ValidationGroup="validarusu" Width="200px" CssClass="style3" 
                        Font-Names="Arimo" Font-Size="13pt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtContresena" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="validarusu" CssClass="style3"></asp:RequiredFieldValidator>
                </td>
                <td class="style26">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style29" style="font-family: Arimo; text-align: center;">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                <td class="style28">
                    <asp:Button ID="btnLogin" runat="server" BackColor="#3366FF" ForeColor="White" 
                        Text="Login" ValidationGroup="validarusu" Width="100px" 
                        onclick="btnLogin_Click" CssClass="style3" Font-Names="Arimo" 
                        Font-Size="13pt" Font-Bold="True" Font-Overline="False" 
                        Font-Strikeout="False" />
                </td>
                <td class="style28">
                    &nbsp;</td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>
