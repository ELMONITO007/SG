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
    public class InstrumentoDAC : DataAccessComponent
    {
        public Instrumento ALoad(IDataReader dr)
        {
            Laboratorio laboratorio = new Laboratorio();
            laboratorio.Id= GetDataValue<int>(dr, "ID_laboratorio");
            Instrumento instrumento = new Instrumento(laboratorio);
            instrumento.tipo = GetDataValue<string>(dr, "tipo");

            instrumento.Id= GetDataValue<int>(dr, "id_instrumento");
            instrumento.codigo = GetDataValue<string>(dr, "codigo");
            instrumento.marca = GetDataValue<string>(dr, "marca");
            instrumento.numeroSerie = GetDataValue<string>(dr, "numeroSerie");
            instrumento.vencimiento = GetDataValue<string>(dr, "vencimiento");
            instrumento.tipoUso = GetDataValue<string>(dr, "tipoUso");

            instrumento.certificado = GetDataValue<string>(dr, "certificado");
            instrumento.tipoEnsayo = GetDataValue<string>(dr, "tipoEnsayo");


            return instrumento;

        }
        public Instrumento ReadbyCodigo(string codigo)
        {
            const string SQL_STATEMENT = "select * from Instrumento where codigo=@codigo  ";

            Instrumento sede = new Instrumento();
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

        public Instrumento Create(Instrumento entity)
        {
            const string SQL_STATEMENT = "insert into Instrumento (id_laboratorio ,codigo,numeroSerie,activo,vencimiento,marca,tipoEnsayo,tipoUso,certificado,tipo) values(@id_laboratorio ,@codigo,@numeroSerie,1,@vencimiento,@marca,@tipoEnsayo,@tipoUso,@certificado,@tipo) ";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_laboratorio", DbType.Int32, entity.laboratorio.Id);
                db.AddInParameter(cmd, "@codigo", DbType.String, entity.codigo);
                db.AddInParameter(cmd, "@numeroSerie", DbType.String, entity.numeroSerie);
                db.AddInParameter(cmd, "@vencimiento", DbType.String, entity.vencimiento);
                db.AddInParameter(cmd, "@marca", DbType.String, entity.marca);
                db.AddInParameter(cmd, "@tipoEnsayo", DbType.String, entity.tipoEnsayo);
                db.AddInParameter(cmd, "@tipoUso", DbType.String, entity.tipoUso);
                db.AddInParameter(cmd, "@certificado", DbType.String, entity.certificado);
                db.AddInParameter(cmd, "@tipo", DbType.String, entity.tipo);

                entity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }


            return ReadbyCodigo(entity.codigo);
        }

        public void Delete(int id)
        {
            const string SQL_STATEMENT = "update Instrumento set activo=0 where ID_Instrumento=@Id";
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        public List<Instrumento> Read()
        {
            const string SQL_STATEMENT = "select * from Instrumento where activo=1";

            List<Instrumento> result = new List<Instrumento>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Instrumento sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public List<Instrumento> ReadbyLaboratorio(int id_Laboratorio)
        {
            const string SQL_STATEMENT = "select * from Instrumento where id_laboratorio=@id_laboratorio and activo=1";

            List<Instrumento> result = new List<Instrumento>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_Laboratorio", DbType.Int32, id_Laboratorio);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Instrumento sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public List<Instrumento> ReadbyTipo(string tipo)
        {
            const string SQL_STATEMENT = "select * from Instrumento where tipo=@tipo and activo=1 order by codigo";

            List<Instrumento> result = new List<Instrumento>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@tipo", DbType.String, tipo);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Instrumento sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
      
        public List<Instrumento> ReadbyLaboratorioTipoHerramienta(int id_Laboratorio,int id_tipoHerramienta)
        {
            const string SQL_STATEMENT = "select * from InstrumentoTipo as it join Instrumento as i on i.ID_Instrumento=it.ID_Instrumento where ID_Laboratorio=@id_Laboratorio and Id_TipoHerramienta=@id_tipoHerramienta and activo=1";

            List<Instrumento> result = new List<Instrumento>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@id_Laboratorio", DbType.Int32, id_Laboratorio);
                db.AddInParameter(cmd, "@id_tipoHerramienta", DbType.Int32, id_tipoHerramienta);

                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Instrumento sede = ALoad(dr);
                        result.Add(sede);
                    }
                }
            }
            return result;
        }
        public Instrumento ReadBy(int id)
        {
            const string SQL_STATEMENT = "select * from Instrumento where Activo=1 and ID_Instrumento=@Id";
            Instrumento gerencia = null;

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


        public void UpdateFechaVencimiento(string vencimiento, int id)
        {
            const string SQL_STATEMENT = "update instrumento set vencimiento=@vencimiento where id_instrumento=@Id";

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@vencimiento", DbType.String, vencimiento);

                db.AddInParameter(cmd, "@Id", DbType.Int32, id);

                db.ExecuteNonQuery(cmd);


            }
        }
    }
}
