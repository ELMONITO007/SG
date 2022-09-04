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
    public class HerramientaDAC : DataAccessComponent, IRepository2<Herramienta>
    {
        public Herramienta ALoad(IDataReader dr)
        {
           
            CodigoHerramienta codigoHerramienta = new CodigoHerramienta();
            codigoHerramienta.numero = GetDataValue<string>(dr, "numero");
            codigoHerramienta.codigo = GetDataValue<string>(dr, "codigo");
            Usuarios usuarios = new Usuarios();
           usuarios.Id= GetDataValue<int>(dr, "ID_usuario");
            TipoHerramienta tipoHerramienta = new TipoHerramienta();
            tipoHerramienta.Id = GetDataValue<int>(dr, "id_TipoHerrramienta");
            Herramienta herramienta = new Herramienta(usuarios,  tipoHerramienta,codigoHerramienta);
            herramienta.Id = GetDataValue<int>(dr, "ID_herramienta");
           
            herramienta.marca = GetDataValue<string>(dr, "marca");
            herramienta.modelo = GetDataValue<string>(dr, "modelo");

            herramienta.Estado = GetDataValue<string>(dr, "Estado");
            herramienta.numeroSerie = GetDataValue<string>(dr, "numeroSerie");
            herramienta.tiempoMantenimiento = GetDataValue<int>(dr, "tiempoMantenimiento");
            herramienta.vencida = GetDataValue<bool>(dr, "vencida");
            herramienta.proximaActualizacion = GetDataValue<string>(dr, "proximaActualizacion");
            herramienta.codigoViejo= GetDataValue<string>(dr, "codigoViejo");
            herramienta.usuarios.Id= GetDataValue<int>(dr, "ID_usuario");


            return herramienta;

        }

        public Herramienta ReadbyCodigo(string codigo, string numero)
        {
            const string SQL_STATEMENT = "select * from Herramienta where codigo=@codigo and numero=@numero ";

            Herramienta sede = new Herramienta();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@codigo", DbType.String, codigo);
                db.AddInParameter(cmd, "@numero", DbType.String, numero);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                         sede = ALoad(dr);
                       
                    }
                }
            }
            return sede;
        }
        public Herramienta ReadbyCodigoViejo(string codigo)
        {
            const string SQL_STATEMENT = "select * from Herramienta where codigoviejo=@codigo ";

            Herramienta sede =null;
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@codigo", DbType.String, codigo);
           
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        sede = ALoad(dr);

                    }
                }
            }
            return sede;
        }
        public Herramienta Create(Herramienta entity)
        {
            const string SQL_STATEMENT = "insert into Herramienta (id_TipoHerrramienta,codigo,modelo,Estado,numeroSerie,tiempoMantenimiento,vencida,numero,proximaActualizacion,marca,codigoViejo) values(@id_tipoHerramienta,@codigo,@modelo,@Estado,@numeroSerie,@tiempoMantenimiento,@vencida,@numero,@proximaActualizacion,@marca,@codigoViejo) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
            
                db.AddInParameter(cmd, "@marca", DbType.String, entity.marca);
                db.AddInParameter(cmd, "@id_tipoHerramienta", DbType.Int32, entity.tipoHerramienta.Id);
                db.AddInParameter(cmd, "@codigo", DbType.String, entity.codigoHerramienta.codigo);
                db.AddInParameter(cmd, "@numero", DbType.String, entity.codigoHerramienta.numero);
                db.AddInParameter(cmd, "@modelo", DbType.String, entity.modelo);
                db.AddInParameter(cmd, "@Estado", DbType.String, entity.Estado);
                db.AddInParameter(cmd, "@numeroSerie", DbType.String, entity.numeroSerie);
                db.AddInParameter(cmd, "@tiempoMantenimiento", DbType.Int32, entity.tiempoMantenimiento);
                db.AddInParameter(cmd, "@vencida", DbType.Boolean, entity.vencida);
                db.AddInParameter(cmd, "@codigoViejo", DbType.String, entity.codigoViejo);

                db.AddInParameter(cmd, "@proximaActualizacion", DbType.String, entity.proximaActualizacion);

                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


            return entity;
        }

        public void Delete(int id)
        {

            const string SQL_STATEMENT = "update Herramienta set Estado='Baja' where ID_Herramienta=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        public List<Herramienta> Read()
        {
            const string SQL_STATEMENT = "select * from Herramienta where Estado='Activo'";

            List<Herramienta> result = new List<Herramienta>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Herramienta sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public List<Herramienta> ReadbyUsuario(int id_Usuario)
        {
            const string SQL_STATEMENT = "select * from Herramienta where id_Usuario=@id_Usuario and Estado='Activo'";

            List<Herramienta> result = new List<Herramienta>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_Usuario", DbType.Int32, id_Usuario);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Herramienta sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public List<Herramienta> ReadbyTipo(int id_TipoHerramienta)
        {
            const string SQL_STATEMENT = "select * from Herramienta where id_TipoHerrramienta=@id_TipoHerramienta and Estado='Activo'";

            List<Herramienta> result = new List<Herramienta>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_TipoHerramienta", DbType.Int32, id_TipoHerramienta);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Herramienta sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public Herramienta ReadBy(int id)
        {
            const string SQL_STATEMENT = "select * from Herramienta where Estado='Activo' and ID_Herramienta=@Id";
            Herramienta gerencia = null;

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
        public Herramienta ObtenerUltimoCodigo(int id)
        {
            const string SQL_STATEMENT = "select top 1 * from Herramienta  where  id_TipoHerrramienta=@id order by codigo desc";
            Herramienta gerencia = null;

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
        public Herramienta ReadBy(string campo)
        {
            const string SQL_STATEMENT = "select * from Herramienta where Estado='Activo' and numeroserie=@Id";
            Herramienta gerencia = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, campo);
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

        public void Update(Herramienta entity)
        {

            const string SQL_STATEMENT = "update Herramienta set codigo=@codigo,modelo=@modelo ,Estado=@Estado,numeroSerie=@numeroSerie,tiempoMantenimiento=@tiempoMantenimiento where Id_Herramienta=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, entity.Id);

                db.AddInParameter(cmd, "@codigo", DbType.String, entity.codigo);
                db.AddInParameter(cmd, "@modelo", DbType.String, entity.modelo);
                db.AddInParameter(cmd, "@Estado", DbType.String, entity.Estado);
                db.AddInParameter(cmd, "@numeroSerie", DbType.String, entity.numeroSerie);
                db.AddInParameter(cmd, "@tiempoMantenimiento", DbType.Int32, entity.tiempoMantenimiento);

                db.ExecuteNonQuery(cmd);

            }


        }



        public void UpdateVencida(int  id_Herramienta, bool estado)
        {
            const string SQL_STATEMENT = "update Herramienta set vencida=@vencido where id_Herramienta=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id_Herramienta);

                db.AddInParameter(cmd, "@vencido", DbType.Boolean, estado);

                db.ExecuteNonQuery(cmd);


            }
        }

        public void UpdateFechaActualizacion(string proximaActualizacion,int id)
        {
            const string SQL_STATEMENT = "update Herramienta set proximaActualizacion=@proximaActualizacion where id_Herramienta=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@proximaActualizacion", DbType.String, proximaActualizacion);

                db.AddInParameter(cmd, "@Id", DbType.Int32, id);

                db.ExecuteNonQuery(cmd);


            }
        }
        public void UpdateEstado(int id_Herramienta, string estado)
        {
            const string SQL_STATEMENT = "update Herramienta set estado=@estado id_Herramienta=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id_Herramienta);

                db.AddInParameter(cmd, "@vencido", DbType.String, estado);

                db.ExecuteNonQuery(cmd);


            }
        }

        public Herramienta ReadBy(Herramienta identity)
        {
            throw new NotImplementedException();
        }

        public void Delete(Herramienta identity)
        {
            throw new NotImplementedException();
        }

        #region Instrumento

        public List< Herramienta> ObtenerInstrumento(int laboratorio,int herramienta)
        {
            const string SQL_STATEMENT = "select * from Instrumento as i join Herramienta as h on i.ID_TipoInstrumento=h.id_Herramienta where ID_Laboratorio=@laboratorio and ID_Tipoherramienta=@herramienta";
   

            List<Herramienta> result = new List<Herramienta>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@laboratorio", DbType.Int32, laboratorio);
                db.AddInParameter(cmd, "@herramienta", DbType.Int32, herramienta);

                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Herramienta sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }


        #endregion

    }
}
