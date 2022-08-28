using Microsoft.Practices.EnterpriseLibrary.Data;
using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.AccessControl;

namespace Data
{
    public class RolesDAC : DataAccessComponent, IRepository<Roles>
    {
        private Roles LoadRoles(IDataReader dr)
        {
            Roles roles = new Roles();
            roles.Id = GetDataValue<int>(dr, "Id");
            roles.name = GetDataValue<string>(dr, "name");
            roles.tipo = GetDataValue<string>(dr, "tipo");
            return roles;
        }

     

        public Roles Create(Roles entity)
        {
            const string SQL_STATEMENT = "insert into AspNetRoles(name,tipo,activo)values(@name,@tipo,1)";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@name", DbType.String, entity.name);
                     db.AddInParameter(cmd, "@tipo", DbType.String, entity.tipo);
         
                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


            return entity;
        }

        public void Delete(int id)
        {
            const string SQL_STATEMENT = "update AspNetRoles set Activo=0 where id=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }
        public void Delete(string id)
        {
            const string SQL_STATEMENT = "update AspNetRoles set Activo=0 where id=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.String, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        public List<Roles> Read()
        {
            const string SQL_STATEMENT = "select * from AspNetRoles where activo=1";

            List<Roles> result = new List<Roles>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Roles roles = LoadRoles(dr);
                        result.Add(roles);
                    }
                }
            }
            return result;
        }

        public Roles ReadBy(int id)
        {
            const string SQL_STATEMENT = "select * from AspNetRoles where activo=1 and id=@Id";
            Roles    roles = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        roles = LoadRoles(dr);
                    }
                }
            }
            return roles;
        }


        public Roles ReadBy(string id)
        {
            const string SQL_STATEMENT = "select * from AspNetRoles where activo=1 and name=@Id";
            Roles roles = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.String, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        roles = LoadRoles(dr);
                    }
                }
            }
            return roles;
        }
        public Roles ReadByNombreRol(string nombreRol)
        {
            const string SQL_STATEMENT = "select * from AspNetRoles where activo=1 and name=@Id";
            Roles roles = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.String, nombreRol);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        roles = LoadRoles(dr);
                    }
                }
            }
            return roles;
        }

        public void Update(Roles entity)
        {
            const string SQL_STATEMENT = "update AspNetRoles set name=@name where id=@Id ";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int16, entity.Id);
                db.AddInParameter(cmd, "@name", DbType.String, entity.name);
              
                db.ExecuteNonQuery(cmd);
            }
        }
    }
}
