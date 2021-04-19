using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using System.Data.SqlClient;

namespace Persistencia
{

    public class PerSolicitudEntrega
    {

        public List<SolicitudEntrega> ListarSolicitudes()
        {
            SqlConnection cnn = new SqlConnection(Conexion.connectionString);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("sp_ListarSolicitudes", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader dr;
            List<SolicitudEntrega> Lista = new List<SolicitudEntrega>();

            try
            {
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    PerEmpleado perEmp = new PerEmpleado();
                    Empleado emp = perEmp.BuscarEmpleado(dr["Usuario"].ToString());
                    PerPaquetes perPaq = new PerPaquetes();
                    Paquete paq = perPaq.BuscarPaquetePorPks(Convert.ToInt32(dr["Rut"]), Convert.ToInt32(dr["Numero"]));
                    SolicitudEntrega solicitud = new SolicitudEntrega(Convert.ToInt32(dr["NumeroSistema"]), dr["Nombre"].ToString(),
                                                               dr["Direccion"].ToString(), Convert.ToDateTime(dr["FechaEntrega"]),
                                                               dr["Estado"].ToString(), emp, paq);
                    Lista.Add(solicitud);
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cnn.Close();
            }
            return Lista;
        }

        public void Agregar(SolicitudEntrega solicitud)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_AgregarSolicitudDeEntrega", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Nombre", solicitud.Nombre);
            cmd.Parameters.AddWithValue("Direccion", solicitud.Direccion);
            cmd.Parameters.AddWithValue("fechaEntrega", solicitud.FechaEntrega);
            cmd.Parameters.AddWithValue("Estado", solicitud.Estado);
            cmd.Parameters.AddWithValue("Usuario", solicitud.Empleado.Usuario);
            cmd.Parameters.AddWithValue("Numero", solicitud.Paquete.Numero);
            cmd.Parameters.AddWithValue("Rut", solicitud.Paquete.Empresa.Rut);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);
            try
            {
                cmd.ExecuteNonQuery();
                int retorno = Convert.ToInt32(r.Value);
                if (retorno == -1)
                    throw new Exception("Ya tiene solicitud de entrega");
                else if (retorno == -2)
                    throw new Exception("Paquete no existe. ");
                else if (retorno == -3)
                    throw new Exception("No existe usuario");
                else if (retorno != 1)
                    throw new Exception("Error ");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Conexion.Desconectar();
            }
        }

        public SolicitudEntrega BuscarSolicitudesDeEntrega(Paquete paq)
        {
            SqlConnection cnn = new SqlConnection(Conexion.connectionString);
            cnn.Open();

            PerEmpresa perempresa = new PerEmpresa();
            SolicitudEntrega solicitud = null;

            SqlCommand cmd = new SqlCommand("sp_BuscarSolicitudDeEntrega", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Rut", paq.Empresa.Rut);
            cmd.Parameters.AddWithValue("Numero", paq.Numero);
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    PerEmpleado perEmp = new PerEmpleado();
                    Empleado empleado = perEmp.BuscarEmpleado(dr["Usuario"].ToString());
                    solicitud = new SolicitudEntrega(Convert.ToInt32(dr["NumeroSistema"]), dr["Nombre"].ToString(), dr["Direccion"].ToString(), Convert.ToDateTime(dr["FechaEntrega"]), dr["Estado"].ToString(), empleado, paq);
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cnn.Close();
            }
            return solicitud;
        }

        public void CambiarEstado(SolicitudEntrega solicitud)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_CambiarEstadoDeSolicitud", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("NumerodeSistema", solicitud.NumeroSistema);
            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);
            try
            {
                cmd.ExecuteNonQuery();
                int retorno = Convert.ToInt32(r.Value);
                if (retorno == -1)
                    throw new Exception("No existe la solicitud de entrega");
                else if (retorno == -2)
                    throw new Exception("No puedes cambiar el estado a un paquete entregado ");
                else if (retorno != 1)
                    throw new Exception("Error ");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Conexion.Desconectar();
            }

        }

        public List<SolicitudEntrega> BuscarSolicitudesPorFecha(DateTime fecha)
        {
            SqlConnection cnn = new SqlConnection(Conexion.connectionString);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("sp_BuscarSolicitudPorFecha", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Fecha", fecha);
            SqlDataReader dr;
            List<SolicitudEntrega> Lista = new List<SolicitudEntrega>();

            try
            {
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    PerEmpleado perEmp = new PerEmpleado();
                    Empleado emp = perEmp.BuscarEmpleado(dr["Usuario"].ToString());
                    PerPaquetes perPaq = new PerPaquetes();
                    Paquete paq = perPaq.BuscarPaquetePorPks(Convert.ToInt32(dr["Rut"]), Convert.ToInt32(dr["Numero"]));
                    SolicitudEntrega solicitud = new SolicitudEntrega(Convert.ToInt32(dr["NumeroSistema"]), dr["Nombre"].ToString(),
                                                               dr["Direccion"].ToString(), Convert.ToDateTime(dr["FechaEntrega"]),
                                                               dr["Estado"].ToString(), emp, paq);
                    Lista.Add(solicitud);
                }
                dr.Close();
            }
            catch
            {
                throw new Exception ("Debe de ingresar una fecha");
            }
            finally
            {
                cnn.Close();
            }
            return Lista;
        }

    }
}

