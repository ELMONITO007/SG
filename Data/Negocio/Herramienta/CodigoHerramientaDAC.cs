using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace Data
{
  public  class CodigoHerramientaDAC :DataAccessComponent
    {
        private CodigoHerramienta LoadGerencia(IDataReader dr)
        {
            CodigoHerramienta codigoHerramienta = new CodigoHerramienta();

            codigoHerramienta.numero = GetDataValue<string>(dr, "numero");
            codigoHerramienta.codigo = GetDataValue<string>(dr, "codigo");
            return codigoHerramienta;
        }
        private CodigoHerramienta LoadCodigo(IDataReader dr)
        {
            TipoHerramienta tipo = new TipoHerramienta();
            tipo.Id = GetDataValue<int>(dr, "id_tipoHerramienta");
            CodigoHerramienta codigoHerramienta = new CodigoHerramienta(tipo);

            codigoHerramienta.Id = GetDataValue<int>(dr, "id_codigo");
            codigoHerramienta.codigo = GetDataValue<string>(dr, "codigo");
            return codigoHerramienta;
        }

        public CodigoHerramienta ObtenerUltimoCodigo(int id_TipoHerramienta)

        {
            const string SQL_STATEMENT = "select top 1  codigo,numero  from Herramienta where id_TipoHerrramienta=@Id order by numero desc";
            CodigoHerramienta codigoHerramienta = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id_TipoHerramienta);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        codigoHerramienta = LoadGerencia(dr);
                    }
                }
            }
            return codigoHerramienta;


        }
        public CodigoHerramienta ObtenerTipoHerramientaConCodigo(string CodigoLetra)

        {
            const string SQL_STATEMENT = "select * from codigo where codigo=@Id";
            CodigoHerramienta codigoHerramienta = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SQL_STATEMENT))
            {
                db.AddInParameter(cmd, "@Id", DbType.String, CodigoLetra);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        codigoHerramienta = LoadCodigo(dr);
                    }
                }
            }
            return codigoHerramienta;


        }
    }
}
