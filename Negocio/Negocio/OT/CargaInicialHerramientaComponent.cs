using Data.Negocio.OT;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.Negocio;
using Negocio;
using Bussiness;

namespace Business
{
    public class CargaInicialHerramientaComponent
    {
        public void Create(int orden)

        {


            CargaInicialHerramientaDAC cargaInicialHerramientaDAC = new CargaInicialHerramientaDAC();


            CargaInicialHerramienta cargaInicialHerramientas = new CargaInicialHerramienta();
            ExcelComponent excel = new ExcelComponent();

            cargaInicialHerramientas = excel.readExcel(orden);

            foreach (var item in cargaInicialHerramientas.cargaInicialHerramientas)
            {
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
                ordenTrabajo.Id = orden;

                HerramientaComponent herramientaComponent = new HerramientaComponent();
                Herramienta herramienta = new Herramienta();

                herramienta = herramientaComponent.ReadbyCodigoViejo(item.herramienta.codigoViejo);




                if (herramienta == null)
                {
                    herramienta = new Herramienta();
                    herramienta.Id = 0;
                    CargaInicialHerramienta cargaInicial = new CargaInicialHerramienta(ordenTrabajo, herramienta);
                    cargaInicial.existe = false;
                    if (item.herramienta.codigoViejo.ToLower() == "no")
                    {

                        cargaInicial.codigo = "Nuevo";

                    }
                    else
                    {

                        cargaInicial.codigo = item.herramienta.codigoViejo;
                    }
                    cargaInicialHerramientaDAC.Create(cargaInicial);
                }
                else
                {
                    CargaInicialHerramienta cargaInicial = new CargaInicialHerramienta(ordenTrabajo, herramienta);
                    cargaInicial.existe = true;
                    cargaInicial.codigo = item.herramienta.codigoViejo;
                    cargaInicialHerramientaDAC.Create(cargaInicial);
                }


            }


        }

        public List<CargaInicialHerramienta> ReadbyOrden(int id_orden)

        {
            CargaInicialHerramientaDAC cargaInicialHerramientaDAC = new CargaInicialHerramientaDAC();
            List<CargaInicialHerramienta> result = new List<CargaInicialHerramienta>();
            OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
            ordenTrabajo.Id = id_orden;
            foreach (var item in cargaInicialHerramientaDAC.ReadbyOrden(id_orden))
            {
                CodigoHerramienta codigo = new CodigoHerramienta();
                Herramienta herramienta = new Herramienta();
                if (item.codigo=="Nuevo" )
                {
                    codigo = null;
                    herramienta = null;
                }
              else  if (!item.existe)
                {
                    CodigoHerramienta codigoHerramienta = new CodigoHerramienta();
                   codigoHerramienta.numero = Texto.seperarNumeroDeUnaCadena(item.codigo);
                 codigoHerramienta.codigo = Texto.seperarLetrasDeUnaCadena(item.codigo);
                    herramienta=new Herramienta(null,null,null,null,codigoHerramienta);  
                    herramienta.codigoViejo = item.codigo;
                    
              
                    CodigoHerramientaComponent codigoHerramientaComponent = new CodigoHerramientaComponent();
                    codigo = codigoHerramientaComponent.ObtenerTipoHerramientaConCodigo(Texto.seperarLetrasDeUnaCadena(item.codigo));
                }
                else
                {
                    HerramientaComponent herramientaComponent = new HerramientaComponent();
                  herramienta=  herramientaComponent.ReadbyCodigoViejo(item.codigo);
                   
                    CodigoHerramientaComponent codigoHerramientaComponent = new CodigoHerramientaComponent();
                    codigo = codigoHerramientaComponent.ObtenerTipoHerramientaConCodigo(Texto.seperarLetrasDeUnaCadena(item.codigo));
                }
               

                CargaInicialHerramienta cargaInicialHerramienta = new CargaInicialHerramienta(ordenTrabajo,herramienta,codigo.tipo);
                cargaInicialHerramienta.codigo = item.codigo;
                cargaInicialHerramienta.existe = item.existe;
                result.Add(cargaInicialHerramienta);
            }
            return result;


        }


        public CargaInicialHerramienta ObtenerHerramientasPrecarga(int id_orden)

        {


            List<ProtocoloItem> protocoloItems = new List<ProtocoloItem>();
            ProtocoloItemComponent protocoloItemComponent = new ProtocoloItemComponent();

            List<CargaInicialHerramienta> listaCargaInicialHerramientas = new List<CargaInicialHerramienta>();

            CargaInicialHerramientaDAC cargaInicialHerramientaDAC = new CargaInicialHerramientaDAC();


            //obtengo la precarga
            listaCargaInicialHerramientas = cargaInicialHerramientaDAC.ReadbyOrden(id_orden);

            //obtengo las herramientas
            List<string> tipos = new List<string>();
            List<Herramienta> result = new List<Herramienta>();
            foreach (CargaInicialHerramienta cargaInicial in listaCargaInicialHerramientas)
            {
                Herramienta herramienta = new Herramienta();
                HerramientaComponent herramientaComponent = new HerramientaComponent();
                //cargo las herramienta que existen
                if (cargaInicial.herramienta.Id != 0)
                {
                    herramienta = herramientaComponent.ReadBy(cargaInicial.herramienta.Id);

                    tipos.Add(herramienta.tipoHerramienta.tipoHerramienta);
                    result.Add(herramienta);
                }
                else if (cargaInicial.herramienta.Id == 0 && cargaInicial.codigo != "Nuevo")
                {
                    //cargo las herramienta que no existen pero tiene codigo
                    string tipo = Texto.seperarLetrasDeUnaCadena(cargaInicial.codigo);
                    TipoHerramientaComponent tipoHerramientaComponent = new TipoHerramientaComponent();
                    TipoHerramienta tipoHerramienta = new TipoHerramienta();
                    tipoHerramienta = tipoHerramientaComponent.ObtenerTipoPorCodigo(tipo);
                    herramienta.Id = 0;
                    herramienta = new Herramienta(null, tipoHerramienta);
                    herramienta.codigoViejo = cargaInicial.codigo;
                    tipos.Add(tipoHerramienta.tipoHerramienta);
                    result.Add(herramienta);

                }

            }
            CargaInicialHerramienta cargaInicialHerramienta = new CargaInicialHerramienta(result, tipos);
            return cargaInicialHerramienta;


        }


        public void ActualizarListado(int id_orden)

        {
            CargaInicialHerramientaDAC cargaInicialHerramientaDAC = new CargaInicialHerramientaDAC();

            foreach (var item in cargaInicialHerramientaDAC.ReadbyOrdenYnoExiste(id_orden))
            {
                HerramientaComponent herramientaComponent = new HerramientaComponent();
                Herramienta herramienta = new Herramienta();
                herramienta = herramientaComponent.ReadbyCodigoViejo(item.codigo);

                if (herramienta!=null)
                {
                    cargaInicialHerramientaDAC.UpdateExsite(item.Id);

                }


            }
        
        }
        public void Delete(int id)

        { CargaInicialHerramientaDAC cargaInicialHerramientaDAC = new CargaInicialHerramientaDAC();
            cargaInicialHerramientaDAC.Delete(id);
        }
        public CargaInicialHerramienta Readby(int id)

        {
            CargaInicialHerramientaDAC cargaInicialHerramientaDAC = new CargaInicialHerramientaDAC();
       return     cargaInicialHerramientaDAC.Readby(id);

        }
        public bool VerificarTodasHerramientasSubidas(int id_orden) {

            int a = 0;
            foreach (var item in ReadbyOrden(id_orden))
            {
                if (item.codigo== "Nuevo" || item.existe==false)
                {
                    a = 1;
                    break;
                }
            }

            if ( a==0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
       

    }
}
