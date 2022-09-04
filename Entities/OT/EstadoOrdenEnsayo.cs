using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class EstadoOrdenEnsayo:EntityBase
    {

        public override int Id { get; set; }
        public string controlador { get; set; }
        public string pagina { get; set; }

        public string estadoInicial { get; set; }
        public int orden { get; set; }
        public string responsable { get; set; }
        public string texto { get; set; }
        public string estadoFinal { get; set; }

        public string tarea { get; set; }






    }
}
