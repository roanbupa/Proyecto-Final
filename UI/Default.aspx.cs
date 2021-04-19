using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using Entidades;

namespace UI
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
               ListarSolicitudes();
               
        }

        protected void grdSolicitudes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void ListarSolicitudes()
        {
            try
            {
                LogSolicitudEntrega logSolicitud = new LogSolicitudEntrega();
                grdSolicitudes.DataSource = logSolicitud.listar();
                grdSolicitudes.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Logueo.aspx");
        }
    }
}