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
    public partial class ABM_Usuarios : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            DesactivarBotones();
            DesactivarCajas();
            txtUsuario.Focus();
        }

        private void DesactivarCajas()
        {
            txtContrasena.Enabled = false;
            txtNombre.Enabled = false;
            txtConfirmarContrasena.Enabled = false;
        }

        private void DesactivarBotones()
        {
            ibtnBuscar.Enabled = true;
            ibtnAgregar.Enabled = false;
            ibtnModificar.Enabled = false;
            ibtnEliminar.Enabled = false;
        }

        private void LimpiarFormulario()
        {
            txtUsuario.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtContrasena.Text = string.Empty;
            txtConfirmarContrasena.Text = string.Empty;
            txtUsuario.Enabled = true;
        }

        protected void ibtnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblMensaje.Text = string.Empty;
                lblError.Text = string.Empty;

                if (txtUsuario.Text == string.Empty)
                    lblError.Text = "Ingrese Usuario";

                LogEmpleado logica = new LogEmpleado();

                Empleado empleado = logica.BuscarEmpleado(txtUsuario.Text.ToString());

                if (empleado != null)
                {
                    Session["Empleado"]= empleado;
                    txtNombre.Text = empleado.Nombre;
                    txtContrasena.Text = string.Empty;
                    ibtnAgregar.Enabled = false;
                    ibtnModificar.Enabled = true;
                    ibtnEliminar.Enabled = true;
                    txtUsuario.Enabled = false;
                    txtContrasena.Enabled = true;
                    txtConfirmarContrasena.Enabled = true;
                    txtNombre.Enabled = true;
                }
                else
                {
                    txtUsuario.Enabled = false;
                    ibtnAgregar.Enabled = true;
                    ibtnModificar.Enabled = false;
                    ibtnEliminar.Enabled = false;
                    txtContrasena.Enabled = true;
                    txtConfirmarContrasena.Enabled = true;
                    txtNombre.Enabled = true;
                    txtContrasena.Focus();
                    Session["Empleado"] = null;
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

                Empleado empleado = new Empleado(txtUsuario.Text, txtConfirmarContrasena.Text, txtNombre.Text);

                LogEmpleado logica = new LogEmpleado();
                logica.AgregarEmpleado(empleado);

                lblMensaje.Text = "Usuario agregado";
                LimpiarFormulario();
                DesactivarBotones();
                ibtnAgregar.Enabled = false;
                DesactivarCajas();
                txtUsuario.Focus();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                txtUsuario.Focus();
                LimpiarFormulario();
                DesactivarBotones();
                DesactivarCajas();
            }
        }

        protected void ibtnModificar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblMensaje.Text = string.Empty;
                lblError.Text = string.Empty;

                Empleado empleado = (Empleado)Session["Empleado"];

                LogEmpleado logica = new LogEmpleado();
                empleado.Nombre = txtNombre.Text;
                empleado.Pass = txtConfirmarContrasena.Text;
                
                logica.ModificarEmpleado(empleado);
                
                lblMensaje.Text = "Usuario modificado";
                LimpiarFormulario();
                DesactivarBotones();
                txtUsuario.Enabled = true;
                DesactivarCajas();
                txtUsuario.Focus();
                
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                txtUsuario.Focus();
                LimpiarFormulario();
                DesactivarBotones();
                DesactivarCajas();
            }
        }

        protected void ibtnEliminar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;
                lblMensaje.Text = string.Empty;

                Empleado empleado = (Empleado)Session["Empleado"];
                Empleado usuario = (Empleado)Session["Usuario"];
                if (empleado.Usuario == usuario.Usuario)
                {
                    lblError.Text = "No se puede eliminar el usuario logeado";
                    txtUsuario.Focus();
                    LimpiarFormulario();
                    DesactivarCajas();
                    DesactivarBotones();
                }
                else
                {
                    LogEmpleado logica = new LogEmpleado();
                    logica.EliminarEmpleado(empleado);
                    
                    lblMensaje.Text = "Usuario eliminado";
                    LimpiarFormulario();
                    DesactivarBotones();
                    DesactivarCajas();
                    txtUsuario.Focus();
                    txtUsuario.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                txtUsuario.Focus();
                LimpiarFormulario();
                DesactivarCajas();
                DesactivarBotones();
            }
        }

        protected void ibtnDeshacer_Click(object sender, ImageClickEventArgs e)
        {
            lblError.Text = string.Empty;
            lblMensaje.Text = string.Empty;
            LimpiarFormulario();
            txtUsuario.Focus();
        }
    }
}