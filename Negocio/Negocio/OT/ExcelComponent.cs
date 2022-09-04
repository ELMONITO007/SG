using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Business;
using Bussiness;
using Data.Negocio.OT;
using Entities;

using Negocio.Herramienta;
using OfficeOpenXml;
using SpreadsheetLight;

namespace Negocio
{
    public class ExcelComponent
    {

        public CargaInicialHerramienta readExcel( int OE)

        {




            string path= Archivo.path + OE+ @"\subidaCompleta.xls";


            SLDocument sL = new SLDocument(path);
            int iRow = 2;
            List<CargaInicialHerramienta> carga = new List<CargaInicialHerramienta>();
            while (!string.IsNullOrEmpty(sL.GetCellValueAsString(iRow, 1)))
            {
                //obtener codigo
                Entities.Herramienta herramienta = new Entities.Herramienta();
          
                herramienta.codigoViejo = sL.GetCellValueAsString(iRow, 1);
                CargaInicialHerramienta cargaInicialHerramienta = new CargaInicialHerramienta(null,herramienta);
                carga.Add(cargaInicialHerramienta);
                iRow++;
            }
            CargaInicialHerramienta resul = new CargaInicialHerramienta(carga);
       

            return resul;

        }

        public excel ReadExportExcel(int OE,string path)


        {
          
            excel excel = new excel(); 
            string filename = path;
          
            using (SLDocument sl = new SLDocument())
            {
              
                FileStream fs = new FileStream(filename, FileMode.Open);

                foreach (var name in sl.GetWorksheetNames())
                {
                    


                    SLDocument sheet = new SLDocument(fs, name);
                    SLWorksheetStatistics stats = sheet.GetWorksheetStatistics();
                    excel result = new excel();
                   
                    for (int j = 2; j < stats.EndRowIndex; j++)
                    {
                      
                        result.nombreHoja = name;

                        

                        string fila = "";
                        for (int i = 1; i < stats.EndColumnIndex; i++)
                        {

                           fila = fila+sheet.GetCellValueAsString(j, i)+",";
                            

                        }

                      result.ListaFilas.Add(fila);
                       
                       

                    }
                    excel.lista.Add(result);

                    sl.CloseWithoutSaving();

                }

              

               
            }




            return excel;



        }



        public void ExportExcel( int OE,string path)
        {
            Archivo.path = path;
            Archivo.VerificarSiExsiteCarpetaPrincipal();
            Archivo.VerificarSiExsiteCarpetaEnsayo(OE);

            string filename =Archivo.path + OE + @"\ensayoN" + OE+".xls";

            if (File.Exists(filename))
            {
                File.Delete(filename);
            }
            CargaInicialHerramienta cargaInicialHerramientas = new CargaInicialHerramienta();

            CargaInicialHerramientaComponent  cargaInicialHerramientaDAC=new CargaInicialHerramientaComponent();

            cargaInicialHerramientas = cargaInicialHerramientaDAC.ObtenerHerramientasPrecarga(OE);
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
       

            using (var excelPackage = new ExcelPackage(new FileInfo(filename)))
            {

                foreach (var item in Texto.QuitarDuplicadoListaString(cargaInicialHerramientas.listaTipo))
                {
                    NormaComponent normaComponent = new NormaComponent();
                    TipoHerramientaComponent tipoHerramientaComponent = new TipoHerramientaComponent();
                     Norma norma=new Norma();
                    TipoHerramienta tipoHerramienta = new TipoHerramienta();
                    tipoHerramienta = tipoHerramientaComponent.ReadBy(item);
                    norma = normaComponent.ReadByTipoHerramienta(tipoHerramienta.Id);

                    var ws = excelPackage.Workbook.Worksheets.Add(item);
                    ws.Cells[1, 1].Value = "ID_Interno";
                    ws.Cells[1, 2].Value = "Codigo";
                    ws.Cells[1, 3].Value = "Marca";
                    ws.Cells[1, 4].Value = "Modelo";
                    ws.Cells[1, 5].Value = "Estado";
                    ws.Cells[1, 6].Value = "Numero de Serie";
                    ws.Cells[1, 7].Value = "Sector";

                    ws.Cells[1, 8].Value = "Fecha Ensayo";
                    ws.Cells[1, 9].Value = "Temperatura";
                    ws.Cells[1, 10].Value = "Humedad";
                    ws.Cells[1, 11].Value = "Conclusion";
                    ws.Cells[1, 12].Value = "Instrumento 1";
                    ws.Cells[1, 13].Value = "Instrumento 2";
                    ws.Cells[1, 14].Value = "Instrumento 3";




                    int cell = 2; 
                    int column =15;
                    foreach (var itemNorma in norma.listadoNormas)
                    {
                        ws.Cells[1, column].Value = itemNorma.nombre;
                        column++;
                    }


                  
                    foreach (var subItem in cargaInicialHerramientas.listaHerramienta)
                    {
                        if (item==subItem.tipoHerramienta.tipoHerramienta)
                        {
                            ws.Cells[cell, 1].Value = subItem.Id;
                            ws.Cells[cell, 2].Value = subItem.codigoViejo;
                            ws.Cells[cell, 3].Value = subItem.marca;
                            ws.Cells[cell, 4].Value = subItem.modelo;
                            ws.Cells[cell, 5].Value = subItem.Estado;
                            ws.Cells[cell, 6].Value = subItem.numeroSerie;
                            if (subItem.usuarios != null)
                            {
                                ws.Cells[cell, 7].Value = subItem.usuarios.UserName;
                            }
                            else
                            {
                                ws.Cells[cell, 7].Value = "";
                            }


                            ws.Cells[cell, 8].Value = DateTime.Now.ToString("dd-MM-yyyy");
                       

                          
                            cell++;
                        }
                      
                        
                    }

                    OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
                    OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                    ordenTrabajo = ordenTrabajoComponent.Readby(OE);
                    InstrumentoComponent instrumentoComponent = new InstrumentoComponent();
               
                  
                    string columnas12 = "L2:L" + cargaInicialHerramientas.listaHerramienta.Count();
                    string columnas13 = "M2:M" + cargaInicialHerramientas.listaHerramienta.Count();
                    string columnas14 = "N2:N" + cargaInicialHerramientas.listaHerramienta.Count();


                    var fila12 = ws.DataValidations.AddListValidation(columnas12);
                    var fila13 = ws.DataValidations.AddListValidation(columnas13);

                    var fila14 = ws.DataValidations.AddListValidation(columnas14);

                    foreach (var instrumento in instrumentoComponent.ReadbyLaboratorioTipoHerramienta(ordenTrabajo.Laboratorio.Id,tipoHerramienta.Id))
                    {
                        fila12.Formula.Values.Add( instrumento.codigo);
                        fila13.Formula.Values.Add( instrumento.codigo);
                        fila14.Formula.Values.Add(instrumento.codigo);


                    }


                    excelPackage.Save();
                }

            }


       



        }

       

    }
}