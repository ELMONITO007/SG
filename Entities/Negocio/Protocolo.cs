using Entities.Negocio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Protocolo : EntityBase
    {
        public Usuarios usuario { get; set; }
        public override int Id { get; set; }
        public Norma norma { get; set; }
        public string codigo { get; set; }
        public Herramienta herramienta { get; set; }

        public Laboratorio laboratorio { get; set; }
        public string fechaEnsayo { get; set; }

        [DisplayName("email")]
        [Required]

        [StringLength(70, ErrorMessage = "El maximo de caracteres es de 70")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string email { get; set; }

        [DisplayName("Observaciones")]
        [Required]

        [StringLength(250, ErrorMessage = "El maximo de caracteres es de 250")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string observaciones { get; set; }

        [Range(0, 99, ErrorMessage = "Ingrese un numero entre 0 y 99")]
        public int temperatura { get; set; }

        [Range(0, 100, ErrorMessage = "Ingrese un numero entre 0 y 100")]
        public int hmedadad { get; set; }

        [StringLength(250, ErrorMessage = "El maximo de caracteres es de 250")]
        [MinLength(2, ErrorMessage = "El minimo de caracteres es de 2")]
        public string conclusion { get; set; }
        public byte[] qr { get; set; }
        public List<ProtocoloItem> protocoloItem { get; set; }
        public List<Herramienta> instrumentos { get; set; }

        public bool correcto { get; set; }
        public Protocolo()
        {
            usuario = new Usuarios();
            protocoloItem = new List<ProtocoloItem>();
        }
        public Protocolo(Herramienta _herramienta, Laboratorio _laboratorio)
        {
            protocoloItem = new List<ProtocoloItem>();
            herramienta = _herramienta;
            usuario = new Usuarios();
            laboratorio = _laboratorio;
        }
        public Protocolo(Herramienta _herramienta, Laboratorio _laboratorio, List<Herramienta> _instrumentos)
        {
            protocoloItem = new List<ProtocoloItem>();
            herramienta = _herramienta;
            usuario = new Usuarios();
            laboratorio = _laboratorio;
            instrumentos = _instrumentos;   
        }
        public Protocolo(Herramienta _herramienta, Laboratorio _laboratorio,Norma _norma)
        {
            protocoloItem = new List<ProtocoloItem>();
            herramienta = _herramienta;
            laboratorio = _laboratorio;
            usuario = new Usuarios();
            norma = _norma;
        }
    }
}
