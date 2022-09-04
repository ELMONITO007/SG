using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;

namespace Negocio
{
 public   class CodigoHerramientaComponent
    {
        public CodigoHerramienta ObtenerUltimoCodigo(int id_TipoHerramienta)

        {
            CodigoHerramientaDAC codigoHerramienta = new CodigoHerramientaDAC();
            return codigoHerramienta.ObtenerUltimoCodigo(id_TipoHerramienta);


        }

        public CodigoHerramienta ObtenerTipoHerramientaConCodigo(string CodigoLetra)


        {

            CodigoHerramientaDAC codigoHerramientaDAC = new CodigoHerramientaDAC();

            TipoHerramientaDAC tipoHerramientaDAC = new TipoHerramientaDAC();
            CodigoHerramienta codigoHerramienta = new CodigoHerramienta();
            codigoHerramienta = codigoHerramientaDAC.ObtenerTipoHerramientaConCodigo(CodigoLetra);

            CodigoHerramienta result = new CodigoHerramienta(tipoHerramientaDAC.ReadBy(codigoHerramienta.tipo.Id));

            result.codigo = codigoHerramienta.codigo;

            return result;

        }
    }
}
