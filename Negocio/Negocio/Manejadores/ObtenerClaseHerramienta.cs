using Entities;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public static class ObtenerClaseHerramienta
    {
     


        public static Herramienta pertigaBaston(string tipo, int id)


        {
            if (tipo.ToLower() == "pertiga baston")
            {
                return new PertigaBaston();

            }
            else
            {
                return pertigaUniversal(tipo,id);
            }


        }

        public static Herramienta pertigaUniversal(string tipo, int id)


        {
            if (tipo.ToLower() == "pertiga universal")
            {
                PertigaUniversalComponent pertigaUniversalComponent = new PertigaUniversalComponent();
                return pertigaUniversalComponent.ReadBy(id);

            }
            else
            {
                return PertigaTensoras(tipo, id);
            }


        }
        public static Herramienta PertigaTensoras(string tipo, int id)


        {
            if (tipo.ToLower() == "Pertiga Tensoras")
            {
                return new PertigaBaston();

            }
            else
            {
                return pertigaUniversal(tipo, id);
            }


        }
    }
}
