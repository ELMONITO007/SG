using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
  public  class OrdenTrabajoEstado :EntityBase
    {
        public override int Id { get; set; }
        public OrdenTrabajo ordenTrabajo { get; set; }
        public Usuarios Usuarios { get; set; }
        public string fecha { get; set; }
        public string estado { get; set; }
    
        public string observaciones { get; set; }
        public EstadoOrdenEnsayo  EstadoOrdenEnsayo { get; set; }
        public OrdenTrabajoEstado()
        {
            ordenTrabajo = new OrdenTrabajo();
            Usuarios = new Usuarios();
            EstadoOrdenEnsayo= new EstadoOrdenEnsayo(); 
        }
        public OrdenTrabajoEstado(Usuarios _Usuarios, OrdenTrabajo _ordenTrabajo, EstadoOrdenEnsayo _EstadoOrdenEnsayo)
        {
            ordenTrabajo = _ordenTrabajo;
            Usuarios = _Usuarios;
            EstadoOrdenEnsayo=_EstadoOrdenEnsayo;   
        }
    }
}
