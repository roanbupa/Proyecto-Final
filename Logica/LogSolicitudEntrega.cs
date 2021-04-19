using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using Persistencia;
namespace Logica
{
    public class LogSolicitudEntrega
    {
        PerSolicitudEntrega persistencia = new PerSolicitudEntrega();

        public List<SolicitudEntrega> listar()
        {
            return persistencia.ListarSolicitudes();
        }

        public void Agregar(SolicitudEntrega solicitud)
        {
            persistencia.Agregar(solicitud);
        }

        public SolicitudEntrega BuscarSolicitudDeEntrega(Paquete paq)
        {
             return persistencia.BuscarSolicitudesDeEntrega(paq);
        }

        public void CambiarEstado(SolicitudEntrega solicitud)
        {
            persistencia.CambiarEstado(solicitud);
        }

        public List<SolicitudEntrega> BuscarSolicitudesPorFecha(DateTime fecha)
        {
            List<SolicitudEntrega> solicitudes = persistencia.BuscarSolicitudesPorFecha(fecha);
            if (solicitudes.Count == 0)
                throw new Exception("No hay Solicitudes para : " + fecha.ToShortDateString());
            return solicitudes;
        }
      
    }
}
