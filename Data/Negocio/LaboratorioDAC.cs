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
    public class LaboratorioDAC : DataAccessComponent, IRepository2<Laboratorio>
    {
        #region LaboratorioUsuario

        public List<Laboratorio> ReadbyUsuario(int id)
        {
            const string SQL_STATEMENT = "select * from LaboratorioUsuario as lu join Laboratorio as l on l.id_Laboratorio=lu.id_Laboratorio join Usuario as u on u.Id=lu.id where u.Id=@Id";

            List<Laboratorio> result = new List<Laboratorio>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Laboratorio categoria = ALoad(dr);
                        result.Add(categoria);
                    }
                }
            }
            return result;
        }

        public void DeleteLaboratorioUsuario(int id_laboratorio, int id)
        {
            const string SQL_STATEMENT = "delete from LaboratorioUsuario where ID_Laboratorio=@id_laboratorio and  id=@id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_laboratorio", DbType.Int32, id_laboratorio);
                db.AddInParameter(cmd, "@id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }
        public void CreateLaboratorioUsuario(int id_laboratorio, int id)
        {
            const string SQL_STATEMENT = "insert into LaboratorioUsuario(ID_Laboratorio,id)values(@ID_Laboratorio,@id) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@ID_Laboratorio", DbType.Int32, id_laboratorio);
                db.AddInParameter(cmd, "@id", DbType.Int32, id);

                db.ExecuteNonQuery(cmd);
            }


        }


        #endregion


        public Laboratorio ALoad(IDataReader dr)
        {
         
            Laboratorio laboratorio = new Laboratorio();
            laboratorio.Id=GetDataValue<int>(dr, "ID_laboratorio");
            laboratorio.nombre= GetDataValue<string>(dr, "nombre");
            laboratorio.codigo = GetDataValue<string>(dr, "codigo");

            laboratorio.piePagina = GetDataValue<string>(dr, "piePagina");
            return laboratorio;
        }






        public Laboratorio Create(Laboratorio entity)
        {
            const string SQL_STATEMENT = "insert into Laboratorio(codigo,nombre,piePagina,Activo)values(@codigo,@nombre,@piePagina,1) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@nombre", DbType.String, entity.nombre);
                db.AddInParameter(cmd, "@piePagina", DbType.String, entity.piePagina);
                db.AddInParameter(cmd, "@codigo", DbType.String, entity.codigo);


                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


            return entity;
        }

        public void Delete(int id)
        {
            const string SQL_STATEMENT = "delete from Laboratorio where ID_Laboratorioa=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        public List<Laboratorio> Read()
        {
            const string SQL_STATEMENT = "select * from Laboratorio where activo=1";

            List<Laboratorio> result = new List<Laboratorio>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Laboratorio categoria = ALoad(dr);
                        result.Add(categoria);
                    }
                }
            }
            return result;
        }
        public Laboratorio ReadBySector(int id)
        {
            const string SQL_STATEMENT = "select * from Laboratorio as l join Sector as s on l.id_Laboratorio=s.Id_Laboratario where Id_Sector=@Id";
            Laboratorio laboratorio = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        laboratorio = ALoad(dr);
                    }
                }
            }
            return laboratorio;
        }
        public Laboratorio ReadBy(int id)
        {
            const string SQL_STATEMENT = "select * from Laboratorio where activo=1 and ID_Laboratorio=@Id";
            Laboratorio laboratorio = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        laboratorio = ALoad(dr);
                    }
                }
            }
            return laboratorio;
        }

        public Laboratorio ReadBy(string campo)
        {
            const string SQL_STATEMENT = "select * from Laboratorio where activo=1 and nombre=@Id";
            Laboratorio laboratorio = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, campo);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        laboratorio = ALoad(dr);
                    }
                }
            }
            return laboratorio;
        }

        public void Update(Laboratorio entity)
        {
            const string SQL_STATEMENT = "update Laboratorio set nombre=@nombre, piePagina=@piePagina where ID_Laboratorio=@id ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))

            {
              
                db.AddInParameter(cmd, "@id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@nombre", DbType.String, entity.nombre);
                db.AddInParameter(cmd, "@piePagina", DbType.String, entity.piePagina);
                db.ExecuteReader(cmd);


            }
        }

        public Laboratorio ReadBy(Laboratorio identity)
        {
            throw new NotImplementedException();
        }

        public void Delete(Laboratorio identity)
        {
            throw new NotImplementedException();
        }
    }
}
