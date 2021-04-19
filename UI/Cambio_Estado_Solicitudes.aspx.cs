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
    public partial class Cambio_Estado_Solicitudes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListarSolicitudes();
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

        protected void grdSolicitudes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                LogEmpresa logEmp = new LogEmpresa();
                Session["Emp"] = logEmp.BuscarEmpresa(Convert.ToInt32(grdSolicitudes.SelectedRow.Cells[7].Text));

                LogPaquetes logPaquete = new LogPaquetes();
                Session["Paq"] = logPaquete.BuscarPaquetePorPks(Convert.ToInt32(grdSolicitudes.SelectedRow.Cells[7].Text),
                                                                    Convert.ToInt32(grdSolicitudes.SelectedRow.Cells[6].Text));
                LogSolicitudEntrega logSolicitud = new LogSolicitudEntrega();
                Session["Solicitud"] = logSolicitud.BuscarSolicitudDeEntrega((Paquete)Session["Paq"]);
                logSolicitud.CambiarEstado((SolicitudEntrega)Session["Solicitud"]);
                lblError.Text = "Estado Cambiado";
                ListarSolicitudes();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

    }
}