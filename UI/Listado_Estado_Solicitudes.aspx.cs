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
    public partial class Listado_Estado_Solicitudes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarEmpresas();  
            }
        }

        private void ListarEmpresas()
        {
            try
            {
                LogEmpresa logicaEmpresa = new LogEmpresa();
                cboEmpresa.DataSource = logicaEmpresa.listar();
                cboEmpresa.DataValueField = "Rut";
                cboEmpresa.DataTextField = "Nombre";
                cboEmpresa.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = "Error al Listar las Empresas"  + ex.Message;
            }
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;
                lblTitulo.Text = string.Empty;
                lblSolicitud.Text = string.Empty;

                LogEmpresa logempresa = new LogEmpresa();
                Empresa empresa = logempresa.BuscarEmpresa(Convert.ToInt32(cboEmpresa.SelectedValue));
                Session["Empresa"] = empresa;

                LogPaquetes logpaquete = new LogPaquetes();
                List<Paquete> paquetes = logpaquete.PaquetePorEmpresa(empresa);

                if (paquetes.Count != 0)
                {
                    grdPaquete.DataSource = paquetes;
                    grdPaquete.DataBind();
                }
                else
                {
                    grdPaquete.DataSource = "";
                    grdPaquete.DataBind();
                    lblError.Text = "Empresas sin paquetes";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void grdPaquete_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblError.Text = string.Empty;
            lblSolicitud.Text = string.Empty;
            lblTitulo.Text = string.Empty;

            LogPaquetes logP= new LogPaquetes();
            Empresa emp = (Empresa)Session["Empresa"];
            Session["Paquete"] = logP.BuscarPaquetePorPks(emp.Rut, Convert.ToInt32(grdPaquete.SelectedRow.Cells[0].Text));

            LogSolicitudEntrega logSol = new LogSolicitudEntrega();
            SolicitudEntrega solicitud = logSol.BuscarSolicitudDeEntrega((Paquete)Session["Paquete"]);
            if (solicitud == null)
            {
                lblSolicitud.Text = "El paquete no tiene solicitud";
            }
            else
            {
                lblTitulo.Text = "Solcitud de Entrega";
                lblSolicitud.Text = solicitud.ToString();
            }
        }

    }
}