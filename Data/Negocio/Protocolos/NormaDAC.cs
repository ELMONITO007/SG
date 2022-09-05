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
    public class NormaDAC : DataAccessComponent, IRepository2<Norma>
    {
        public Norma ALoad(IDataReader dr)
        {
            Norma norma = new Norma();
            norma.Id= GetDataValue<int>(dr, "ID_Norma");
            norma.nombre= GetDataValue<string>(dr, "nombre");
            norma.pathFoto= GetDataValue<string>(dr, "pathFoto");
            norma.protocolo = GetDataValue<string>(dr, "protocolo");
            norma.codigoNorma = GetDataValue<string>(dr, "codigoNorma");
            return norma;

        }

        public Norma Create(Norma entity)
        {
            const string SQL_STATEMENT = "insert into Norma (codigoNorma,nombre,protocolo,pathFoto,Activo) values(@codigoNorma,@nombre,@protocolo,@pathFoto,1) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@codigoNorma", DbType.String, entity.codigoNorma);
                db.AddInParameter(cmd, "@nombre", DbType.String, entity.nombre);
                db.AddInParameter(cmd, "@protocolo", DbType.String, entity.protocolo);
                db.AddInParameter(cmd, "@pathFoto", DbType.String, entity.pathFoto);

                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }
            return ReadBy(entity.nombre);

        }

        public void Delete(int id)
        {
            const string SQL_STATEMENT = "update Norma set Activo=0 where ID_Norma=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        public List<Norma> Read()
        {
            const string SQL_STATEMENT = "select * from Norma where activo=1";

            List<Norma> result = new List<Norma>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Norma direccion = ALoad(dr);
                        result.Add(direccion);
                    }
                }
            }
            return result;
        }

        public Norma ReadBy(int id)
        {
            const string SQL_STATEMENT = "select * from Norma where activo=1 and ID_Norma=@Id";
            Norma direccion = new Norma();

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



        public Norma ReadByTipoHerramienta(int id)
        {
            const string SQL_STATEMENT = "select * from TipoHerramienta as tp join norma as n on n.id_Norma=tp.ID_Norma where ID_TipoHerramienta=@Id";
            Norma direccion = new Norma();

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
        public Norma ReadBy(string campo)
        {
            const string SQL_STATEMENT = "select * from Norma where activo=1 and nombre=@Id";
            Norma direccion = null;

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

        public void Update(Norma entity)
        {
            const string SQL_STATEMENT = "update Norma set codigoNorma=@codigoNorma,nombre=@nombre,protocolo=@protocolo where ID_Norma=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@codigoNorma", DbType.String, entity.codigoNorma);
                db.AddInParameter(cmd, "@nombre", DbType.String, entity.nombre);
                db.AddInParameter(cmd, "@protocolo", DbType.String, entity.protocolo);

                db.ExecuteNonQuery(cmd);

            }
        }

        public Norma ReadBy(Norma identity)
        {
            throw new NotImplementedException();
        }

        public void Delete(Norma identity)
        {
            throw new NotImplementedException();
        }
    }
}
