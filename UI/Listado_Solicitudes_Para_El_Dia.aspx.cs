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
    public partial class Listado_Solicitudes_Para_El_Dia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = string.Empty;
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            try
            {
                lblEmpresa.Text = string.Empty;
                lblPaquete.Text = string.Empty;
                lblTituloE.Text = string.Empty;
                lblTituloP.Text = string.Empty;
                LogSolicitudEntrega LogSolicitud = new LogSolicitudEntrega();
                grdSolicitudes.DataSource = LogSolicitud.BuscarSolicitudesPorFecha(cldFecha.SelectedDate);
                grdSolicitudes.DataBind();
            }
            catch (Exception ex)
            {
                grdSolicitudes.DataSource = "";
                grdSolicitudes.DataBind();
                lblError.Text = ex.Message; 
            }
        }

        protected void grdSolicitudes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                LogPaquetes logP = new LogPaquetes();
                Paquete paquete = logP.BuscarPaquetePorPks(Convert.ToInt32(grdSolicitudes.SelectedRow.Cells[7].Text),
                                                               Convert.ToInt32(grdSolicitudes.SelectedRow.Cells[6].Text));
                Session["Paquete"] = logP.BuscarPaquetePorPks(paquete.Empresa.Rut, paquete.Numero);
                lblPaquete.Text = paquete.ToString();
                lblTituloP.Text = "Paquete";

                LogEmpresa logE = new LogEmpresa();
                Empresa empresa = logE.BuscarEmpresa(Convert.ToInt32(paquete.Empresa.Rut));
                lblEmpresa.Text = empresa.ToString();
                lblTituloE.Text = "Empresa";
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}