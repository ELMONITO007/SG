using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
  public  class OrdenTrabajo :EntityBase
    {
        public Usuarios asignado { get; set; }
        public override int Id { get; set; }

  public int cantidadEquipos { get; set; }
		public OrdenTrabajoEstado Estado { get; set; }
		public string Fecha { get; set; }

		[DataType(DataType.Date), Required]
		[DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}", ApplyFormatInEditMode = true)]
		public string FechaAEnsayar { get; set; }
        public string GuiaRecepcion { get; set; }
        public string TransporteRecepcion { get; set; }


		[DataType(DataType.MultilineText)]
		public string Observaciones { get; set; }
        public  Laboratorio Laboratorio { get; set; }
		public List<Herramienta> ListaHerramientas { get; set; }
		public Turno Turno;
		public Usuarios Usuario;
		public List<OrdenTrabajo> ordenTrabajos { get; set; }


		public string guia { get; set; }
		public string transporte { get; set; }
        public List<Turno> turnos { get; set; }
		public List<Turno> turnosEnsayo { get; set; }
		public List<Turno> turnosEnsayoFin { get; set; }
		public List<OrdenTrabajoEstado> estados { get; set; }
		public List<CargaInicialHerramienta> cargaInicialHerramientas { get; set; }
		public List<Protocolo> protocolos { get; set; }
		public OrdenTrabajo(Usuarios _usuarios,Laboratorio _laboratorio)
		{
		
			   Usuario = _usuarios;
			Laboratorio = _laboratorio;
			ordenTrabajos = new List<OrdenTrabajo>();
			Turno = new Turno();
			turnos = new List<Turno>();
			estados = new List<OrdenTrabajoEstado>();
			ListaHerramientas = new List<Herramienta>();
			turnosEnsayo = new List<Turno>();
			turnosEnsayoFin = new List<Turno>();
			Estado = new OrdenTrabajoEstado(null, null, null);
			asignado = new Usuarios();
			cargaInicialHerramientas = new List<CargaInicialHerramienta>();
		}
		public OrdenTrabajo(Usuarios _usuarios)
		{
			
			Usuario = _usuarios;
			Laboratorio = new Laboratorio(null);
			ordenTrabajos = new List<OrdenTrabajo>();
			Turno = new Turno();
			turnos = new List<Turno>();
			estados = new List<OrdenTrabajoEstado>();
			ListaHerramientas = new List<Herramienta>();
			turnosEnsayo = new List<Turno>();
			turnosEnsayoFin = new List<Turno>();
			Estado = new OrdenTrabajoEstado(null,null,null); cargaInicialHerramientas = new List<CargaInicialHerramienta>();
			asignado = new Usuarios();
		}
		
		public OrdenTrabajo()
		{
			protocolos=new	List<Protocolo>();
			
			Laboratorio = new Laboratorio();

			ListaHerramientas =new List<Herramienta>();
			   estados = new List<OrdenTrabajoEstado>();
			ordenTrabajos = new List<OrdenTrabajo>();
			Turno = new Turno();
			turnos = new List<Turno>();
			turnosEnsayo = new List<Turno>();
			turnosEnsayoFin = new List<Turno>();
			asignado = new Usuarios();
			Estado = new OrdenTrabajoEstado(null, null, null); cargaInicialHerramientas = new List<CargaInicialHerramienta>();
		}
	}
}
