using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Data;
using Entities;

namespace Bussiness
{
    public class itemHerramientaComponent
    {
        public ItemHerramienta Create(ItemHerramienta entity)
        {
            ItemHerramientaDAC itemHerramientaDAC = new ItemHerramientaDAC();
          return  itemHerramientaDAC.Create(entity);
        }

        public void Delete(int id)
        {
            ItemHerramientaDAC itemHerramientaDAC = new ItemHerramientaDAC();
             itemHerramientaDAC.Delete(id);
        }

        public List<ItemHerramienta> ReadbyHerramienta(int id_Herramienta)
        {
            List<ItemHerramienta> itemHerramientas = new List<ItemHerramienta>();
            ItemHerramientaDAC itemHerramientaDAC = new ItemHerramientaDAC();
            foreach (var item in itemHerramientaDAC.ReadbyHerramienta(id_Herramienta))
            {
                TipoHerramientaComponent tipoHerramienta = new TipoHerramientaComponent();

                ItemHerramienta itemHerramienta = new ItemHerramienta();
                itemHerramienta = item;
                itemHerramienta.tipoHerramienta = tipoHerramienta.ReadBy(item.tipoHerramienta.Id);
                itemHerramientas.Add(itemHerramienta);
            }


            return itemHerramientas;
        }

        public ItemHerramienta ReadBy(int id)
        {
            ItemHerramientaDAC itemHerramientaDAC = new ItemHerramientaDAC();
            ItemHerramienta item = new ItemHerramienta();
            item = itemHerramientaDAC.ReadBy(id);
            TipoHerramientaComponent tipoHerramienta = new TipoHerramientaComponent();
            item.tipoHerramienta = tipoHerramienta.ReadBy(item.tipoHerramienta.Id);
            return item;
        }

        public ItemHerramienta ReadBy(string id)
        {
            ItemHerramientaDAC itemHerramientaDAC = new ItemHerramientaDAC();
            ItemHerramienta item = new ItemHerramienta();
            item = itemHerramientaDAC.ReadBy(id);
            TipoHerramientaComponent tipoHerramienta = new TipoHerramientaComponent();
            item.tipoHerramienta = tipoHerramienta.ReadBy(item.tipoHerramienta.Id);
            return item;
        }

        public void Update(ItemHerramienta entity)
        {
            ItemHerramientaDAC itemHerramientaDAC = new ItemHerramientaDAC();
            itemHerramientaDAC.Update(entity);
        }
    }
}
