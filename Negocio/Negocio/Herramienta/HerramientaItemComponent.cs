using Data;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bussiness
{
    public class HerramientaItemComponent
    {

        #region Formatear herramientas

        public List<HerramientaItem> PertigaUniversalFormatter(PertigaUniversal pertigaUniversales)


        {
            itemHerramientaComponent itemHerramientaComponent = new itemHerramientaComponent();
            HerramientaItem cabezal = new HerramientaItem();
            List<HerramientaItem> result = new List<HerramientaItem>();


            cabezal.itemHerramienta = itemHerramientaComponent.ReadBy("Acople Hembra");
            cabezal.herramienta.Id = pertigaUniversales.Id;
            cabezal.valor = pertigaUniversales.acopleHembra;

            HerramientaItem cabezal2 = new HerramientaItem();
            cabezal2.itemHerramienta = itemHerramientaComponent.ReadBy("Acople Macho");
            cabezal2.herramienta.Id = pertigaUniversales.Id;
            cabezal2.valor = pertigaUniversales.acopleMacho;

            HerramientaItem diametro = new HerramientaItem();
            diametro.itemHerramienta = itemHerramientaComponent.ReadBy("Diametro");
            diametro.herramienta.Id = pertigaUniversales.Id;
            diametro.valor = pertigaUniversales.diametro.ToString();

            HerramientaItem largoTotal = new HerramientaItem();
            largoTotal.itemHerramienta = itemHerramientaComponent.ReadBy("Largo aislante");
            largoTotal.herramienta.Id = pertigaUniversales.Id;
            largoTotal.valor = pertigaUniversales.largoAislante.ToString();

            HerramientaItem restaurada = new HerramientaItem();
            restaurada.itemHerramienta = itemHerramientaComponent.ReadBy("Restaurada");
            restaurada.herramienta.Id = pertigaUniversales.Id;
            restaurada.valor = "No";

            result.Add(cabezal);
            result.Add(cabezal2);

            result.Add(diametro);
            result.Add(largoTotal);
            result.Add(restaurada);

            return result;

        }


        #endregion

        public HerramientaItem Create(HerramientaItem entity)

        {
            HerramientaItemDAC herramientaItemDAC = new HerramientaItemDAC();
            return herramientaItemDAC.Create(entity);


        }
        public void Update(HerramientaItem entity)

        {
            HerramientaItemDAC herramientaItemDAC = new HerramientaItemDAC();
             herramientaItemDAC.Update(entity);


        }


        public List<HerramientaItem> ReadbyTipo(int id_Herramienta)

        {
            HerramientaItemDAC herramientaItemDAC = new HerramientaItemDAC();
            List<HerramientaItem> result = new List<HerramientaItem>();
            foreach (var item in herramientaItemDAC.ReadbyTipo(id_Herramienta))
            {
                result.Add(ReadBy(item));


            }
            return result;

        }
        public HerramientaItem ReadBy(HerramientaItem entity)
        {
            HerramientaItemDAC herramientaItemDAC = new HerramientaItemDAC();
            HerramientaItem herramienta = new HerramientaItem();
            herramienta = herramientaItemDAC.ReadBy(entity);

            ItemHerramienta itemHerramienta = new ItemHerramienta();
            itemHerramientaComponent itemHerramientaComponent = new itemHerramientaComponent();
            itemHerramienta = itemHerramientaComponent.ReadBy(herramienta.itemHerramienta.Id);
            Herramienta herr = new Herramienta();
            herr.Id = herramienta.herramienta.Id;
            HerramientaItem result = new HerramientaItem(herr,itemHerramienta);
            result.valor = herramienta.valor;
            return result;

        }

        private bool Verificar(HerramientaItem entity)

        {
            HerramientaItemDAC herramienta = new HerramientaItemDAC();
            if (herramienta.ReadBy(entity) == null)
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
