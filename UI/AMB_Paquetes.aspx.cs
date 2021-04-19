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
    public partial class AMB_Paquetes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DesactivarBotones();
            DesactivarCajas();
        }

        private void DesactivarBotones()
        {
            ibtnBuscar.Enabled = true;
            ibtnAgregar.Enabled = false;
            ibtnEliminar.Enabled = false;
            ibtnModificar.Enabled = false;
        }

        private void DesactivarCajas()
        {
            txtPeso.Enabled = false;
            txtTipo.Enabled = false;
            txtDescripcion.Enabled = false;
        }

        private void LimpiarFormulario()
        {
            txtNumero.Text = string.Empty;
            txtRut.Text = string.Empty;
            txtPeso.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtTipo.Text = string.Empty;
            txtNumero.Enabled = true;
            txtRut.Enabled = true;
        }

        protected void ibtnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;
                lblMensaje.Text = string.Empty;

                if (txtRut.Text == string.Empty)
                    lblError.Text = "Ingrese rut";

                LogPaquetes logica = new LogPaquetes();
                LogEmpresa logicaempresa = new LogEmpresa();
                Empresa empresa = logicaempresa.BuscarEmpresa(Convert.ToInt32(txtRut.Text));
                if (empresa == null)
                    lblError.Text = "La empresa no existe";
                Paquete paquete = logica.BuscarPaquetePorPks(empresa.Rut, Convert.ToInt32(txtNumero.Text));
                if (paquete != null)
                {
                    Session["Paquete"] = paquete;
                    txtDescripcion.Text = paquete.Descripcion;
                    txtPeso.Text = paquete.Peso.ToString();
                    txtTipo.Text = paquete.Tipo;

                    ibtnAgregar.Enabled = false;
                    ibtnModificar.Enabled = true;
                    ibtnEliminar.Enabled = true;
                    ibtnBuscar.Enabled = false;
                    txtRut.Enabled = false;
                    txtNumero.Enabled = false;
                    txtPeso.Enabled = true;
                    txtTipo.Enabled = true;
                    txtDescripcion.Enabled = true;
                }
                else
                {
                    Session["Paquete"] = null;
                    txtRut.Enabled = false;
                    txtNumero.Enabled = false;
                   
                    txtPeso.Enabled = true;
                    txtTipo.Enabled = true;
                    txtDescripcion.Enabled = true;
                    ibtnEliminar.Enabled = false;
                    ibtnModificar.Enabled = false;
                    ibtnAgregar.Enabled = true;
                    ibtnBuscar.Enabled = false;
                }
            }
            catch
            {
                lblError.Text = ("Empresa no existe");
            }
        }

        protected void ibtnAgregar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;
                lblMensaje.Text = string.Empty;

                LogEmpresa logicaEmpresa = new LogEmpresa();
                Empresa empresa = logicaEmpresa.BuscarEmpresa(Convert.ToInt32(txtRut.Text));

                Paquete paquete = new Paquete(Convert.ToInt32(txtNumero.Text), Convert.ToInt32(txtPeso.Text), txtTipo.Text, txtDescripcion.Text, empresa);

                LogPaquetes logicaPaquete = new LogPaquetes();
                logicaPaquete.AgregarPaquete(paquete);
                lblMensaje.Text = "Paquete Agregado";

                LimpiarFormulario();
                DesactivarBotones();
                ibtnAgregar.Enabled = false;
                txtDescripcion.Enabled = false;
                txtPeso.Enabled = true;
                txtTipo.Enabled = false;
                DesactivarCajas();

            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                LimpiarFormulario();
            }
        }

        protected void ibtnModificar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;
                lblMensaje.Text = string.Empty;

                LogEmpresa logicaEmpresa = new LogEmpresa();
                Empresa empresa = logicaEmpresa.BuscarEmpresa(Convert.ToInt32(txtRut.Text));

                Paquete paquete = (Paquete)Session["Paquete"];
                paquete.Peso = Convert.ToInt32(txtPeso.Text);
                paquete.Tipo = txtTipo.Text;
                paquete.Descripcion = txtDescripcion.Text;

                LogPaquetes logicaPaquete = new LogPaquetes();
                logicaPaquete.ModificarPaquete(paquete);
                lblMensaje.Text = "Paquete Modificado";
                LimpiarFormulario();
                DesactivarBotones();
                txtRut.Enabled = true;
                txtNumero.Enabled = true;
                DesactivarCajas();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void ibtnEliminar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;
                lblMensaje.Text = string.Empty;

                LogPaquetes logica = new LogPaquetes();
                Paquete paquete = (Paquete)Session["Paquete"];
                
                logica.EliminarPaquete(paquete);
                lblMensaje.Text = "Paquete Eliminado";
                LimpiarFormulario();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                LimpiarFormulario();
                DesactivarBotones();
                DesactivarCajas();
                txtRut.Focus();
            }
        }

        protected void ibtnDeshacer_Click(object sender, ImageClickEventArgs e)
        {
            lblError.Text = string.Empty;
            lblMensaje.Text = string.Empty;
            LimpiarFormulario();
            txtRut.Focus();
        }

    }
}