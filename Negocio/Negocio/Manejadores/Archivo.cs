using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public static class Archivo
    {

        public  static bool  VerificarSiSubidaEstaVacio(int orden)

        {
            string p =path+@"\" + orden + @"\SubidaCompleta.xls";
            FileInfo fi = new FileInfo(p);
            var f = fi.Length;

            if (f > 7915 )
            {
                return true;
                
            }
            else
            {
                return false;
            }



        }
        public static bool VerificarSiFinalEstaVacio(int orden)

        {
            string p = @"C:\ensayos\" + orden + @"\ensayoN"+orden+".xls";
            FileInfo fi = new FileInfo(p);
            var f = fi.Length;
            if (f > 7915)
            {
                return true;

            }
            else
            {
                return false;
            }



        }

        public static void VerificarSiExsiteCarpetaPrincipal()

        {

           
            FileInfo fi = new FileInfo(Archivo.path);  
            bool a=File.Exists(fi.FullName);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);

            }
                    
        
        }

        public static void VerificarSiExsiteCarpetaEnsayo(int orden)

        {
            string p = Archivo.path + @"\" + orden;
            if (!Directory.Exists(p))
            {
                Directory.CreateDirectory(p);

            }


        }
        public static void VerificarSiExsiteCarpetaEnsayo2(int orden )

        {
            string p =path+ @"\" + orden;
            if (!Directory.Exists(p))
            {
                Directory.CreateDirectory(p);

            }


        }
        public static void VerificarSiExsiteArchivoSubida(int orden)

        {
            string p = path + orden + @"\SubidaCompleta.xls";
       
            if (File.Exists(p))
            {
                File.Delete(p);

            }


        }
        public static bool VerificarArchivoSubidaAbierto(int orden)


        {
            string p = @"C:\ensayos\" + orden + @"\Subida.xls";
            FileStream stream = null;
            FileInfo file;
            file=new FileInfo(p);
            try
            {

                stream = file.Open(FileMode.Open, FileAccess.ReadWrite, FileShare.None);


            }
            catch (IOException)


            {

                return true;
            }
            finally {

                if (stream != null) stream.Close();

         
            }

            return false;
        }
        public static bool VerificarArchivoFinalAbierto(int orden)


        {
            string p = @"C:\ensayos\" + orden + @"\ensayoN" + orden + ".xls";
            FileStream stream = null;
            FileInfo file;
            file = new FileInfo(p);
            try
            {

                stream = file.Open(FileMode.Open, FileAccess.ReadWrite, FileShare.None);


            }
            catch (IOException)


            {

                return true;
            }
            finally
            {

                if (stream != null) stream.Close();


            }

            return false;
        }

        public static string path = "";
        public static void CrearExcelSubida(int orden)

        {

            VerificarSiExsiteCarpetaPrincipal();

            VerificarSiExsiteCarpetaEnsayo2(orden);

            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            string filename =path+ @"\"+orden+@"\Subida.xls";
            using (var excelPackage = new ExcelPackage(new FileInfo(filename)))

            {
                var ws = excelPackage.Workbook.Worksheets.Add("PreCarga");

              
                ws.Cells[1, 1].Value = "Codigo";
                excelPackage.Save();
            }

        }


    }
}
