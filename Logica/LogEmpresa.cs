using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using Persistencia;

namespace Logica
{
    public class LogEmpresa
    {
        PerEmpresa persistencia = new PerEmpresa();

        public Empresa BuscarEmpresa(int rut)
        {
            return persistencia.BuscarEmpresa(rut);
        }

        public void ModificarEmpresa(Empresa empresa)
        {
            persistencia.ModificarEmpresa(empresa);
        }

        public void AgregarEmpresa(Empresa empresa)
        {
            persistencia.AgregarEmpresa(empresa);
        }

        public void EliminarEmpresa(Empresa empresa)
        {
            persistencia.EliminarEmpresa(empresa);
        }

        public List<Empresa> listar()
        {
            return persistencia.ListarEmpresas();
        }
    }
}
