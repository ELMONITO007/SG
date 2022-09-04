using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;

namespace Data
{
    public class OrdenTrabajoEstadoDAC : DataAccessComponent
    {
        public OrdenTrabajoEstado ALoad(IDataReader dr)
        {
            Usuarios usuario = new Usuarios();
            OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
            EstadoOrdenEnsayo estadoOrdenEnsayo = new EstadoOrdenEnsayo();
            usuario.Id = GetDataValue<int>(dr, "Id");
            ordenTrabajo.Id = GetDataValue<int>(dr, "ID_OrdenTrabajo");
            estadoOrdenEnsayo.Id = GetDataValue<int>(dr, "ID_estadoOrdenEnsayo");

            OrdenTrabajoEstado orden = new OrdenTrabajoEstado(usuario, ordenTrabajo, estadoOrdenEnsayo);
            orden.fecha = GetDataValue<string>(dr, "fecha");
            orden.observaciones = GetDataValue<string>(dr, "observaciones");
            orden.Id= GetDataValue<int>(dr, "Id_estado");
            return orden;

        }

        public OrdenTrabajoEstado Create(OrdenTrabajoEstado entity)
        {
            const string SQL_STATEMENT = "insert into OrdenTrabajo_Estado(ID_OrdenTrabajo,ID_estadoOrdenEnsayo,fecha,Id,Observaciones)values (@ID_OrdenTrabajo,@ID_estadoOrdenEnsayo,@fecha,@Id,@observaciones) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@ID_OrdenTrabajo", DbType.Int32, entity.ordenTrabajo.Id);

                db.AddInParameter(cmd, "@ID_estadoOrdenEnsayo", DbType.String, entity.EstadoOrdenEnsayo.Id);
                db.AddInParameter(cmd, "@fecha", DbType.String, entity.fecha);
                db.AddInParameter(cmd, "@Id", DbType.String, entity.Usuarios.Id);
                db.AddInParameter(cmd, "@observaciones", DbType.String, entity.observaciones);
                db.ExecuteNonQuery(cmd);
            }


            return entity;
        }



        public OrdenTrabajoEstado ReadBy(OrdenTrabajoEstado entity)
        {
            const string SQL_STATEMENT = "select * from OrdenTrabajo_Estado where ID_OrdenTrabajo=@Id and estado=@Estado";
            OrdenTrabajoEstado ordenTrabajoEstado = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@ID_OrdenTrabajo", DbType.Int32, entity.ordenTrabajo.Id);

                db.AddInParameter(cmd, "@estado", DbType.String, entity.estado);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        ordenTrabajoEstado = ALoad(dr);
                    }
                }
            }
            return ordenTrabajoEstado;
        }

        public OrdenTrabajoEstado EstadoActual(int id_Orden)
        {
            const string SQL_STATEMENT = "select top 1  * from OrdenTrabajo_Estado where ID_OrdenTrabajo=@ID_OrdenTrabajo order by Id_estado desc";
            OrdenTrabajoEstado ordenTrabajoEstado = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@ID_OrdenTrabajo", DbType.Int32, id_Orden);

        
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        ordenTrabajoEstado = ALoad(dr);
                    }
                }
            }
            return ordenTrabajoEstado;
        }
        public List<OrdenTrabajoEstado> ReadByOrden(int Orden)
        {
            const string SQL_STATEMENT = "select * from OrdenTrabajo_Estado where ID_OrdenTrabajo=@Id  order by id_estado";

            List<OrdenTrabajoEstado> result = new List<OrdenTrabajoEstado>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {

                db.AddInParameter(cmd, "@Id", DbType.Int32, Orden);

                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        OrdenTrabajoEstado sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
    }
}
