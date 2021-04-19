<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="UI.Error404" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style3
        {
            height: 40px;
            font-family: Arimo;
            text-align: center;
            font-weight: 700;
            font-style: italic;
            color: #0000FF;
        }
        .style4
        {
            height: 325px;
            text-align: center;
        }
        .style5
        {
            font-family: Arimo;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%;">
            <tr>
                <td class="style3">
                    <asp:Label ID="lblError" runat="server" Font-Names="Arimo" Font-Size="30pt" 
                        ForeColor="Blue" Text="ERROR"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Image ID="lblTituloError404" runat="server" Height="203px" 
                        ImageUrl="~/Imagenes/tituloerror404.png" Width="354px" />
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Image ID="imgError404" runat="server" Height="315px" 
                        ImageUrl="~/Imagenes/error404.png" Width="434px" />
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <strong><em>&nbsp;&nbsp;&nbsp; Pagina no encontrada</em></strong></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
