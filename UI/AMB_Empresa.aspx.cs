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
    public partial class AMB_Empresa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DesactivarBotones();
            DesactivarCajas();
            txtRut.Focus();
        }

        private void DesactivarCajas()
        {
            txtNombre.Enabled = false;
            txtMail.Enabled = false;
            txtTelefono.Enabled = false;
        }

        private void DesactivarBotones()
        {
            imbtnBuscar.Enabled = true;
            ibtnAgregar.Enabled = false;
            ibtnEliminar.Enabled = false;
            ibtnModificar.Enabled = false;

        }

        private void LimpiarFormulario()
        {
            txtRut.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtMail.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            txtRut.Enabled = true;

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
            DesactivarBotones();
            DesactivarCajas();
            txtRut.Focus();
        }

        protected void imbtnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblMensaje.Text = string.Empty;
                lblError.Text = string.Empty;

                if (txtRut.Text == string.Empty)
                    throw new Exception("Ingrese Rut para buscar");

                LogEmpresa logica = new LogEmpresa();

                Empresa empresa = logica.BuscarEmpresa(Convert.ToInt32(txtRut.Text));

                if (empresa != null)
                {
                    Session["Empresa"] = empresa;
                    txtNombre.Text = empresa.Nombre;
                    txtMail.Text = empresa.Mail;
                    txtTelefono.Text = empresa.Telefono;
                    ibtnAgregar.Enabled = false;
                    ibtnModificar.Enabled = true;
                    ibtnEliminar.Enabled = true;
                    txtRut.Enabled = false;
                    imbtnBuscar.Enabled = false;
                    txtMail.Enabled = true;
                    txtNombre.Enabled = true;
                    txtTelefono.Enabled = true;

                }
                else
                {
                    Session["Empresa"] = null;
                    txtRut.Enabled = false;
                    ibtnAgregar.Enabled = true;
                    ibtnModificar.Enabled = false;
                    ibtnEliminar.Enabled = false;
                    txtNombre.Enabled = true;
                    txtMail.Enabled = true;
                    txtTelefono.Enabled = true;
                    txtNombre.Focus();
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void ibtnAgregar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;
                lblMensaje.Text = string.Empty;

                Empresa empresa = new Empresa(Convert.ToInt32(txtRut.Text), txtNombre.Text, txtTelefono.Text, txtMail.Text);

                LogEmpresa logica = new LogEmpresa();
                logica.AgregarEmpresa(empresa);

                lblMensaje.Text = "Empresa agregada";
                LimpiarFormulario();
                DesactivarBotones();
                ibtnAgregar.Enabled = false;
                DesactivarCajas();
                txtRut.Focus();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                txtRut.Focus();
                LimpiarFormulario();
                DesactivarBotones();
                DesactivarCajas();
            }
        }

        protected void ibtnModificar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;
                lblMensaje.Text = string.Empty;

                Empresa empresa = (Empresa)Session["Empresa"];

                LogEmpresa logica = new LogEmpresa();
                empresa.Nombre = txtNombre.Text;
                empresa.Telefono = txtTelefono.Text;
                empresa.Mail = txtMail.Text;

                logica.ModificarEmpresa(empresa);
                lblMensaje.Text = "Empresa Modificada";
                LimpiarFormulario();
                DesactivarBotones();
                txtRut.Enabled = true;
                DesactivarCajas();
                txtRut.Focus();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                txtRut.Focus();
                LimpiarFormulario();
                DesactivarBotones();
                DesactivarCajas();
            }
        }

        protected void ibtnEliminar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblMensaje.Text = string.Empty;
                lblError.Text = string.Empty;

                Empresa empresa = (Empresa)Session["Empresa"];
                LogEmpresa logica = new LogEmpresa();
                logica.EliminarEmpresa(empresa);
                lblMensaje.Text = "Empresa Eliminada";
                LimpiarFormulario();
                DesactivarBotones();
                DesactivarCajas();
                txtRut.Focus();
                txtRut.Enabled = true;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                txtRut.Focus();
                LimpiarFormulario();
                DesactivarBotones();
                DesactivarCajas();
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
