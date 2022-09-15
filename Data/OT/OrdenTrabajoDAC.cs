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
   public class OrdenTrabajoDAC : DataAccessComponent
    {
        private OrdenTrabajo ALoad(IDataReader dr)
        {
            Usuarios usuarios = new Usuarios();
            usuarios.Id = GetDataValue<int>(dr, "Id");
            Laboratorio laboratorio = new Laboratorio();
            laboratorio.Id= GetDataValue<int>(dr, "ID_Labotatorio");
            OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios,laboratorio);
            ordenTrabajo.Id = GetDataValue<int>(dr, "ID_OrdenTrabajo");
            ordenTrabajo.Estado.Id = GetDataValue<int>(dr, "id_Estado");
            ordenTrabajo.Fecha = GetDataValue<string>(dr, "Fecha");
           ordenTrabajo.GuiaRecepcion = GetDataValue<string>(dr, "GuiaRecepcion");
            ordenTrabajo.TransporteRecepcion = GetDataValue<string>(dr, "TransporteRecepcion");
            ordenTrabajo.Observaciones= GetDataValue<string>(dr, "Observaciones");
         
            ordenTrabajo.cantidadEquipos = GetDataValue<int>(dr, "cantidadEquipos");
         ordenTrabajo.asignado.Id = GetDataValue<int>(dr, "asignado");
            ordenTrabajo.guia = GetDataValue<string>(dr, "guia");
            ordenTrabajo.transporte = GetDataValue<string>(dr, "transporte");

            return ordenTrabajo;
        }

        public OrdenTrabajo Create(OrdenTrabajo entity)
        {
            const string SQL_STATEMENT = "insert into OrdenTrabajo(asignado,Id,ID_Labotatorio,Fecha,cantidadEquipos,activo,GuiaRecepcion,TransporteRecepcion,guia,transporte,observaciones)values (@asignado,@Id,@ID_Labotatorio,@Fecha,@cantidadEquipos,1,@GuiaRecepcion,@TransporteRecepcion,@guia,@transporte,@observaciones) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            { 
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Usuario.Id);
     
                db.AddInParameter(cmd, "@ID_Labotatorio", DbType.Int32, entity.Laboratorio.Id);
                db.AddInParameter(cmd, "@asignado", DbType.Int32, entity.asignado.Id);

                db.AddInParameter(cmd, "@Fecha", DbType.String, entity.Fecha);
                db.AddInParameter(cmd, "@cantidadEquipos", DbType.Int32, entity.cantidadEquipos);
                db.AddInParameter(cmd, "@GuiaRecepcion", DbType.String, entity.GuiaRecepcion);
                db.AddInParameter(cmd, "@TransporteRecepcion", DbType.String, entity.TransporteRecepcion);
                db.AddInParameter(cmd, "@guia", DbType.String, entity.guia);
                db.AddInParameter(cmd, "@transporte", DbType.String, entity.transporte);
                db.AddInParameter(cmd, "@observaciones", DbType.String, entity.Observaciones);
                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


            return entity;
        }

        public void Delete(int id)
        {
            const string SQL_STATEMENT = "update OrdenTrabajo set Activo=0 where ID_OrdenTrabajo=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }



        public List<OrdenTrabajo> ReadbyLaboratorio(int id_Laboratorio)
        {
            const string SQL_STATEMENT = "select * from OrdenTrabajo where ID_Labotatorio= @id_Laboratorio and Activo=1";

            List<OrdenTrabajo> result = new List<OrdenTrabajo>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_Laboratorio", DbType.Int32, id_Laboratorio);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        OrdenTrabajo sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public List<OrdenTrabajo> Readby(int id)
        {
            const string SQL_STATEMENT = "select * from OrdenTrabajo where ID_OrdenTrabajo= @ID_OrdenTrabajo and Activo=1";

            List<OrdenTrabajo> result = new List<OrdenTrabajo>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@ID_OrdenTrabajo", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        OrdenTrabajo sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }

        public OrdenTrabajo ObtenerUlrimaOrden(OrdenTrabajo entity)
        {
            const string SQL_STATEMENT = "select * from OrdenTrabajo where ID_Labotatorio= @ID_Labotatorio and Id=@Id  and Fecha=@Fecha and cantidadEquipos=@cantidadEquipos and    Activo=1";

            OrdenTrabajo result =null;
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Usuario.Id);
                db.AddInParameter(cmd, "@ID_Labotatorio", DbType.Int32, entity.Laboratorio.Id);
            
                db.AddInParameter(cmd, "@Fecha", DbType.String, entity.Fecha);
                db.AddInParameter(cmd, "@cantidadEquipos", DbType.Int32, entity.cantidadEquipos);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                         result = ALoad(dr);
                       
                    }
                }
            }
            return result;
        }
        public List<OrdenTrabajo> ReadbySectorTerminados(int id)
        {
            const string SQL_STATEMENT = "select * from OrdenTrabajo where id_sector= @id and Activo=1";

            List<OrdenTrabajo> result = new List<OrdenTrabajo>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        OrdenTrabajo sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public List<OrdenTrabajo> ReadbySector(int id)
        {
            const string SQL_STATEMENT = "select * from OrdenTrabajo where  Activo=1 ";

            List<OrdenTrabajo> result = new List<OrdenTrabajo>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        OrdenTrabajo sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public List<OrdenTrabajo> ReadbyUsuarioYEstadoActivo(int id)
        {
            const string SQL_STATEMENT = "select * from OrdenTrabajo where id= @id and Activo=1";

            List<OrdenTrabajo> result = new List<OrdenTrabajo>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        OrdenTrabajo sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public List<OrdenTrabajo> ReadbyEstado(string estado)
        {
            const string SQL_STATEMENT = "select * from OrdenTrabajo where id_estado= @estado and Activo=1";

            List<OrdenTrabajo> result = new List<OrdenTrabajo>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@estado", DbType.Int32,int.Parse( estado));
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        OrdenTrabajo sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }


      


        public void Update(OrdenTrabajo entity)
        {
            const string SQL_STATEMENT = "update OrdenTrabajo set Estado=@Estado,id_labotatorio=@id_laboratorio where ID_OrdenTrabajo=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@Estado", DbType.String, entity.Estado);
                db.AddInParameter(cmd, "@id_laboratorio", DbType.Int32, entity.Laboratorio.Id);
                db.ExecuteNonQuery(cmd);

            }
        }
        public void UpdateEstado(OrdenTrabajo entity)
        {
            const string SQL_STATEMENT = "update OrdenTrabajo set id_estado=@Estado where ID_OrdenTrabajo=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@Estado", DbType.Int32, entity.Estado.Id);
      
                db.ExecuteNonQuery(cmd);

            }
        }
        public void UpdateGuia(OrdenTrabajo entity)
        {
            const string SQL_STATEMENT = "update OrdenTrabajo set guia=@guia , transporte=@transporte where ID_OrdenTrabajo=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@guia", DbType.String, entity.guia);
                db.AddInParameter(cmd, "@transporte", DbType.String, entity.transporte);

                db.ExecuteNonQuery(cmd);

            }
        }
        public void UpdateGuiaRecepcion(OrdenTrabajo entity)
        {
            const string SQL_STATEMENT = "update OrdenTrabajo set guiaRecepcion=@guia , transporteRecepcion=@transporte where ID_OrdenTrabajo=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@guia", DbType.String, entity.GuiaRecepcion);
                db.AddInParameter(cmd, "@transporte", DbType.String, entity.TransporteRecepcion);

                db.ExecuteNonQuery(cmd);

            }
        }
        public void UpdateTurno(OrdenTrabajo entity)
        {
            const string SQL_STATEMENT = "update OrdenTrabajo set id_turno=@id_turno  where ID_OrdenTrabajo=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@id_turno", DbType.Int32, entity.Turno.Id);
               

                db.ExecuteNonQuery(cmd);

            }
        }
        public void UpdateLaboratrio(OrdenTrabajo entity)
        {
            const string SQL_STATEMENT = "update OrdenTrabajo set id_laboratorio=@id_laboratorio  where ID_OrdenTrabajo=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@id_laboratorio", DbType.Int32, entity.Laboratorio.Id);


                db.ExecuteNonQuery(cmd);

            }
        }

        public void UpdateAsignado(OrdenTrabajo entity)
        {
            const string SQL_STATEMENT = "update OrdenTrabajo set asignado=@asignado  where ID_OrdenTrabajo=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);
                db.AddInParameter(cmd, "@asignado", DbType.Int32, entity.Usuario.Id);


                db.ExecuteNonQuery(cmd);

            }
        }
    }




}
