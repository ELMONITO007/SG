using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Data;
using Entities;
using Negocio;

namespace Negocio
{
    public class LaboratorioComponent : IRepository<Laboratorio>
    {
        #region LaboratorioUsuario
        public List<Laboratorio> ReadbyUsuario(int id)
        {

            LaboratorioDAC laboratorio = new LaboratorioDAC();
            return laboratorio.ReadbyUsuario(id);

        }


        public Laboratorio ReadBySector(int id)

        {
            LaboratorioDAC laboratorioDAC = new LaboratorioDAC();
            return laboratorioDAC.ReadBySector(id);

        }
       


     
        #endregion

        public Laboratorio Create(Laboratorio entity)
        {
            LaboratorioDAC laboratorio = new LaboratorioDAC();
            return laboratorio.Create(entity);
        }

        public void Delete(int id)
        {
            LaboratorioDAC laboratorio = new LaboratorioDAC();
            laboratorio.Delete(id);
        }

        public List<Laboratorio> Read()
        {
            LaboratorioDAC laboratorio = new LaboratorioDAC();
            return laboratorio.Read();
        }

        public Laboratorio ReadBy(int id)
        {
            LaboratorioDAC laboratorio = new LaboratorioDAC();
            return laboratorio.ReadBy(id);
        }

        public Laboratorio ReadBy(string id)
        {
            LaboratorioDAC laboratorio = new LaboratorioDAC();
            return laboratorio.ReadBy(id);
        }

        public void Update(Laboratorio entity)
        {
            LaboratorioDAC laboratorio = new LaboratorioDAC();
            laboratorio.Update(entity);
        }

        public bool Verificar(Laboratorio entity)
        {
            throw new NotImplementedException();
        }
    }
}
