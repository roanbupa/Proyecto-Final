using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class SolicitudEntrega
    {
        //Atributos
        private int _numeroSistema;
        private string _nombre;
        private string _direccion;
        private DateTime _fechaEntrega;
        private string _estado;
        private Empleado _empleado;
        private Paquete _paquete;

        //Propiedades
        public int NumeroSistema
        {
            get { return _numeroSistema; }
            set { _numeroSistema = value; }
        }
        public string Nombre
        {
            get { return _nombre; }

            set {
                if (value == string.Empty)
                    throw new Exception("El nombre no puede ser vacio");
                else if (value.Length > 50)
                {
                    throw new Exception("Excede el maximo de caracteres");
                }
                _nombre = value; }
        }

        public string Direccion
        {
            get { return _direccion; }
            set {
                if (value == string.Empty)
                    throw new Exception("La direccion no puede ser vacia");
                else if (value.Length > 50)
                {
                    throw new Exception("Excede el maximo de caracteres");
                }
                _direccion = value; }
        }

        public DateTime FechaEntrega
        {
            get { return _fechaEntrega; }
            set
            {
                if (value < DateTime.Now.Date)
                {
                    throw new Exception("La fecha debe ser mayor a la actual");
                }
                else
                    _fechaEntrega = value;
            }
        }

        public string Estado
        {
            get { return _estado; }
            set
            {
                if (value == string.Empty)
                    throw new Exception("El estado no puede ser vacio");
                else if (value.Length > 20)
                {
                    throw new Exception("Excede el maximo de caracteres");
                }
                else if (value != "Entregado".ToLower() && value != "Deposito".ToLower() && value != "En Camino".ToLower())
                {
                    throw new Exception("El estado solo puede ser Entregado, Deposito o En Camino.");
                }
                _estado = value; }
        }

        public Paquete Paquete
        {
            get { return _paquete; }
            set
            {
                if (value == null)
                    throw new Exception("El paquete no puede ser nulo");
                _paquete = value; }
        }

        public Empleado Empleado
        {
            get { return _empleado; }
            set {
                if (value == null)
                    throw new Exception("El empleado no puede ser nulo");
                _empleado = value; }
        }

        //Constructor
        public SolicitudEntrega(int pNum, string pNomb, string pDireccion, DateTime pFecha, string pEstado, Empleado pEmpleado, Paquete pPaquete)
        {
            NumeroSistema = pNum;
            Nombre = pNomb;
            Direccion = pDireccion;
            FechaEntrega = pFecha;
            Estado = pEstado.ToLower(); ;
            Empleado = pEmpleado;
            Paquete = pPaquete;
        }

        //Operacion
        public override string ToString()
        {
            return "Numero de Sistema: " + NumeroSistema + ", Nombre del destinatario: " + Nombre + ", Direccion del destinatario: " + Direccion +
                    ", Fecha de entrega: " + FechaEntrega.ToShortDateString() +", Estado: " + Estado + ", Empleado: " + Empleado.Nombre;
        }

    }
}
