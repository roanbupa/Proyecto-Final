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
    public partial class Registar_Solicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarPaquetesSinSolicitud();
                DesactivarCajas();
            }
        }

        public void ListarPaquetesSinSolicitud()
        {
            try
            {
                LogPaquetes logPaquete = new LogPaquetes();
                List<Paquete> paquete = logPaquete.PaqueteSinSolicitud();
                grdPaquetes.DataSource = paquete;
                grdPaquetes.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        private void DesactivarCajas()
        {
            txtDireccion.Enabled = false;
            txtNombre.Enabled = false;
            cldFecha.Enabled = false;
            btnConfirmar.Enabled = false;
        }

        private void ActivarCajas()
        {
            txtDireccion.Enabled = true;
            txtNombre.Enabled = true;
            cldFecha.Enabled = true;
            txtNombre.Focus();
            btnConfirmar.Enabled = true;
        }

        private void Limpiar()
        {
            txtDireccion.Text = string.Empty;
            txtNombre.Text = string.Empty;
            lblEmpresa.Text = string.Empty;
        }

        protected void grdPaquetes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                lblTitulo.Text = "Empresa";

                LogPaquetes logP= new LogPaquetes();
                Paquete paquete = logP.BuscarPaquetePorPks(Convert.ToInt32(grdPaquetes.SelectedRow.Cells[1].Text), 
                                                            Convert.ToInt32(grdPaquetes.SelectedRow.Cells[0].Text));
                Session["Paquete"] = logP.BuscarPaquetePorPks(paquete.Empresa.Rut,paquete.Numero);
                LogEmpresa logE = new LogEmpresa();
                Empresa empresa = logE.BuscarEmpresa(Convert.ToInt32(paquete.Empresa.Rut));

                lblEmpresa.Text = empresa.ToString();
                ActivarCajas();
                lblError.Text = string.Empty;
                lblMensaje.Text = string.Empty;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }      
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            try
            {
                Empleado emp = (Empleado)Session["Usuario"];
                Paquete paquete = (Paquete)Session["Paquete"];

                SolicitudEntrega solicitud = new SolicitudEntrega(0, txtNombre.Text, txtDireccion.Text, cldFecha.SelectedDate, "Deposito", emp, paquete);
                LogSolicitudEntrega log = new LogSolicitudEntrega();
                log.Agregar(solicitud);

                lblMensaje.Text = "Solicitud Agregada ";
                ListarPaquetesSinSolicitud();
                DesactivarCajas();
                Limpiar();
                lblEmpresa.Text = string.Empty;
                lblError.Text = string.Empty;
                lblTitulo.Text = string.Empty;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            lblEmpresa.Text = string.Empty;
            lblError.Text = string.Empty;
            lblMensaje.Text = string.Empty;
            lblTitulo.Text = string.Empty;
            ListarPaquetesSinSolicitud();
            DesactivarCajas();
            Limpiar();
        }

    }
}