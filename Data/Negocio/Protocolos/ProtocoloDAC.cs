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
    public class ProtocoloDAC : DataAccessComponent, IRepository2<Protocolo>
    {
        public Protocolo ALoad(IDataReader dr)
        {

            Herramienta herramienta = new Herramienta();
            herramienta.Id = GetDataValue<int>(dr, "Id_herramienta");
            Laboratorio laboratorio = new Laboratorio();
            laboratorio.Id = GetDataValue<int>(dr, "Id_Laboratorio");
            Protocolo protocolo = new Protocolo(herramienta, laboratorio);
            protocolo.codigo = GetDataValue<string>(dr, "codigo");
            protocolo.conclusion = GetDataValue<string>(dr, "conclusion");

            protocolo.fechaEnsayo = GetDataValue<string>(dr, "fechaEnsayo");
            protocolo.usuario.Id = GetDataValue<int>(dr, "id_usuario");
            protocolo.hmedadad = GetDataValue<int>(dr, "humedad");

            protocolo.Id = GetDataValue<int>(dr, "id_protocolo");
            protocolo.observaciones = GetDataValue<string>(dr, "observaciones");

            protocolo.temperatura = GetDataValue<int>(dr, "temperatura");


            return protocolo;
        }

        public Protocolo Create(Protocolo entity)
        {
            const string SQL_STATEMENT = "insert into protocolo (Id_Laboratorio,codigo,conclusion,fechaEnsayo,humedad,observaciones,temperatura,activo,id_herramienta,Id_Usuario) values(@Id_Laboratiorio,@codigo,@conclusion,@fechaEnsayo,@humedad,@observaciones,@temperatura,1,@id_herramienta,@id_usuario) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {

                db.AddInParameter(cmd, "@Id_Usuario", DbType.Int32, entity.usuario.Id);

                db.AddInParameter(cmd, "@Id_Laboratiorio", DbType.Int32, entity.laboratorio.Id);
                db.AddInParameter(cmd, "@codigo", DbType.String, entity.codigo);
                db.AddInParameter(cmd, "@conclusion", DbType.String, entity.conclusion);

                db.AddInParameter(cmd, "@fechaEnsayo", DbType.String, entity.fechaEnsayo);
                db.AddInParameter(cmd, "@humedad", DbType.Int32, entity.hmedadad);
                db.AddInParameter(cmd, "@observaciones", DbType.String, entity.observaciones);
                db.AddInParameter(cmd, "@temperatura", DbType.Int32, entity.temperatura);
                db.AddInParameter(cmd, "@id_herramienta", DbType.Int32, entity.herramienta.Id);



                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


            return ReadByCodigo(entity.codigo);
        }

        public void Delete(int id)
        {

            const string SQL_STATEMENT = "update Protocolo set activo=0 where id_protocolo=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        //modificar
        public List<Protocolo> ReadByHerramienta(int id_herramienta)
        {
            const string SQL_STATEMENT = "select * from Protocolo where id_Herramienta=@id_Herramienta and activo=1";

            List<Protocolo> result = new List<Protocolo>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_Herramienta", DbType.Int32, id_herramienta);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Protocolo sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public Protocolo ReadByCodigo(string codigo)
        {
            const string SQL_STATEMENT = "select * from Protocolo where codigo=@codigo and activo=1";

            Protocolo result = new Protocolo();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@codigo", DbType.String, codigo);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        result = ALoad(dr);

                    }
                }
            }
            return result;
        }
        public List<Protocolo> Read()
        {
            const string SQL_STATEMENT = "select * from Protocolo where  activo=1";

            List<Protocolo> result = new List<Protocolo>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {

                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Protocolo sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }


        #region ProtocoloOE

        public List<Protocolo> ReadByOrden(int orden)
        {
            const string SQL_STATEMENT = "select * from ProtocoloOE as poe join Protocolo as p on p.id_protocolo=poe.id_protocolo where poe.id_ordenTrabajo=@id_Protocolo";

            List<Protocolo> result = new List<Protocolo>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_Protocolo", DbType.Int32, orden);

                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Protocolo sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public void AgregarProtocolo(int id_Protocolo, int Id_ordenTrabajo)
        {
            const string SQL_STATEMENT = "insert into ProtocoloOE(Id_ordenTrabajo,id_Protocolo)values(@id_ordenTrabajo,@id_Protocolo)";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {

                db.AddInParameter(cmd, "@id_Protocolo", DbType.Int32, id_Protocolo);

                db.AddInParameter(cmd, "@Id_ordenTrabajo", DbType.Int32, Id_ordenTrabajo);

                db.ExecuteNonQuery(cmd);
            }


         
        }
        #endregion
       
        public Protocolo ReadBy(int id)
        {
            const string SQL_STATEMENT = "select * from Protocolo where activo=1 and id_protocolo=@Id";
            Protocolo gerencia = null;

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


        //Modificar
        public Protocolo UltimoProtocolo(int id_herramienta)
        {
            const string SQL_STATEMENT = "select top 1 * from Protocolo where id_Herramienta=@Id  order by fechaEnsayo desc  ";
            Protocolo gerencia = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id_herramienta);
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


        //Modificar
        public Protocolo ReadBy(string fecha, int id_Herramienta)
        {
            const string SQL_STATEMENT = "select * from Protocolo where activo=1 and id_Herramienta=@Id and fecha=@fecha";
            Protocolo gerencia = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id_Herramienta);
                db.AddInParameter(cmd, "@fecha", DbType.String, fecha);

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
        public Protocolo ReadBy(string campo)
        {
            throw new NotImplementedException();
        }

        public void Update(Protocolo entity)
        {
            const string SQL_STATEMENT = "update Protocolo set Id_Laboratiorio=@Id_Laboratiorio,conclusion=@conclusion ,email=@email,fechaEnsayo=@fechaEnsayo,observaciones=@observaciones where Id_Protocolo=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);





                db.AddInParameter(cmd, "@Id_Laboratiorio", DbType.Int32, entity.laboratorio.Id);

                db.AddInParameter(cmd, "@conclusion", DbType.String, entity.conclusion);
                db.AddInParameter(cmd, "@email", DbType.String, entity.email);
                db.AddInParameter(cmd, "@fechaEnsayo", DbType.String, entity.fechaEnsayo);

                db.AddInParameter(cmd, "@observaciones", DbType.String, entity.observaciones);


                db.ExecuteNonQuery(cmd);

            }
        }

        public Protocolo ReadBy(Protocolo identity)
        {
            throw new NotImplementedException();
        }

        public void Delete(Protocolo identity)
        {
            throw new NotImplementedException();
        }
    }
}
