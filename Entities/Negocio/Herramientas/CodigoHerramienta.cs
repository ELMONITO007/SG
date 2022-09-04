using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
 public   class CodigoHerramienta : EntityBase
    {
        public override int Id { get; set; }

        public string codigo { get; set; }
        public string numero { get; set; }

        public TipoHerramienta tipo { get; set; }

        public CodigoHerramienta()
        {

        }
        public CodigoHerramienta(TipoHerramienta _tipo)
        {
            tipo = _tipo;
        }
    }
}
