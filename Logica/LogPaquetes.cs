using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using Persistencia;

namespace Logica
{
    public class LogPaquetes
    {
        PerPaquetes persistencia = new PerPaquetes();

        public Paquete BuscarPaquetePorPks(int rut, int Numero)
        {
            return persistencia.BuscarPaquetePorPks(rut, Numero);
        }

        public void ModificarPaquete(Paquete paquete)
        {
            persistencia.ModificarPaquete(paquete);
        }

        public void AgregarPaquete(Paquete paquete)
        {
            persistencia.AgregarPaquete(paquete);
        }

        public void EliminarPaquete(Paquete paquete)
        {
            persistencia.EliminarPaquete(paquete);
        }

        public List<Paquete> PaqueteSinSolicitud()
        {
            return persistencia.PaquetesSinSolicitudes();
        }

        public List<Paquete> PaquetePorEmpresa(Empresa empresa)
        {
            return persistencia.PaquetesPorEmpresa(empresa);
        }
    }
}
