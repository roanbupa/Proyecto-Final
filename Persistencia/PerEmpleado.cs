using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using System.Data.SqlClient;

namespace Persistencia
{
    public class PerEmpleado
    {
        public static Entidades.Empleado Logueo(string pUsuario, string pPass)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_Logueo", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            Empleado unUsuario = null;

            cmd.Parameters.AddWithValue("@Usuario", pUsuario);
            cmd.Parameters.AddWithValue("@Contrasena", pPass);

            try
            {
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();
                    unUsuario = new Empleado(dr["Usuario"].ToString(), dr["Contrasena"].ToString(), dr["Nombre"].ToString());
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Conexion.Desconectar();
            }
            return unUsuario;
        }

        public Empleado BuscarEmpleado(string usuario)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_BuscarUsuario", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Usu", usuario);
            Empleado empleado = null;
            SqlDataReader dr;
            try
            {
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    empleado = new Empleado(usuario, dr["Contrasena"].ToString(), dr["Nombre"].ToString());
                }
                dr.Close();
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                Conexion.Desconectar();
            }
            return empleado;
        }

        public void AgregarEmpleado(Empleado empleado)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_AgregarEmpleado", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Usu", empleado.Usuario);
            cmd.Parameters.AddWithValue("Contrasena", empleado.Pass);
            cmd.Parameters.AddWithValue("Nombre", empleado.Nombre);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);
            try
            {
                cmd.ExecuteNonQuery();
                int retorno = Convert.ToInt32(r.Value);
                if (retorno == -1)
                    throw new Exception("El empleado existe");
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

        public void ModificarEmpleado(Empleado empleado)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_ModificarEmpleado", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Usu", empleado.Usuario);
            cmd.Parameters.AddWithValue("Contrasena", empleado.Pass);
            cmd.Parameters.AddWithValue("Nombre", empleado.Nombre);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);
            try
            {
                cmd.ExecuteNonQuery();

                int retorno = Convert.ToInt32(r.Value);
                if (retorno == -1)
                    throw new Exception("El empleado no existe");
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

        public void EliminarEmpleado(Empleado usuario)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_EliminarEmpleado", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("usu", usuario.Usuario);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);
            try
            {
                cmd.ExecuteNonQuery();
                
                int retorno = Convert.ToInt32(r.Value);
                if (retorno == -1)
                    throw new Exception("Tiene Solicitudes asociadas");
                else if (retorno == -2)
                    throw new Exception("El empleado no existe");
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

    }
}
