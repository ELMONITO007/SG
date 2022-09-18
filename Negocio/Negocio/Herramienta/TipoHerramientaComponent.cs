using Data;
using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bussiness
{
    public class TipoHerramientaComponent : IRepository<TipoHerramienta>
    {


        public TipoHerramienta Create(TipoHerramienta entity)
        {
            if (Verificar(entity))
            {
                TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();
                return tipoHerramienta.Create(entity);
            }
            else
            {
                return null;
            }
        }

        public void Delete(int id)
        {
            TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();
            tipoHerramienta.Delete(id);
        }
        public TipoHerramienta ObtenerTipoPorCodigo(string id)

        {
            TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();
            TipoHerramienta item = new TipoHerramienta();
           return tipoHerramienta.ObtenerTipoPorCodigo(id);
      
        }
        public List<TipoHerramienta> Read()
        {
            TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();
            List<TipoHerramienta> result = new List<TipoHerramienta>();

            List<TipoHerramienta> tipoHerramientas = new List<TipoHerramienta>();
            tipoHerramientas = tipoHerramienta.Read();

            //foreach (var item in tipoHerramientas)
            //{
            //    NormaComponent norma = new NormaComponent();

            //    TipoHerramienta tipo = new TipoHerramienta(null,InstrumentosParaUnaHerramienta(item.Id),norma.ReadByTipoHerramienta(item.Id));
            //    tipo.Id = item.Id;
            //    tipo.norma = item.norma;
            //    tipo.subTipo = item.subTipo;
            //    tipo.tipoEnsayo = item.tipoEnsayo;
            //    tipo.tipoHerramienta = item.tipoHerramienta;
            //    tipo.tipoUso = item.tipoUso;

            //}


            return tipoHerramienta.Read();
        }
        public TipoHerramienta ReadBySimple(int id)

        {

            TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();
            TipoHerramienta item = new TipoHerramienta();
            item = tipoHerramienta.ReadBy(id);
            NormaComponent norma = new NormaComponent();
           
            Norma unaNorma = new Norma();
            unaNorma = norma.ReadByTipoHerramienta(id);


            TipoHerramienta tipo = new TipoHerramienta(null, null, unaNorma);
            tipo.Id = item.Id;

            tipo.subTipo = item.subTipo;
            tipo.tipoEnsayo = item.tipoEnsayo;
            tipo.tipoHerramienta = item.tipoHerramienta;
            tipo.tipoUso = item.tipoUso;

            return tipo;
        }
        public TipoHerramienta ReadBy(int id)
        {
            TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();
            TipoHerramienta item = new TipoHerramienta();
            item = tipoHerramienta.ReadBy(id);
            NormaComponent norma = new NormaComponent();
            List<TipoHerramienta> instumentos = new List<TipoHerramienta>();

            Norma unaNorma = new Norma();
            unaNorma = norma.ReadByTipoHerramienta(id);


            TipoHerramienta tipo = new TipoHerramienta(null, instumentos, unaNorma);
            tipo.Id = item.Id;

            tipo.subTipo = item.subTipo;
            tipo.tipoEnsayo = item.tipoEnsayo;
            tipo.tipoHerramienta = item.tipoHerramienta;
            tipo.tipoUso = item.tipoUso;

            return tipo;
        }

        public TipoHerramienta ReadBy(string campo)
        {

            TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();
            TipoHerramienta item = new TipoHerramienta();
            item = tipoHerramienta.ReadBy(campo);
            return ReadBy(item.Id);

        }

        public void Update(TipoHerramienta entity)
        {
            TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();
            tipoHerramienta.Update(entity);
        }

        public bool Verificar(TipoHerramienta entity)
        {
            TipoHerramienta result = default(TipoHerramienta);
            TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();

            result = tipoHerramienta.ReadBy(entity.tipoHerramienta);
            if (result is null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        #region Instrumento

        public bool CreateInstrumento(int ID_TipoHerramienta, int ID_TipoInstrumento)


        {
            if (VerificarInstumento(ID_TipoHerramienta, ID_TipoInstrumento))
            {
                TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();
                tipoHerramienta.CreateInstrumento(ID_TipoHerramienta, ID_TipoInstrumento);
                return true;
            }
            else
            {
                return true;
            }


        }

        public void Delete(int ID_TipoHerramienta, int ID_TipoInstrumento)
        {

            TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();
            tipoHerramienta.Delete(ID_TipoHerramienta, ID_TipoInstrumento);
        }



        public List<TipoHerramienta> InstrumentosParaUnaHerramienta(int ID_TipoHerramienta)


        {
            List<TipoHerramienta> result = new List<TipoHerramienta>();
            TipoHerramientaDAC tipoHerramientaDAC = new TipoHerramientaDAC();
            List<TipoHerramienta> lista = new List<TipoHerramienta>();
            lista = tipoHerramientaDAC.InstrumentosParaUnaHerramienta(ID_TipoHerramienta);


            foreach (var item in lista)
            {


                TipoHerramienta tipo = new TipoHerramienta();
                tipo = tipoHerramientaDAC.ReadBy(item.Id);
                result.Add(tipo);


            }


            return result;


        }

        public bool Verificar(int ID_TipoHerramienta, int ID_TipoInstrumento)
        {
            TipoHerramienta result = default(TipoHerramienta);
            TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();

            result = tipoHerramienta.ReadByInstrumento(ID_TipoHerramienta, ID_TipoInstrumento);
            if (result is null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool VerificarInstumento(int ID_TipoHerramienta, int ID_TipoInstrumento)
        {
            TipoHerramienta result = default(TipoHerramienta);
            TipoHerramientaDAC tipoHerramienta = new TipoHerramientaDAC();

            result = tipoHerramienta.ReadByInstrumento(ID_TipoHerramienta, ID_TipoInstrumento);
            if (result is null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        #endregion
    }
}
