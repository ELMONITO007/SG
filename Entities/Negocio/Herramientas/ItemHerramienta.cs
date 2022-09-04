using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Entities
{
  public  class ItemHerramienta :EntityBase
    {
        public override int Id { get; set; }
        [DisplayName("Nombre item")]
        [Required]

        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string nombre { get; set; }

        public string tipo { get; set; }
        public string Ayuda { get; set; }

        public int Maximo { get; set; }
        public int Minimo { get; set; }


        public TipoHerramienta tipoHerramienta { get; set; }

        public ItemHerramienta()
        {
            tipoHerramienta = new TipoHerramienta();
        }
    }
}
