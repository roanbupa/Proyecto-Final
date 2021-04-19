using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Paquete
    {
        //Atributos
        private int _numero;
        private int _peso;
        private string _tipo;
        private string _descripcion;
        private Empresa _empresa;

        //Propiedades
        public int Numero
        {
            get { return _numero; }
            set {
                if (value < 0)
                    throw new Exception("El numero no puede ser menor a 0");
                _numero = value; }
        }
       
        public int Peso
        {
            get { return _peso; }
            set {
                if (value < 0)
                { throw new Exception("El peso no puede ser menor a 0"); }
                
                _peso = value; }
        }
       
        public string Tipo
        {
            get { return _tipo; }
            set
            {
                if (value == string.Empty)
                    throw new Exception("El tipo no puede ser vacio");
                else if (value.Length > 20)
                {
                    throw new Exception("Excede el maximo de caracteres");
                }
                else if (value != "Fragil" && value != "Comun" && value != "Bulto")
                {
                    throw new Exception("El tipo solo puede ser Fragil, Comun o Bulto");
                }
                _tipo = value; }
        }
        
        public string Descripcion
        {
            get { return _descripcion; }
            set
            {
                if (value == string.Empty)
                    throw new Exception("La descripcion no puede ser vacia");

                _descripcion = value; }
        }
      
        public Empresa Empresa
        {
            get { return _empresa; }
            set {
                if (value == null)
                    throw new Exception("La empresa no puede ser nula");
                _empresa = value; }
        }

        //Constructor
        public Paquete(int pNumero, int pPeso, string pTipo, string pDescripcion, Empresa pEmpresa)
        {
            Numero = pNumero;
            Peso = pPeso;
            Tipo = pTipo;
            Descripcion = pDescripcion;
            Empresa = pEmpresa;
        }

        //Operacion
        public override string ToString()
        {
            return "Numero: " + Numero + ",  Peso: " + Peso + ",  Tipo: " + Tipo + ",  Descripcion: " + Descripcion;
        }
    }
}
