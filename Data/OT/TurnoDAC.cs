using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;

namespace Data
{
    public class TurnoDAC : DataAccessComponent
    {
        public Turno ALoad(IDataReader dr)
        {
            OrdenTrabajo orden = new OrdenTrabajo();
            orden.Id= GetDataValue<int>(dr, "ID_OrdenTrabajo");
            Turno turno = new Turno(orden);
            turno.Id = GetDataValue<int>(dr, "Id_turno");
            turno.FechaComienzoDeEnsayo= GetDataValue<string>(dr, "FechaComienzoDeEnsayo");
            turno.FechaFinDeEnsayo = GetDataValue<string>(dr, "FechaFinDeEnsayo");
            turno.FechaRecepcionMateriales = GetDataValue<string>(dr, "FechaRecepcionMateriales");
     

            return turno;

        }

        public Turno Create(Turno entity)
        {
            const string SQL_STATEMENT = "insert into Turno(FechaRecepcionMateriales,FechaComienzoDeEnsayo,FechaFinDeEnsayo,ID_OrdenTrabajo)values (@FechaRecepcionMateriales,@FechaComienzoDeEnsayo,@FechaFinDeEnsayo,@ID_OrdenTrabajo) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@ID_OrdenTrabajo", DbType.Int32, entity.orden.Id);

                db.AddInParameter(cmd, "@FechaRecepcionMateriales", DbType.String, entity.FechaRecepcionMateriales);
                db.AddInParameter(cmd, "@FechaComienzoDeEnsayo", DbType.String, entity.FechaComienzoDeEnsayo);
                db.AddInParameter(cmd, "@FechaFinDeEnsayo", DbType.String, entity.FechaFinDeEnsayo);
         
                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


            return entity;
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }



        public Turno ReadBy(int id)
        {
            const string SQL_STATEMENT = "select * from Turno where ID_Turno=@Id";
            Turno turno = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        turno = ALoad(dr);
                    }
                }
            }
            return turno;
        }
       
        public Turno ReadByOrden(int id)
        {
            const string SQL_STATEMENT = "select * from Turno  where ID_OrdenTrabajo=@id";
            Turno turno = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        turno = ALoad(dr);
                    }
                }
            }
            return turno;
        }
        public List< Turno> ReadByFechaYLaboratorio(string fechaInicio,string FechaFinal,int id_Laboratorio)
        {
            const string SQL_STATEMENT = "Select * from OrdenTrabajo as ot join Turno as t on t.ID_OrdenTrabajo=ot.ID_OrdenTrabajo where ID_Labotatorio=@Id and FechaRecepcionMateriales>=@fechaInicio and FechaRecepcionMateriales<=@FechaFinal ";

            List<Turno> result = new List<Turno>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@fechaInicio", DbType.String, fechaInicio);
                db.AddInParameter(cmd, "@FechaFinal", DbType.String, FechaFinal);
                db.AddInParameter(cmd, "@Id", DbType.Int32, id_Laboratorio);

                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Turno sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public List<Turno> ReadByFechaComienzoLaboratorioEstado(string fechaInicio, string FechaFinal, int id_Laboratorio,string estado)
        {
            const string SQL_STATEMENT = "Select * from OrdenTrabajo as ot join Turno as t on t.ID_OrdenTrabajo=ot.ID_OrdenTrabajo where ID_Labotatorio=@Id  and FechaComienzoDeEnsayo>=@fechaInicio and FechaComienzoDeEnsayo<=@FechaFinal  and id_estado!=7";

            List<Turno> result = new List<Turno>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@fechaInicio", DbType.String, fechaInicio);
                db.AddInParameter(cmd, "@FechaFinal", DbType.String, FechaFinal);
                db.AddInParameter(cmd, "@Id", DbType.Int32, id_Laboratorio);
            
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Turno sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public List<Turno> ReadByFechaFinalLaboratorioEstado(string fechaInicio, string FechaFinal, int id_Laboratorio, string estado)
        {
            const string SQL_STATEMENT = "Select * from OrdenTrabajo as ot join Turno as t on t.ID_OrdenTrabajo=ot.ID_OrdenTrabajo where ID_Labotatorio=@Id and estado!='Ensayado' and FechaFinDeEnsayo>=@fechaInicio and FechaFinDeEnsayo<=@FechaFinal ";

            List<Turno> result = new List<Turno>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@fechaInicio", DbType.String, fechaInicio);
                db.AddInParameter(cmd, "@FechaFinal", DbType.String, FechaFinal);
                db.AddInParameter(cmd, "@Id", DbType.Int32, id_Laboratorio);
                db.AddInParameter(cmd, "@estado", DbType.String, estado);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Turno sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }

        public void UpdateFechaRecpecion(Turno entity)
        {
            const string SQL_STATEMENT = "update Turno set FechaRecepcionMateriales=@FechaRecepcionMateriales where Id_turno=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@FechaRecepcionMateriales", DbType.String, entity.FechaRecepcionMateriales);


            }
        }
    


        public void UpdateFechaFinYcomienzo(Turno entity)
        {
            const string SQL_STATEMENT = "update Turno set FechaComienzoDeEnsayo=@FechaComienzoDeEnsayo,FechaFinDeEnsayo=@FechaFinDeEnsayo where Id_turno=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@FechaComienzoDeEnsayo", DbType.String, entity.FechaComienzoDeEnsayo);

                db.AddInParameter(cmd, "@FechaFinDeEnsayo", DbType.String, entity.FechaFinDeEnsayo);
                db.ExecuteNonQuery(cmd);

            }
        }



    }
}
