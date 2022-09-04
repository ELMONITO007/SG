using Entities;
using Entities.Negocio;
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
    public class ProtocoloItemDAC : DataAccessComponent
    {
        public ProtocoloItem ALoad(IDataReader dr)
        {

            Protocolo protocolo = new Protocolo();
            protocolo.Id = GetDataValue<int>(dr, "ID_Protocolo");
            ItemNorma item= new ItemNorma();
            item.Id = GetDataValue<int>(dr, "Id_ListadoNorma");
            ProtocoloItem protocoloItem=new ProtocoloItem(protocolo,item);
            protocoloItem.Id= GetDataValue<int>(dr, "ID_Protocolo_item");
            protocoloItem.valor = GetDataValue<string>(dr, "valor");

            return protocoloItem;


        }

        public ProtocoloItem Create(ProtocoloItem entity)
        { 
        
            const string SQL_STATEMENT = "insert into Protocolo_Item (ID_Protocolo, Id_ListadoNorma,valor) values(@ID_Protocolo, @Id_ListadoNorma,@valor) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@valor", DbType.String, entity.valor);
                db.AddInParameter(cmd, "@Id_ListadoNorma", DbType.Int32, entity.ItemNorma.Id);

                db.AddInParameter(cmd, "@ID_Protocolo", DbType.Int32, entity.protocolo.Id);


                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


            return ReadBy(entity);
        }


        public ProtocoloItem ReadBy(ProtocoloItem identity)
        {
            const string SQL_STATEMENT = "select * from Protocolo_Item where Id_ListadoNorma=@Id_ListadoNorma and Id_Protocolo=@Id_Protocolo and Valor=@Valor";
            ProtocoloItem direccion = new ProtocoloItem();

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@valor", DbType.String, identity.valor);
                db.AddInParameter(cmd, "@Id_ListadoNorma", DbType.Int32, identity.ItemNorma.Id);

                db.AddInParameter(cmd, "@ID_Protocolo", DbType.Int32, identity.protocolo.Id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        direccion = ALoad(dr);
                    }
                }
            }
            return direccion;
        }
        public List<ProtocoloItem> ReadByProtocolo(int id)
        {
            const string SQL_STATEMENT = "select * from Protocolo_Item where Id_Protocolo=@Id_Protocolo";

            List<ProtocoloItem> result = new List<ProtocoloItem>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
               

                db.AddInParameter(cmd, "@ID_Protocolo", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        ProtocoloItem direccion = new ProtocoloItem();
                        direccion = ALoad(dr);
                        result.Add(direccion);
                    }
                }
            }
            return result;
        }
        

        public void Update(ProtocoloItem entity)
        {

            const string SQL_STATEMENT = "update Protocolo_Item set Valor=Valor where ID_Protocolo_item=@id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@valor", DbType.String, entity.valor);
             
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);

                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


           
        }
    }
}
