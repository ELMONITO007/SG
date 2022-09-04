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
    public class TipoHerramientaDAC : DataAccessComponent, IRepository2<TipoHerramienta>
    {
        public TipoHerramienta ALoad(IDataReader dr)
        {
            Norma norma = new Norma();
            norma.Id= GetDataValue<int>(dr, "ID_norma");
            TipoHerramienta tipoHerramienta = new TipoHerramienta(null,null,norma) ;

            tipoHerramienta.Id= GetDataValue<int>(dr, "ID_tipoHerramienta");
            tipoHerramienta.tipoHerramienta = GetDataValue<string>(dr, "tipoHerramienta");
            tipoHerramienta.subTipo = GetDataValue<string>(dr, "subTipo");
            tipoHerramienta.tipoEnsayo = GetDataValue<string>(dr, "tipoEnsayo");

            tipoHerramienta.tipoUso = GetDataValue<string>(dr, "tipoUso");
            return tipoHerramienta;

        }

        public TipoHerramienta Create(TipoHerramienta entity)
        {

            const string SQL_STATEMENT = "insert into TipoHerramienta (tipoHerramienta,subTipo,tipoEnsayo,tipoUso,id_norma,Activo) values(@tipoHerramienta,@subTipo,@tipoEnsayo,@tipoUso,@id_norma,1) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_norma", DbType.Int32, entity.norma.Id);
                db.AddInParameter(cmd, "@tipoHerramienta", DbType.String, entity.tipoHerramienta);
                db.AddInParameter(cmd, "@subTipo", DbType.String, entity.subTipo);

                db.AddInParameter(cmd, "@tipoEnsayo", DbType.String, entity.tipoEnsayo);

                db.AddInParameter(cmd, "@tipoUso", DbType.String, entity.tipoUso);

                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


            return entity;
        }

        public void Delete(int id)
        {
            const string SQL_STATEMENT = "update TipoHerramienta set Activo=0 where ID_TipoHerramienta=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        public List<TipoHerramienta> Read()
        {
            const string SQL_STATEMENT = "select * from TipoHerramienta where activo=1";

            List<TipoHerramienta> result = new List<TipoHerramienta>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        TipoHerramienta direccion = ALoad(dr);
                        result.Add(direccion);
                    }
                }
            }
            return result;
        }

        public TipoHerramienta ReadBy(int id)
        {
            const string SQL_STATEMENT = "select * from TipoHerramienta where activo=1 and ID_TipoHerramienta=@Id";
            TipoHerramienta direccion = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
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
        public TipoHerramienta ObtenerTipoPorCodigo(string id)
        {
            const string SQL_STATEMENT = "select * from codigo as c join TipoHerramienta as tp on tp.ID_tipoHerramienta=c.id_tipoHerramienta where Codigo=@Id";
            TipoHerramienta direccion = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.String, id);
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
        public TipoHerramienta ReadBy(string campo)
        {
            const string SQL_STATEMENT = "select * from TipoHerramienta where activo=1 and TipoHerramienta=@Id";
            TipoHerramienta direccion = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.String, campo);
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

        public void Update(TipoHerramienta entity)
        {
            const string SQL_STATEMENT = "update TipoHerramienta set TipoHerramienta=@TipoHerramienta,subTipo=@subTipo,tipoEnsayo=@tipoEnsayo,tipoUso=@tipoUso where ID_TipoHerramienta=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@tipoHerramienta", DbType.String, entity.tipoHerramienta);
                db.AddInParameter(cmd, "@subTipo", DbType.String, entity.subTipo);

                db.AddInParameter(cmd, "@tipoEnsayo", DbType.String, entity.tipoEnsayo);

                db.AddInParameter(cmd, "@tipoUso", DbType.String, entity.tipoUso);
                db.ExecuteNonQuery(cmd);

            }
        }


        #region Instrumento

        public TipoHerramienta ALoadInstrumento(IDataReader dr)
        {
            List<TipoHerramienta> tipos = new List<TipoHerramienta>();
            TipoHerramienta tipoHerra = new TipoHerramienta();
            tipoHerra.Id = GetDataValue<int>(dr, "ID_TipoInstrumento");
            tipos.Add(tipoHerra);
            TipoHerramienta tipoHerramienta = new TipoHerramienta(null,tipos,null);

            tipoHerramienta.Id = GetDataValue<int>(dr, "id_tipoinstrumento");
         

            return tipoHerramienta;

        }
        public void CreateInstrumento(int ID_TipoHerramienta,int ID_TipoInstrumento)
        {

            const string SQL_STATEMENT = "insert into Instrumento (ID_TipoHerramienta,ID_TipoInstrumento) values(@ID_TipoHerramienta,@ID_TipoInstrumento) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@ID_TipoHerramienta", DbType.Int32, ID_TipoHerramienta);
                db.AddInParameter(cmd, "@ID_TipoInstrumento", DbType.Int32, ID_TipoInstrumento);

                db.ExecuteNonQuery(cmd);
            }


        
        }
        public void Delete(int ID_TipoHerramienta, int ID_TipoInstrumento)
        {
            const string SQL_STATEMENT = "delete  Instrumento where ID_TipoHerramienta=@ID_TipoHerramienta and ID_TipoInstrumento=@ID_TipoInstrumento ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@ID_TipoHerramienta", DbType.Int32, ID_TipoHerramienta);
                db.AddInParameter(cmd, "@ID_TipoInstrumento", DbType.Int32, ID_TipoInstrumento);

                db.ExecuteNonQuery(cmd);
            }
        }

        public List<TipoHerramienta> InstrumentosParaUnaHerramienta(int ID_TipoHerramienta)
        {
            const string SQL_STATEMENT = "select * from Instrumento where ID_TipoHerramienta=@ID_TipoHerramienta ";

            List<TipoHerramienta> result = new List<TipoHerramienta>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@ID_TipoHerramienta", DbType.Int32, ID_TipoHerramienta);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        TipoHerramienta direccion = ALoadInstrumento(dr);
                        result.Add(direccion);
                    }
                }
            }
            return result;
        }

        public TipoHerramienta ReadByInstrumento(int ID_TipoHerramienta, int ID_TipoInstrumento)
        {
            const string SQL_STATEMENT = "select * from instrumento where ID_TipoHerramienta=@ID_TipoHerramienta and ID_TipoInstrumento=@ID_TipoInstrumento";
            TipoHerramienta direccion = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, ID_TipoHerramienta);
                db.AddInParameter(cmd, "@Id", DbType.Int32, ID_TipoInstrumento);

                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        direccion = ALoadInstrumento(dr);
                    }
                }
            }
            return direccion;
        }

        public TipoHerramienta ReadBy(TipoHerramienta identity)
        {
            throw new NotImplementedException();
        }

        public void Delete(TipoHerramienta identity)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
