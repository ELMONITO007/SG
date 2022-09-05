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
    public class ItemNormaDAC : DataAccessComponent
    {
        #region item protocolo

        public ItemNorma ALoad(IDataReader dr)
        {
            ItemNorma ItemNorma = new ItemNorma();
            ItemNorma.Id = GetDataValue<int>(dr, "id_ListadoNorma");
            ItemNorma.nombre = GetDataValue<string>(dr, "nombre");
     
            return ItemNorma;
        }



        #endregion

   

      
        public ItemNorma Create(ItemNorma entity)
        {
            const string SQL_STATEMENT = "insert into ListadoNorma (nombre ,Activo) values(@Gerencia,1) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Gerencia", DbType.String, entity.nombre);

          

                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


            return ReadBy(entity.nombre);
        }
        public void CreateListado_Norma(int id_norma,int id_ItemNorma)
        {
            const string SQL_STATEMENT = "insert into norma_ListadoNorma (id_norma ,id_ListadoNorma) values(@id_norma,@id_ListadoNorma) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_norma", DbType.Int32, id_norma);
                db.AddInParameter(cmd, "@id_ListadoNorma", DbType.Int32, id_ItemNorma);



                db.ExecuteNonQuery(cmd);
            }


           
        }
    
        public List<ItemNorma> ReadByNorma(int id_norma)
        {
            const string SQL_STATEMENT = "select * from norma_ListadoNorma as nl join ListadoNorma as lm on nl.id_ListadoNorma=lm.id_ListadoNorma where id_norma=@Id and lm.activo=1";

            List<ItemNorma> result = new List<ItemNorma>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id_norma);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        ItemNorma sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }

        public ItemNorma ReadBy(int id_norma,string norma)
        {
            const string SQL_STATEMENT = "select * from norma_ListadoNorma as nl join ListadoNorma as lm on nl.id_ListadoNorma=lm.id_ListadoNorma where id_norma=@Id and nombre=@nombre and lm.activo=1";
            ItemNorma gerencia = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id_norma);
                db.AddInParameter(cmd, "@nombre", DbType.String, norma);
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

        public ItemNorma ReadBy(string campo)
        {
            const string SQL_STATEMENT = "select * from ListadoNorma  where nombre=@nombre and activo=1";
            ItemNorma gerencia = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
            
                db.AddInParameter(cmd, "@nombre", DbType.String, campo);
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
        public ItemNorma ReadBy(int campo)
        {
            const string SQL_STATEMENT = "select * from ListadoNorma  where id_listadoNorma=@nombre and activo=1";
            ItemNorma gerencia = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {

                db.AddInParameter(cmd, "@nombre", DbType.Int32, campo);
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
        public void Update(ItemNorma entity)
        {
            const string SQL_STATEMENT = "update ListadoNorma set nombre=@nombre where Id_ListadoNorma=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);

                db.AddInParameter(cmd, "@nombre", DbType.String, entity.nombre);

                db.ExecuteNonQuery(cmd);


            }
        }
        public void delete(int id)
        {
            const string SQL_STATEMENT = "update ListadoNorma set activo=0 where Id_ListadoNorma=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);





            }
        }
    }
}
