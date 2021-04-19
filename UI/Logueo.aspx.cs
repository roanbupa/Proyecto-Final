using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Logica;

namespace UI
{
    public partial class Logueo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //por defecto cada vez que vuelvo o paso por la defaul determino que se realizo un deslogueo
            Session["Usuario"] = null;

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                //Verifico usuario
                Entidades.Empleado unUsuario = Logica.LogEmpleado.Logueo(txtUsuario.Text.Trim(), txtContresena.Text.Trim());
                if (unUsuario != null)
                {
                    //Si entra aca es valido
                    Session["Usuario"] = unUsuario;
                    Response.Redirect("MenuPrincipal.aspx");
                }
                else
                    lblError.Text = "Datos Incorrectos";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

    }
}