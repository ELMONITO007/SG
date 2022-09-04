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
    public class HerramientaItemDAC : DataAccessComponent
    {
        public HerramientaItem ALoad(IDataReader dr)

        {
            Herramienta herramienta = new Herramienta();
            herramienta.Id = GetDataValue<int>(dr, "Id_Herramienta");
            ItemHerramienta itemHerramienta = new ItemHerramienta();
            itemHerramienta.Id = GetDataValue<int>(dr, "id_itemHerramienta");
            HerramientaItem herramientaItem = new HerramientaItem(herramienta, itemHerramienta);
            herramientaItem.valor = GetDataValue<string>(dr, "Valor");
            return herramientaItem;
        }

        public HerramientaItem Create(HerramientaItem entity)
        {

            const string SQL_STATEMENT = "insert into Herramienta_item (Id_Herramienta ,id_itemHerramienta,Valor) values(@Id_Herramienta ,@id_itemHerramienta,@Valor) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id_Herramienta", DbType.Int32, entity.herramienta.Id);
                db.AddInParameter(cmd, "@id_itemHerramienta", DbType.Int32, entity.itemHerramienta.Id);
                db.AddInParameter(cmd, "@Valor", DbType.String, entity.valor);

                db.ExecuteNonQuery(cmd);
            }

            return ReadBy(entity);
        }
        public List<HerramientaItem> ReadbyTipo(int id_Herramienta)
        {
            const string SQL_STATEMENT = "select * from Herramienta_item where Id_Herramienta=@id_Herramienta";

            List<HerramientaItem> result = new List<HerramientaItem>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_Herramienta", DbType.Int32, id_Herramienta);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        HerramientaItem sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
       
        public HerramientaItem ReadBy(HerramientaItem entity)
        {
            const string SQL_STATEMENT = "select * from Herramienta_item where  id_itemHerramienta=@id_itemHerramienta and Id_Herramienta=@ID_Herramienta";
            HerramientaItem gerencia = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@ID_Herramienta", DbType.Int32, entity.herramienta.Id);
                db.AddInParameter(cmd, "@id_itemHerramienta", DbType.Int32, entity.itemHerramienta.Id);

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


        public void Update(HerramientaItem entity)
        {

            const string SQL_STATEMENT = "update Herramienta_item set valor=@valor where  id_itemHerramienta=@id_itemHerramienta and Id_Herramienta=@ID_Herramienta";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_itemHerramienta", DbType.Int32, entity.itemHerramienta.Id);

                db.AddInParameter(cmd, "@ID_Herramienta", DbType.Int32, entity.herramienta.Id);
                db.AddInParameter(cmd, "@valor", DbType.String, entity.valor);

                db.ExecuteNonQuery(cmd);

            }
        }



    }
}
