<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error500.aspx.cs" Inherits="UI.Error500" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Image ID="imgError500" runat="server" Height="476px" 
                        ImageUrl="~/Imagenes/error500.png" Width="785px" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: center; font-family: Arimo; font-weight: 700; font-style: italic">
                    Error interno del servidor</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
