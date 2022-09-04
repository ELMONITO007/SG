using Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
   public class Laboratorio : EntityBase
    {
        public override int Id { get; set; }
        [DisplayName("Laboratiorio")]
        [Required]

        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string nombre { get; set; }



        [DisplayName("Codigo")]
        [Required]
        [StringLength(2, ErrorMessage = "El maximo de caracteres es de 2")]
        
        public string codigo { get; set; }


        [StringLength(250, ErrorMessage = "El maximo de caracteres es de 250")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string piePagina { get; set; }



        public List<Usuarios> usuarios { get; set; }
        public Laboratorio()
        {
           
            usuarios = new List<Usuarios>();
        }

        public Laboratorio(List<Usuarios> _usuarios)
        {
         
            usuarios = _usuarios;
        }
    }
}
