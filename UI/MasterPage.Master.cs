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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!(Session["Usuario"] is Empleado))
                    Response.Redirect("Default.aspx");
                Empleado emp = (Empleado)Session["Usuario"];
                lblNombre.Text = emp.Nombre.ToUpper();
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            try 
            {
                Session["Usuario"] = null;
                Response.Redirect("Default.aspx");
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;
 
            }
        }
    }
}