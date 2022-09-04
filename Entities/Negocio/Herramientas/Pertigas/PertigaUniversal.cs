using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    [DisplayName("Pertiga Universal")]
    public class PertigaUniversal : Herramienta
    {

        [DisplayName("Acople Hembra")]

        public string acopleHembra { get; set; }
        [DisplayName("Acople Macho")]
        public string acopleMacho { get; set; }
        [DisplayName("Diametro")]
        public int diametro { get; set; }
        [DisplayName("Largo Aislante")]
        public int largoAislante { get; set; }

        [DisplayName("Restaurada")]
        public bool restaurada { get; set; }

        public PertigaUniversal()
        {

        }
        public PertigaUniversal(CodigoHerramienta _codigoHerramienta, TipoHerramienta _tipoHerramienta,List<Herramienta> _listaInstrumento)
        {
            codigoHerramienta = _codigoHerramienta;
            tipoHerramienta = _tipoHerramienta;
            listaInstrumento = _listaInstrumento;
            listaProtocolo = new List<Protocolo>();
            usuarios = new Usuarios();

        }
        public PertigaUniversal(CodigoHerramienta _codigoHerramienta, TipoHerramienta _tipoHerramienta, List<HerramientaItem> _listaHerramientaItem)
        {
            codigoHerramienta = _codigoHerramienta;
            tipoHerramienta = _tipoHerramienta;
            herramientaItem = _listaHerramientaItem;
            usuarios = new Usuarios();
       

        }
    }
}
