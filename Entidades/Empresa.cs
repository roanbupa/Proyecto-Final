using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Empresa
    {
        //Atributos
        private int _rut;
        private string _mail;
        private string _nombre;
        private string _telefono;

        //Propiedades
        public int Rut
        {
            get { return _rut; }
            set {
                if (value < 0)
                    throw new Exception("El Rut no puede ser menor a 0");
                
                else
                    _rut = value;
            }
        }
     
        public string Mail
        {
          get { return _mail; }
          set {
              if (value == string.Empty)
                  throw new Exception("Debe ingresar un mail");
             else if (value.Length > 50)
                {
                    throw new Exception("Excede el maximo de caracteres");
                }
                
              else
                  _mail = value;
          }
        }
        
        public string Nombre
        {
          get { return _nombre; }
          set {
              if (value == string.Empty)
                  throw new Exception("Debe ingresar un nombre");
              else if (value.Length > 50)
              {
                  throw new Exception("Excede el maximo de caracteres");
              }
              else
                _nombre = value; }
        }
      
        public string Telefono
        {
          get { return _telefono; }
          set {
              if (value == string.Empty)
                  throw new Exception("Debe de ingresar un telefono");
              else if (value.Length > 20)
              {
                  throw new Exception("Excede el maximo de caracteres");
              }
              else
                  _telefono = value; }
        }

        //Constructor
        public Empresa(int pRut, string pNombre, string pTelefono, string pMail)
        {
            Rut = pRut;
            Nombre = pNombre;
            Telefono = pTelefono;
            Mail = pMail; 
        }

        //Operacion
        public override string ToString()
        {
            return "Rut: " + Rut + ", Nombre: " + Nombre + ", Telefono: " + Telefono + ", Mail: " + Mail;
        }
    }
}
