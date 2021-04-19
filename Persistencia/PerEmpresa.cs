using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using System.Data.SqlClient;

namespace Persistencia
{
    public class PerEmpresa
    {
        public Empresa BuscarEmpresa(int rut)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_BuscarEmpresa", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Rut", rut);
            Empresa empresa = null;
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    empresa = new Empresa(rut, dr["Nombre"].ToString(), dr["Telefono"].ToString(), dr["Mail"].ToString());
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
            return empresa;
        }

        public void ModificarEmpresa(Empresa empresa)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("Sp_ModificarEmpresa", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Rut", empresa.Rut);
            cmd.Parameters.AddWithValue("Nombre", empresa.Nombre);
            cmd.Parameters.AddWithValue("Telefono", empresa.Telefono);
            cmd.Parameters.AddWithValue("Mail", empresa.Mail);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);
            try
            {
                cmd.ExecuteNonQuery();
                int retorno = Convert.ToInt32(r.Value);
                if (retorno == -1)
                    throw new Exception("La empresa no existe");
                else if (retorno != 1)
                    throw new Exception("Error");
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

        public void AgregarEmpresa(Empresa empresa)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("Sp_AltaEmpresa", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Rut", empresa.Rut);
            cmd.Parameters.AddWithValue("Nombre", empresa.Nombre);
            cmd.Parameters.AddWithValue("Telefono", empresa.Telefono);
            cmd.Parameters.AddWithValue("Mail", empresa.Mail);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);
            try
            {
                cmd.ExecuteNonQuery();
                int retorno = Convert.ToInt32(r.Value);
                if (retorno == -1)
                    throw new Exception("La empresa ya existe");
                else if (retorno == -2)
                    throw new Exception("El nombre esta en uso ");
                else if (retorno != 1)
                    throw new Exception("Error");
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

        public void EliminarEmpresa(Empresa empresa)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("Sp_EliminarEmpresa", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Rut", empresa.Rut);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);
            try
            {
                cmd.ExecuteNonQuery();
                int retorno = Convert.ToInt32(r.Value);
                if (retorno == -1)
                    throw new Exception("La empresa no existe");
                else if (retorno == -2)
                    throw new Exception("No se puede eliminar, tiene solicitudes de entrega");
                else if (retorno != 1)
                    throw new Exception("Error");
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

        public List<Empresa> ListarEmpresas()
        {
            SqlConnection cnn = new SqlConnection(Conexion.connectionString);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("sp_ListarEmpresas", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader dr;
            List<Empresa> Lista = new List<Empresa>();

            try
            {
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Empresa empresa = new Empresa(Convert.ToInt32(dr["Rut"]), dr["Nombre"].ToString(), dr["Telefono"].ToString(), dr                                                                ["Mail"].ToString());

                    Lista.Add(empresa);
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
    }
}
