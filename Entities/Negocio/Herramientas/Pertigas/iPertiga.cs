using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    interface iPertiga
    {
        [DisplayName("Cabezal")]
        [Required]

        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        string cabezal { get; set; }


        [DisplayName("Cabezal 2")]
        [Required]

        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        string cabezal2 { get; set; }

        [Range(1, 999, ErrorMessage = "Ingrese un numero entre 1 y 99")]
        [DisplayName("diametro en mm")]
        int diametro { get; set; }

        [Range(1, 999, ErrorMessage = "Ingrese un numero entre 1 y 99")]
        [DisplayName("Largo Total en mm")]
        int largoTotal { get; set; }

        bool restaurada { get; set; }
    }
}
