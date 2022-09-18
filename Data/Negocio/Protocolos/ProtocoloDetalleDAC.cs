using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class ProtocoloDetalleDAC : DataAccessComponent
    {
        public ProtocoloDetalle ALoad(IDataReader dr)
        {

            ProtocoloDetalle instrumento = new ProtocoloDetalle();
            instrumento.tipo = GetDataValue<string>(dr, "tipo");
            instrumento.id_protocolo= GetDataValue<int>(dr, "Id_Protocolo");
            instrumento.Id = GetDataValue<int>(dr, "id_ProtocoloDetalle");
            instrumento.codigo = GetDataValue<string>(dr, "codigo");
            instrumento.marca = GetDataValue<string>(dr, "marca");
            instrumento.numeroSerie = GetDataValue<string>(dr, "numeroSerie");
            instrumento.vencimiento = GetDataValue<string>(dr, "vencimiento");

            instrumento.certificado = GetDataValue<string>(dr, "certificado");

            return instrumento;

        }
        public ProtocoloDetalle Create(ProtocoloDetalle entity)
        {
            const string SQL_STATEMENT = "insert into ProtocoloDetalle (codigo,numeroSerie,vencimiento,marca,certificado,tipo,id_protocolo) values(@codigo,@numeroSerie,@vencimiento,@marca,@certificado,@tipo,@id_protocolo) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id_Protocolo", DbType.Int32, entity.id_protocolo);

                db.AddInParameter(cmd, "@codigo", DbType.String, entity.codigo);
                db.AddInParameter(cmd, "@numeroSerie", DbType.String, entity.numeroSerie);
                db.AddInParameter(cmd, "@vencimiento", DbType.String, entity.vencimiento);
                db.AddInParameter(cmd, "@marca", DbType.String, entity.marca);


                db.AddInParameter(cmd, "@certificado", DbType.String, entity.certificado);
                db.AddInParameter(cmd, "@tipo", DbType.String, entity.tipo);

                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


            return entity;
        }
        public List<ProtocoloDetalle> ReadbyProtocolo(int id_protocolo)
        {
            const string SQL_STATEMENT = "select * from ProtocoloDetalle where Id_Protocolo=@Id_Protocolo";

            List<ProtocoloDetalle> result = new List<ProtocoloDetalle>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id_Protocolo", DbType.Int32, id_protocolo);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        ProtocoloDetalle sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public ProtocoloDetalle ReadBy(int id)
        {
            const string SQL_STATEMENT = "select * from ProtocoloDetalle where  ID_ProtocoloDetalle=@Id";
            ProtocoloDetalle gerencia = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        gerencia = ALoad(dr);
                    }
                }
            }
            return gerencia;
        }
    }
}
