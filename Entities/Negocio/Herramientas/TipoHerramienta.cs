using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
   public class TipoHerramienta :EntityBase
    {
        public override int Id { get; set; }
        [DisplayName("Tipo")]
        [Required]

        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string tipoHerramienta { get; set; }

        public List<ItemHerramienta> listaItemHerramientas { get; set; }
        public List<TipoHerramienta> listaInstrumento { get; set; }


        [Required]
        [DisplayName("Categoria")]
              [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string subTipo { get; set; }

        [Required]
        [DisplayName("Ensayo")]
        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string tipoEnsayo { get; set; }

        [Required]
        [DisplayName("Uso")]
        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string tipoUso { get; set; }
        public Norma norma { get; set; }
        public TipoHerramienta()
        {

        }
        public TipoHerramienta(List<ItemHerramienta> _listaHerramienta, List<TipoHerramienta> _listaInstrumento,Norma _norma)
        {
            norma = _norma;
            listaItemHerramientas = _listaHerramienta;
            listaInstrumento = _listaInstrumento;
        }
    }
}
