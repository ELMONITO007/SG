using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class ItemNorma : EntityBase
    {
        public override int Id { get ; set ; }
        [DisplayName("Nombre item")]
        [Required]

        [StringLength(50, ErrorMessage = "El maximo de caracteres es de 50")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string nombre { get; set; }

        [StringLength(50, ErrorMessage = "El maximo de caracteres es de 50")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public  string valor { get; set; }

        public Norma norma { get; set; }

        public ItemNorma()
        {

        }

        public ItemNorma(Norma _norma)
        {
            norma = _norma;

        }
    }
}
