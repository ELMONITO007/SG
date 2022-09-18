using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class ProtocoloDetalle :EntityBase
    {
        public override int Id { get; set; }
        [DisplayName("Marca")]
        public string marca { get; set; }
        [DisplayName("Numero Serie")]

        public string numeroSerie { get; set; }

        [DisplayName("Vencimiento")]

        public string vencimiento { get; set; }

        [DisplayName("Codigo")]

        public string codigo { get; set; }

        [DisplayName("Tipo")]
        public string tipo { get; set; }
        [DisplayName("Certificado")]
        public string certificado { get; set; }
        public int id_protocolo { get; set; }



    }
}
