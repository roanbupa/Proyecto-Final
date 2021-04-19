using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using System.Data.SqlClient;

namespace Persistencia
{
    public class PerPaquetes
    {
        public void ModificarPaquete(Paquete paquete)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_ModificarPaquete", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Rut", paquete.Empresa.Rut);
            cmd.Parameters.AddWithValue("Numero", paquete.Numero);
            cmd.Parameters.AddWithValue("Peso", paquete.Peso);
            cmd.Parameters.AddWithValue("Tipo", paquete.Tipo);
            cmd.Parameters.AddWithValue("Descripcion", paquete.Descripcion);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);
            try
            {
                cmd.ExecuteNonQuery();

                int retorno = Convert.ToInt32(r.Value);
                if (retorno == -1)
                    throw new Exception("No existe la empresa");
                else if (retorno == -2)
                    throw new Exception("No existe el numero del paquete para esa empresa");
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

        public void AgregarPaquete(Paquete paquete)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_AgregarPaquete", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Rut", paquete.Empresa.Rut);
            cmd.Parameters.AddWithValue("Numero", paquete.Numero);
            cmd.Parameters.AddWithValue("Peso", paquete.Peso);
            cmd.Parameters.AddWithValue("Tipo", paquete.Tipo);
            cmd.Parameters.AddWithValue("Descripcion", paquete.Descripcion);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);
            try
            {
                cmd.ExecuteNonQuery();
                int retorno = Convert.ToInt32(r.Value);
                if (retorno == -1)
                    throw new Exception("No existe la empresa");
                else if (retorno == -2)
                    throw new Exception(" Ya existe el numero del paquete para esa empresa");
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

        public void EliminarPaquete(Paquete paquete)
        {
            Conexion.Conectar();
            SqlCommand cmd = new SqlCommand("sp_EliminarPaquete", Conexion.cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Rut", paquete.Empresa.Rut);
            cmd.Parameters.AddWithValue("Numero", paquete.Numero);

            SqlParameter r = new SqlParameter();
            r.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(r);
            try
            {
                cmd.ExecuteNonQuery();
                int retorno = Convert.ToInt32(r.Value);
                if (retorno == -1)
                    throw new Exception("No existe la empresa");
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

        public Paquete BuscarPaquetePorPks(int rut, int numero)
        {
            SqlConnection cnn = new SqlConnection(Conexion.connectionString);
            cnn.Open();

            PerEmpresa perempresa = new PerEmpresa();
            Paquete paquete = null;

            SqlCommand cmd = new SqlCommand("sp_BuscarPaquetePorPks", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Rut", rut);
            cmd.Parameters.AddWithValue("Numero", numero);
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Empresa empresa = perempresa.BuscarEmpresa(rut);
                    paquete = new Paquete(numero, Convert.ToInt32(dr["Peso"]), dr["Tipo"].ToString(), dr["Descripcion"].ToString(), empresa);
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
            return paquete;
        }

        public List<Paquete> PaquetesSinSolicitudes()
        {
            SqlConnection cnn = new SqlConnection(Conexion.connectionString);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("sp_ListarPaqueteSinSolicitud", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            List<Paquete> Lista = new List<Paquete>();
            PerEmpresa persistencia = new PerEmpresa();

            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Empresa empresa = persistencia.BuscarEmpresa(Convert.ToInt32(dr["Rut"]));
                    Paquete paquete = new Paquete(Convert.ToInt32(dr["Numero"]), Convert.ToInt32(dr["Peso"]), dr["Tipo"].ToString(),
                                                        dr["Descripcion"].ToString(), empresa);

                    Lista.Add(paquete);
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

        public List<Paquete> PaquetesPorEmpresa(Empresa empresa)
        {
            SqlConnection cnn = new SqlConnection(Conexion.connectionString);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("sp_PaquetesPorEmpresa", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Rut", empresa.Rut);
            
            List<Paquete> ListaPaquetePorEmpresa = new List<Paquete>();
            PerEmpresa persistencia = new PerEmpresa();

            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Paquete paquetes = new Paquete(Convert.ToInt32(dr["Numero"]), Convert.ToInt32(dr["Peso"]), dr["Tipo"].ToString(),
                                                        dr["Descripcion"].ToString(), empresa);

                    ListaPaquetePorEmpresa.Add(paquetes);
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
            return ListaPaquetePorEmpresa;
        }
    }
}
