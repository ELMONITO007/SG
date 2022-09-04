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
   public class Herramienta : EntityBase
    {

        [DisplayName("Proxima Actualizacion")]
        [Required]
        public string proximaActualizacion { get; set; }
        public override int Id { get; set; }
        public CodigoHerramienta codigoHerramienta { get; set; }

        [DisplayName("Nuevo Codigo")]
        public string codigo { get; set; }
        [DisplayName("Marca")]
        [Required]

        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string marca { get; set; }

        [DisplayName("Modelo")]
        [Required]

        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string modelo { get; set; }

        [DisplayName("Estado")]
        [Required]

        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string Estado { get; set; }


        [DisplayName("Numero Serie")]
   

        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string numeroSerie { get; set; }


        [Range(1, 99, ErrorMessage = "Ingrese un numero entre 1 y 99")]
        [DisplayName("Tiempo Mantenimiento en Meses")]

        public int tiempoMantenimiento { get; set; }

        [DisplayName("Tipo Equipo")]


        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string tipo { get; set; }


        [DisplayName("Esta Vencida")]
        public bool vencida { get; set; }

        [DisplayName("Codigo")]
        public string codigoViejo { get; set; }



        public Usuarios usuarios { get; set; }
        public TipoHerramienta tipoHerramienta { get; set; }
        public List<HerramientaItem> herramientaItem { get; set; }
        public List<Herramienta> listaInstrumento { get; set; }
        public List<Protocolo> listaProtocolo { get; set; }
        public Herramienta()
        {

        }
        public Herramienta(List<HerramientaItem> _herramientaItem, Usuarios _usuarios, TipoHerramienta _tipoHerramienta, List<Protocolo> _listaProtocolo,CodigoHerramienta _codigoHerramienta)
        {
            herramientaItem = _herramientaItem;
            usuarios = _usuarios;
            tipoHerramienta = _tipoHerramienta;
            listaProtocolo = _listaProtocolo;
            codigoHerramienta = _codigoHerramienta;
        }
        public Herramienta(List<HerramientaItem> _herramientaItem, Usuarios _usuarios, TipoHerramienta _tipoHerramienta, List<Protocolo> _listaProtocolo)
        {
            herramientaItem = _herramientaItem;
            usuarios = _usuarios;
            tipoHerramienta = _tipoHerramienta;
            listaProtocolo = _listaProtocolo;

        }
        public Herramienta(Usuarios _usuarios , TipoHerramienta _tipoHerramienta)
        {

            usuarios = _usuarios;
            tipoHerramienta = _tipoHerramienta;
       

        }
        public Herramienta(Usuarios _usuarios, TipoHerramienta _tipoHerramienta,CodigoHerramienta _codigoHerramienta)
        {
            codigoHerramienta = _codigoHerramienta;
            usuarios = _usuarios;
            tipoHerramienta = _tipoHerramienta;


        }


        public Object ObtenerInstancia( string Nombre)


        { 
           IDictionary<string,Herramienta> Tipos=new Dictionary<string,Herramienta>();
            PertigaUniversal pertigaUniversal = new PertigaUniversal();
            Tipos.Add("Pertigauniversal", pertigaUniversal);


           return Tipos[Nombre];
            //if (Tipos[Nombre] ==null)
            //{
            //    return null ;
            //}
            //else
            //{
            // return   Tipos[Nombre];
            //}

          
                            

        

        
        }


    }
}
