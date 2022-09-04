using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Negocio.OT
{
    public class CargaInicialHerramientaDAC :DataAccessComponent
    {
        private CargaInicialHerramienta ALoad(IDataReader dr)
        {
            Herramienta herramienta=new Herramienta();
            herramienta.Id = GetDataValue<int>(dr, "Id_herramienta");
            OrdenTrabajo ordenTrabajo=new OrdenTrabajo();
            ordenTrabajo.Id = GetDataValue<int>(dr, "Id_orden");
            CargaInicialHerramienta cargaInicialHerramienta = new CargaInicialHerramienta(ordenTrabajo,herramienta);

            cargaInicialHerramienta.Id = GetDataValue<int>(dr, "id_cargaInicialHerramienta");
            cargaInicialHerramienta.existe = GetDataValue<bool>(dr, "existe");
            cargaInicialHerramienta.codigo= GetDataValue<string>(dr, "codigo");
            return cargaInicialHerramienta;
        }


        public CargaInicialHerramienta Create(CargaInicialHerramienta entity)
        {
            const string SQL_STATEMENT = "insert into temp_OrdenHerramienta(Id_herramienta,Id_orden,existe,codigo)values (@Id_herramienta,@Id_orden,@existe,@codigo) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id_herramienta", DbType.Int32, entity.herramienta.Id);
                db.AddInParameter(cmd, "@Id_orden", DbType.Int32, entity.ordenTrabajo.Id);
                db.AddInParameter(cmd, "@existe", DbType.Boolean, entity.existe);
                db.AddInParameter(cmd, "@codigo", DbType.String, entity.codigo);

                db.ExecuteNonQuery(cmd);
            }


            return entity;
        }
        public CargaInicialHerramienta Readby(int id)
        {
            const string SQL_STATEMENT = "select * from temp_OrdenHerramienta where Id_CargaInicialHerramienta= @Id_orden";

           CargaInicialHerramienta result =null;
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id_orden", DbType.Int32, id);
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
        public List<CargaInicialHerramienta> ReadbyOrden(int id_orden)
        {
            const string SQL_STATEMENT = "select * from temp_OrdenHerramienta where Id_orden= @Id_orden";

            List<CargaInicialHerramienta> result = new List<CargaInicialHerramienta>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id_orden", DbType.Int32, id_orden);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        CargaInicialHerramienta sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public List<CargaInicialHerramienta> ReadbyOrdenYnoExiste(int id_orden)
        {
            const string SQL_STATEMENT = "select * from temp_OrdenHerramienta where Id_orden= @Id_orden and existe=0";

            List<CargaInicialHerramienta> result = new List<CargaInicialHerramienta>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id_orden", DbType.Int32, id_orden);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        CargaInicialHerramienta sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public void Delete(int id)
        {
            const string SQL_STATEMENT = "delete temp_OrdenHerramienta where id_CargaInicialHerramienta=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        public void UpdateExsite(int id)
        {
            const string SQL_STATEMENT = "update  temp_OrdenHerramienta set existe=1 where Id_CargaInicialHerramienta=@Id_CargaInicialHerramienta";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id_CargaInicialHerramienta", DbType.Int32, id);
               

                db.ExecuteNonQuery(cmd);
            }


      
        }

    }
}
