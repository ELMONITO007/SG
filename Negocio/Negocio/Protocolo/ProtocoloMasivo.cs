
using Business;
using Bussiness;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ProtocoloMasivo
    {
        public List<Protocolo> registroMasivo(int id_Orden,int id_usuario,string path)


        {
           

            ExcelComponent excelComponent = new ExcelComponent();
            excel excel = new excel();
            OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
            OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
            ordenTrabajo = ordenTrabajoComponent.Readby(id_Orden);
            List<Protocolo> protocolos = new List<Protocolo>();
            excel = excelComponent.ReadExportExcel(id_Orden,path);
            int a = 0;


            foreach (var item in excel.lista)
            {
               

                foreach (var subItem in item.ListaFilas)
                {
                    
                    List<string> subList = new List<string>();
                    subList = Texto.SepararTextoPorCaracter(',', subItem);
                 Entities.Herramienta herramienta = new Entities.Herramienta();
                    HerramientaComponent herramientaComponent = new HerramientaComponent();
                    herramienta = herramientaComponent.ReadBy(int.Parse(subList[0]));
                    if (herramienta != null)
                    {

                        Protocolo protocolo = new Protocolo(herramienta, ordenTrabajo.Laboratorio);
                        protocolo.fechaEnsayo = Fechas.FechaUsaAsnsi(subList[7]);
                        protocolo.temperatura = int.Parse(subList[8]);
                        protocolo.hmedadad = int.Parse(subList[9]);
                        protocolo.conclusion = subList[10];

                        protocolo.norma = GenerarDatosNorma(herramienta.tipoHerramienta.norma.Id, subList);
                        protocolo.codigo = protocolo.laboratorio.codigo + "-OE" + id_Orden + "-" + a;
                        protocolo.usuario.Id = id_usuario;
                        ProtocoloComponent protocoloComponent = new ProtocoloComponent();
                        protocoloComponent.CreateMAsivo(protocolo, id_Orden,ObtenerItemNorma(subList));
                        protocolos.Add(protocolo);
                        a++;
                    }



                }



            }
            return protocolos;



        }


        public List<string> ObtenerItemNorma(List<string> lista)

        { 

        List<string> result = new List<string>();

            for (int i = 11; i < lista.Count()-1; i++)
            {
                result.Add(lista[i]);
            }

            return result;
        }

        public Norma GenerarDatosNorma(int id_norma, List<string> itenNorma)

        {
            Norma norma = new Norma();
            NormaComponent normaComponent = new NormaComponent();
            norma = normaComponent.ReadBy(id_norma);
            List<ItemNorma> itemNormas = new List<ItemNorma>();
            int a = 11;

            foreach (var item in norma.listadoNormas)
            {
                ItemNorma itemNorma = new ItemNorma();
                itemNorma.Id = item.Id;
                itemNorma.nombre = item.nombre;
                itemNorma.valor = itenNorma[a];
                itemNormas.Add(itemNorma);
                a++;
            }
            Norma result = new Norma(itemNormas);
            result.Id = id_norma;
            result.pathFoto = norma.pathFoto;
            result.codigoNorma = norma.codigoNorma;
            result.nombre = norma.nombre;
            result.protocolo = norma.protocolo;
            return result;
        }

        
    }
}
