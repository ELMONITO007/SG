using Microsoft.Practices.EnterpriseLibrary.Data;
using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Data
{
    public class UsuarioDac : DataAccessComponent, IRepository<Usuarios>
    {
        private Usuarios LoadUsuarioa(IDataReader dr)
        {
            Usuarios usuarios = new Usuarios();
            usuarios.Id = GetDataValue<int>(dr, "Id");
            usuarios.UserName = GetDataValue<string>(dr, "UserName");
            usuarios.Nombre = GetDataValue<string>(dr, "Nombre");
            usuarios.Apellido = GetDataValue<string>(dr, "Apellido");
            usuarios.Email = GetDataValue<string>(dr, "Email");
            usuarios.Bloqueado = GetDataValue<bool>(dr, "Bloqueado");
            usuarios.CantidadIntentos = GetDataValue<int>(dr, "CantidadIntentos");
            usuarios.Password = GetDataValue<string>(dr, "Password");
            usuarios.Tipo = GetDataValue<string>(dr, "Tipo");
            return usuarios;
        }
        public Usuarios Create(Usuarios entity)
        {
            const string SQL_STATEMENT = "insert into Usuario(UserName,Email,Password,Bloqueado,CantidadIntentos,Activo,Nombre,Apellido,Tipo)values(@UserName,@Email,@Password,0,0,1,@Nombre,@Apellido,@Tipo)";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@UserName", DbType.String, entity.UserName);
                db.AddInParameter(cmd, "@Email", DbType.String, entity.Email);
                db.AddInParameter(cmd, "@Password", DbType.String, entity.Password);
                db.AddInParameter(cmd, "@Nombre", DbType.String, entity.Nombre);
                db.AddInParameter(cmd, "@Apellido", DbType.String, entity.Apellido);

                db.AddInParameter(cmd, "@tipo", DbType.String, entity.Tipo);
                db.ExecuteNonQuery(cmd);
            }
            return ReadByEmail(entity.Email);
        }

        public void Bloquear(int id)
        {
            const string SQL_STATEMENT = "update Usuario set Bloqueado=1 where id=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.String, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        public void Desbloquear(int id)
        {
            const string SQL_STATEMENT = "update Usuario set Bloqueado=0 where id=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.String, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        public void Delete(int id)
        {
            const string SQL_STATEMENT = "update Usuario set Activo=0 where id=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }
        public void DeleteTotal(int id)
        {
            const string SQL_STATEMENT = "delete Usuario  where id=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }
        public List<Usuarios> Read()
        {
            const string SQL_STATEMENT = "select * from Usuario where activo=1";

            List<Usuarios> result = new List<Usuarios>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Usuarios usuarios = LoadUsuarioa(dr);
                        result.Add(usuarios);
                    }
                }
            }
            return result;
        }

        public Usuarios ReadBy(int id)
        {
            const string SQL_STATEMENT = "select * from Usuario where activo=1 and id=@Id";
            Usuarios usuarios = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        usuarios = LoadUsuarioa(dr);
                    }
                }
            }
            return usuarios;
        }

        public Usuarios ReadByEmail(string emailUsername)
        {
            const string SQL_STATEMENT = "select * from Usuario where activo=1 and UserName=@Id";
            Usuarios usuarios = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.String, emailUsername);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        usuarios = LoadUsuarioa(dr);
                    }
                }
            }
            return usuarios;
        }
        public Usuarios update(Usuarios entity)
        {
            const string SQL_STATEMENT = "update usuario set UserName=@userName, Email=@email,Nombre=@nombre,Apellido=@apellido where id=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@UserName", DbType.String, entity.UserName);
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@apellido", DbType.String, entity.Apellido);
                db.AddInParameter(cmd, "@nombre", DbType.String, entity.Nombre);
                db.AddInParameter(cmd, "@email", DbType.String, entity.Email);
                db.ExecuteNonQuery(cmd);
            }
            return entity;
        }
        public void Update(Usuarios entity)
        {
            const string SQL_STATEMENT = "update Usuario set password=@password  where id=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {

                db.AddInParameter(cmd, "@id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@password", DbType.String, entity.Password);

                db.ExecuteNonQuery(cmd);
            }
        }


        public void AgregarErrorUsryPass(int intentos, int id)

        {

            const string SQL_STATEMENT = "update Usuario set cantidadIntentos=@intentos where id=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@intentos", DbType.Int32, intentos);
                db.AddInParameter(cmd, "@id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        #region LaboratorioUsuario
        public List<Usuarios> ReadByTipoRol(string Id_roles)
        {
            const string SQL_STATEMENT = "select u.Id,u.UserName,u.DVH from AspNetUserRoles as ur inner join AspNetRoles as r on ur.RoleId=r.Id inner join Usuario as u on u.Id=ur.UserId where r.activo=1 and u.activo=1 and r.tipo=@RoleId";
            List<Usuarios> result = new List<Usuarios>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@RoleId", DbType.String, Id_roles);

                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Usuarios usuarioRoles = LoadUsuarioa(dr);
                        result.Add(usuarioRoles);
                    }
                }
            }
            return result;
        }
        public List<Usuarios> ReadbyUsuariosDeUnLaboratorio(int id)
        {
            const string SQL_STATEMENT = "select * from LaboratorioUsuario as lu join Laboratorio as l on l.id_Laboratorio=lu.id_Laboratorio join Usuario as u on u.Id=lu.id where l.id_Laboratorio=@Id";

            List<Usuarios> result = new List<Usuarios>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Usuarios categoria = LoadUsuarioa(dr);
                        result.Add(categoria);
                    }
                }
            }
            return result;
        }
        #endregion

    }
}
