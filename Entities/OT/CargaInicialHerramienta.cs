using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities { 
    public class CargaInicialHerramienta :EntityBase
    {

        public override int Id { get; set; }
        public List< Herramienta> listaHerramienta { get; set; }
        public List<Instrumento> Instrumento { get; set; }

        public List<string> listaTipo { get; set; }
        public Herramienta herramienta { get; set; }
        public OrdenTrabajo ordenTrabajo { get; set; }
        public bool existe { get; set; }
        public string codigo { get; set; }
        public List<CargaInicialHerramienta> cargaInicialHerramientas { get; set; }
        public TipoHerramienta tipo { get; set; }
        public CargaInicialHerramienta()
        {
       
        }
        public CargaInicialHerramienta(List<CargaInicialHerramienta> _cargaInicialHerramientas)
        {
            cargaInicialHerramientas= _cargaInicialHerramientas;
   
        }
        public CargaInicialHerramienta(OrdenTrabajo _ordenTrabajo,Herramienta  _herramienta )
        {
            ordenTrabajo = _ordenTrabajo;
            herramienta = _herramienta;

        }
        public CargaInicialHerramienta(OrdenTrabajo _ordenTrabajo, Herramienta _herramienta, TipoHerramienta _tipo)
        {
            ordenTrabajo = _ordenTrabajo;
            herramienta = _herramienta;
            tipo = _tipo;

        }
        public CargaInicialHerramienta(List<Herramienta> _listaHerramienta, List<string> _listaTipo)
        {
            listaTipo = _listaTipo;
            listaHerramienta = _listaHerramienta;

        }

    }
}
