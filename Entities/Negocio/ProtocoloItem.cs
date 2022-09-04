using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Negocio
{
    public class ProtocoloItem :EntityBase
    {
        public override int Id { get; set; }

        public string valor { get; set; }
        public Protocolo protocolo { get; set; }
        public   ItemNorma ItemNorma { get; set; }
        public ProtocoloItem(Protocolo _protocolo, ItemNorma _itemNorma)
        {
            protocolo = _protocolo;
            ItemNorma = _itemNorma;

        }
        public ProtocoloItem()
        {

        }
    } 
}
