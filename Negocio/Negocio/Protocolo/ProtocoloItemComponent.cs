using Entities.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Bussiness;
using Entities;

namespace Business
{
    public class ProtocoloItemComponent
    {
        public ProtocoloItem Create(ProtocoloItem entity)
        {
            ProtocoloItemDAC protocoloItemDAC = new ProtocoloItemDAC();
            return protocoloItemDAC.Create(entity);
        }

        public void CreateMasivoProtocoloItem(List<string> lista, int id_Norma, int id_protocolo)

        {
         
            Protocolo protocolo = new Protocolo();
            protocolo.Id = id_protocolo;
            List<ItemNorma> itemNormas = new List<ItemNorma>();
            ItemNormaComponent itemNormaComponent = new ItemNormaComponent();
            itemNormas = itemNormaComponent.ReadByNorma(id_Norma);
            int a = 0;
            foreach (var item in lista)
            {

                if (item != "")
                {
                    ItemNorma itemNorma = new ItemNorma();
                    itemNorma.Id = itemNormas[a].Id;
                    itemNorma.nombre = itemNormas[a].nombre;
                    itemNorma.valor = item;

                    ProtocoloItem protocoloItem = new ProtocoloItem(protocolo, itemNorma);
                    protocoloItem.valor = item;
                    Create(protocoloItem);
                }
            
                a++;
            }

        }
   

            public List<ProtocoloItem> ReadByProtocolo(int id)
        {
            {
                List<ProtocoloItem> result = new List<ProtocoloItem>();
                ProtocoloItemDAC protocoloItemDAC = new ProtocoloItemDAC();
                foreach (var item in protocoloItemDAC.ReadByProtocolo(id))
                {
                    ItemNormaComponent itemNormaComponent = new ItemNormaComponent();
                    ItemNorma itemNorma = new ItemNorma();
                    itemNorma = itemNormaComponent.ReadBy(item.ItemNorma.Id);


                    ProtocoloItem protocoloItem = new ProtocoloItem(null, itemNorma);

                    protocoloItem.Id = item.Id;
                    protocoloItem.valor = item.valor;
                    result.Add(protocoloItem);
                }




                return result;
            }
        }

        public void Update(ProtocoloItem entity)
        {
            ProtocoloItemDAC protocoloItemDAC = new ProtocoloItemDAC();
            protocoloItemDAC.Update(entity);
        }

    }
}

