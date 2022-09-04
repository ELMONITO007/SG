using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{ 
 public   class PertigaBaston : Herramienta, iPertiga
    
    {
        public string cabezal { get; set; }
        public string cabezal2 { get; set; }
        public int diametro { get; set; }
        public int largoTotal { get; set; }
        public bool restaurada { get; set; }

        public PertigaBaston()
        {

        }
        public PertigaBaston(CodigoHerramienta _codigoHerramienta, TipoHerramienta _tipoHerramienta, List<HerramientaItem> _listaHerramientaItem)
        {
            codigoHerramienta = _codigoHerramienta;
            tipoHerramienta = _tipoHerramienta;
            herramientaItem = _listaHerramientaItem;
   

        }
    }
}
