using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Entities
{
  public  class Norma :EntityBase
    {
        public override int Id { get; set; }
        [DisplayName("Codigo de la norma")]
        [Required]

        [StringLength(50, ErrorMessage = "El maximo de caracteres es de 50")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string codigoNorma { get; set; }

        [DisplayName("Nombre norma")]
        [Required]

        [StringLength(50, ErrorMessage = "El maximo de caracteres es de 50")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string nombre { get; set; }
        [DisplayName("Descripcion protocolo")]
        [Required]

        [StringLength(350, ErrorMessage = "El maximo de caracteres es de 350")]
        [MinLength(20, ErrorMessage = "El minimo de caracteres es de 20")]
        public string protocolo { get; set; }

        public string pathFoto { get; set; }
        
        public List<ItemNorma> listadoNormas { get; set; }
     
       
        public Norma()
        {

        }

        public Norma(List<ItemNorma> _listadoNormas)
        {
            listadoNormas = _listadoNormas;
        
        }
        public Norma(List<ItemNorma> _listadoNormas,Norma norma)
        {
           this.Id = norma.Id;
            this.nombre = norma.nombre;
            this.pathFoto = norma.pathFoto;
            this.protocolo = norma.protocolo;
            this.codigoNorma = norma.codigoNorma;
            this.listadoNormas = _listadoNormas;


        }
    }
}
