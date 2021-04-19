using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Empleado
    {
        //Atributos
        private string _usuario;
        private string _pass;
        private string _nombre;

        //Propiedades
        public string Usuario
        {
            get { return _usuario; }
            set
            {
                if (value == string.Empty)
                {
                    throw new Exception("El usuario no puede estar vacio");
                }
                else if (value.Length > 20)
                {
                    throw new Exception("Excede el maximo de caracteres");
                }
                else
                    _usuario = value;
            }
        }

        public string Pass
        {
            get { return _pass; }
            set
            {
                if (value == string.Empty)
                {
                    throw new Exception("El Password no puede estar vacio");
                }
                else if (value.Length > 20)
                {
                    throw new Exception("Excede el maximo de caracteres");
                }
                else
                _pass = value;
            }
        }

        public string Nombre
        {
            get { return _nombre; }
            set {
                if (value == string.Empty)
                {
                    throw new Exception("El Nombre no puede estar vacio");
                }
                else if (value.Length > 50)
                {
                    throw new Exception("Excede el maximo de caracteres");
                }
                else
                _nombre = value; }
        }

        //Constructor
        public Empleado(string pUsuario, string pPass, string pNombre)
        {
            Usuario= pUsuario.ToLower();
            Pass= pPass.ToLower();
            Nombre = pNombre.ToLower();
        }

        //Operacion
        public override string ToString()
        {
            return "Usuario: " + Usuario + ", Nombre: " + Nombre;
        }

    }
}
