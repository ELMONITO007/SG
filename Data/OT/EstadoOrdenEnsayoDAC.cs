using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace Data
{
    public class EstadoOrdenEnsayoDAC : DataAccessComponent
    {
        public EstadoOrdenEnsayo ALoad(IDataReader dr)
        {
            EstadoOrdenEnsayo estadoOrdenEnsayo = new EstadoOrdenEnsayo();
            estadoOrdenEnsayo.Id = GetDataValue<int>(dr, "id_estadoOrdenEnsayo");
            estadoOrdenEnsayo.controlador = GetDataValue<string>(dr, "controlador");
            estadoOrdenEnsayo.estadoInicial = GetDataValue<string>(dr, "estadoInicial");
            estadoOrdenEnsayo.orden = GetDataValue<int>(dr, "orden");
            estadoOrdenEnsayo.responsable = GetDataValue<string>(dr, "responsable");
            estadoOrdenEnsayo.texto = GetDataValue<string>(dr, "texto");
            estadoOrdenEnsayo.estadoFinal = GetDataValue<string>(dr, "estadoFinal");
            estadoOrdenEnsayo.tarea = GetDataValue<string>(dr, "tarea");



            return estadoOrdenEnsayo;
        }

        
      

  

        public List<EstadoOrdenEnsayo> Read()
        {
            throw new NotImplementedException();
        }

        public EstadoOrdenEnsayo ReadByEstadoOrdenl(int orden)
        {
            const string SQL_STATEMENT = "select * from EstadoOrdenEnsayo where  orden=@orden";
            EstadoOrdenEnsayo estadoOrdenEnsayo = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {


                db.AddInParameter(cmd, "@orden", DbType.Int32, orden);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        estadoOrdenEnsayo = ALoad(dr);
                    }
                }
            }
            return estadoOrdenEnsayo;
        }

        
        public EstadoOrdenEnsayo ReadByEstadoFinal(string EstadoFinal)
        {
            const string SQL_STATEMENT = "select * from EstadoOrdenEnsayo where  EstadoFinal=@EstadoFinal";
            EstadoOrdenEnsayo estadoOrdenEnsayo = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
             

                db.AddInParameter(cmd, "@EstadoFinal", DbType.String, EstadoFinal);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        estadoOrdenEnsayo = ALoad(dr);
                    }
                }
            }
            return estadoOrdenEnsayo;
        }

        public EstadoOrdenEnsayo ReadBy(int id)
        {
            const string SQL_STATEMENT = "select * from EstadoOrdenEnsayo where  id_EstadoOrdenEnsayo=@id";
            EstadoOrdenEnsayo estadoOrdenEnsayo = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {


                db.AddInParameter(cmd, "@id", DbType.String, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        estadoOrdenEnsayo = ALoad(dr);
                    }
                }
            }
            return estadoOrdenEnsayo;
        }
    }
}
