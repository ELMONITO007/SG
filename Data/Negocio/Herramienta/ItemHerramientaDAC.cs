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
    public class ItemHerramientaDAC : DataAccessComponent, IRepository2<ItemHerramienta>
    {
        public ItemHerramienta ALoad(IDataReader dr)
        {
            ItemHerramienta itemHerramienta = new ItemHerramienta();
            itemHerramienta.Id = GetDataValue<int>(dr, "ID_itemHerramienta");
            itemHerramienta.nombre = GetDataValue<string>(dr, "nombre");
            itemHerramienta.tipoHerramienta.Id = GetDataValue<int>(dr, "ID_TipoHerramienta");
            itemHerramienta.tipo = GetDataValue<string>(dr, "tipo");
            itemHerramienta.Ayuda = GetDataValue<string>(dr, "Ayuda");
            itemHerramienta.Maximo = GetDataValue<int>(dr, "Maximo");
            itemHerramienta.Minimo = GetDataValue<int>(dr, "Minimo");

            return itemHerramienta;
        }

        public ItemHerramienta Create(ItemHerramienta entity)
        {
            const string SQL_STATEMENT = "insert into ItemHerramienta (nombre ,Activo,ID_TipoHerramientam,Ayuda,Maximo,Minimo,tipo) values(@Gerencia,1,@id_Herramienta,@Ayuda,@Maximo,@Minimo,@tipo) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Gerencia", DbType.String, entity.nombre);
                db.AddInParameter(cmd, "@tipo", DbType.String, entity.tipo);
                db.AddInParameter(cmd, "@Ayuda", DbType.String, entity.Ayuda);
                db.AddInParameter(cmd, "@Maximo", DbType.Int32, entity.Maximo);
                db.AddInParameter(cmd, "@Minimo", DbType.Int32, entity.Minimo);

                db.AddInParameter(cmd, "@id_Herramienta", DbType.Int32, entity.tipoHerramienta.Id);

                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


            return entity;
        }

        public void Delete(int id)
        {
            const string SQL_STATEMENT = "update ItemHerramienta set Activo=0 where ID_ItemHerramienta=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        public List<ItemHerramienta> ReadbyHerramienta(int id_Herramienta)
        {
            const string SQL_STATEMENT = "select * from ItemHerramienta where activo=1 and ID_TipoHerramienta=@Id";

            List<ItemHerramienta> result = new List<ItemHerramienta>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id_Herramienta);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        ItemHerramienta sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public List<ItemHerramienta> Read()
        {
            throw new NotImplementedException();
        }

        public ItemHerramienta ReadBy(int id)
        {
            const string SQL_STATEMENT = "select * from ItemHerramienta  where activo=1 and Id_ItemHerramienta=@Id";
            ItemHerramienta gerencia = null;

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

        public ItemHerramienta ReadBy(string campo)
        {
            const string SQL_STATEMENT = "select * from ItemHerramienta  where activo=1 and nombre=@nombre";
            ItemHerramienta gerencia = null;

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
        public ItemHerramienta ReadBy(ItemHerramienta entity)
        {
            const string SQL_STATEMENT = "select * ItemHerramienta  where activo=1 and id_Herramienta=@Id and nombre=@nombre";
            ItemHerramienta gerencia = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@nombre", DbType.Int32, entity.nombre);

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

        public void Update(ItemHerramienta entity)
        {
            const string SQL_STATEMENT = "update ItemHerramienta set nombre=@nombre where Id_ItemHerramienta=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);

                db.AddInParameter(cmd, "@nombre", DbType.String, entity.nombre);
      



            }
        }

        public void Delete(ItemHerramienta identity)
        {
            throw new NotImplementedException();
        }
    }
}
