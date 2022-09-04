using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
 public   class PertigaTensoras : Herramienta, iPertiga
    { 
        public string cabezal { get; set; }
        public string cabezal2 { get; set; }
        public int diametro { get; set; }
        public int largoTotal { get; set; }
        public bool restaurada { get; set; }

        public PertigaTensoras()
        {

        }
        public PertigaTensoras(CodigoHerramienta _codigoHerramienta, TipoHerramienta _tipoHerramienta, List<Herramienta> _listaInstrumento)
        {
            codigoHerramienta = _codigoHerramienta;
            tipoHerramienta = _tipoHerramienta;
            listaInstrumento = _listaInstrumento;
       

        }
    }
}
