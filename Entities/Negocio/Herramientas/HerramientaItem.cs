using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
 public   class HerramientaItem
    {
        public string  Id { get; set; }
        public Herramienta herramienta { get; set; }

        public ItemHerramienta  itemHerramienta  { get; set; }

        [Range(1, 999, ErrorMessage = "Ingrese un numero entre 1 y 99")]
        [DisplayName("Tiempo Mantenimiento en Meses")]
        public string valor { get; set; }

        public HerramientaItem()
        {
            herramienta = new Herramienta();
            itemHerramienta = new ItemHerramienta();
        }
        public HerramientaItem(Herramienta _herramienta, ItemHerramienta _itemHerramienta)
        {
            herramienta = _herramienta;
            itemHerramienta = _itemHerramienta;

        }
    }
}
