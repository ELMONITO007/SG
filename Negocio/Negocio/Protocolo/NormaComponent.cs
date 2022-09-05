using Data;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Bussiness
{
    public class NormaComponent : IRepository<Norma>
    {
        public Norma Create(Norma entity)
        {
            if (Verificar(entity))
            {
                NormaDAC normaDAC = new NormaDAC();
                return normaDAC.Create(entity);

            }
            else { return null; }
        }

        public void Delete(int id)
        {
            NormaDAC normaDAC = new NormaDAC(); 
            normaDAC.Delete(id);
        }

        public List<Norma> Read()
        {
            NormaDAC normaDAC = new NormaDAC();
            List<Norma> normas = new List<Norma>();
            List<Norma> result = new List<Norma>();
            normas = normaDAC.Read();
            foreach (var item in normas)
            {
               List< ItemNorma> ItemNorma = new List<ItemNorma>();
                ItemNormaComponent ItemNormaComponent = new ItemNormaComponent();
                ItemNorma = ItemNormaComponent.ReadByNorma(item.Id);
                Norma norma = new Norma(ItemNorma);
                norma.codigoNorma = item.codigoNorma;
                norma.Id = item.Id;
                norma.nombre = item.nombre;
                norma.pathFoto = item.pathFoto;
                norma.protocolo = item.protocolo;
                result.Add(norma);
            }

            return result;
        }
        public Norma ReadByTipoHerramienta(int id)
        {
            NormaDAC normaDAC = new NormaDAC();
            Norma item = new Norma();
            item = normaDAC.ReadByTipoHerramienta(id);
            ItemNormaComponent ItemNorma = new ItemNormaComponent();

            Norma result = new Norma(ItemNorma.ReadByNorma(item.Id));
            result.codigoNorma = item.codigoNorma;
            result.Id = item.Id;
            result.nombre = item.nombre;
            result.pathFoto = item.pathFoto;
            result.protocolo = item.protocolo;

            return result;

        }
        public Norma ReadBy(int id)
        {
            NormaDAC normaDAC = new NormaDAC();
            Norma item = new Norma();
            item = normaDAC.ReadBy(id);
            ItemNormaComponent ItemNorma = new ItemNormaComponent();
            Norma result = new Norma(ItemNorma.ReadByNorma(id));
            result.codigoNorma = item.codigoNorma;
            result.Id = id;
            result.nombre = item.nombre;
            result.pathFoto = item.pathFoto;
            result.protocolo = item.protocolo;

            return result;
        }

        public Norma ReadBy(string id)
        {
            NormaDAC normaDAC = new NormaDAC();
            return normaDAC.ReadBy(id);
        }

        public void Update(Norma entity)
        {
            NormaDAC normaDAC = new NormaDAC();
            normaDAC.Update(entity);
        }

        public bool Verificar(Norma entity)
        {
            if (ReadBy(entity.nombre) == null)
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
