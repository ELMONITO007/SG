using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;

namespace Bussiness
{
    public class ItemNormaComponent
    {

        public ItemNorma Create(ItemNorma entity,int id_Norma)


        {
            if (Verificar(entity,id_Norma))
            {
                ItemNormaDAC ItemNormaDAC = new ItemNormaDAC();
                ItemNorma ItemNorma = new ItemNorma();
                ItemNorma= ItemNormaDAC.Create(entity);
                ItemNormaDAC.CreateListado_Norma(id_Norma, ItemNorma.Id);
                return ItemNorma;

            }
            else
            {
                return null;
            }


        }

        public void CreateMAsivo(List<string> lista, int protocolo)


        { 
        
        
        }


        public ItemNorma ReadBy(int id)
        {
            ItemNormaDAC ItemNormaDAC = new ItemNormaDAC();
            return ItemNormaDAC.ReadBy(id);

        }
        public ItemNorma ReadBy(string id)
        {
            ItemNormaDAC ItemNormaDAC = new ItemNormaDAC();
            return ItemNormaDAC.ReadBy(id);

        }
        public List<ItemNorma> ReadByNorma(int id_norma)

        {
            ItemNormaDAC ItemNormaDAC = new ItemNormaDAC();
            return ItemNormaDAC.ReadByNorma(id_norma);

        }

        public void Update(ItemNorma entity)

        {
            ItemNormaDAC ItemNormaDAC = new ItemNormaDAC();
            ItemNormaDAC.Update(entity);

        }


        public bool Verificar(ItemNorma entity, int id_Norma)

        {
            ItemNormaDAC ItemNormaDAC = new ItemNormaDAC();
            if (ItemNormaDAC.ReadBy(id_Norma, entity.nombre)==null)
            {
                return true;

            }
            else
            {
                return false;
            }

        }

    }

}
