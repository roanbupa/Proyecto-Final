using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using Persistencia;

namespace Logica
{
    public class LogEmpleado
    {
        PerEmpleado persistencia = new PerEmpleado();

        public static Entidades.Empleado Logueo(string pUsuario, string pPass)
        {
            return (Persistencia.PerEmpleado.Logueo(pUsuario, pPass));
        }

        public Empleado BuscarEmpleado(string usuario)
        {
            return persistencia.BuscarEmpleado(usuario);
        }

        public void AgregarEmpleado(Empleado empleado)
        {
            persistencia.AgregarEmpleado(empleado);
        }

        public void ModificarEmpleado(Empleado empleado)
        {
            persistencia.ModificarEmpleado(empleado);
        }

        public void EliminarEmpleado(Empleado usuario)
        {
            persistencia.EliminarEmpleado(usuario);
        }
    }
}
