using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZXing;
using ZXing.Common;
using ZXing.QrCode.Internal;
using ZXing.Rendering;
using System.Windows;
using Point = System.Drawing.Point;
using Size = System.Drawing.Size;
using System.Drawing;
using System.IO;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Bussiness;
using Entities;

namespace Business
{
    public class QR
    {

      

        public static Byte[] GenerarQR(string texto)

        {
            BarcodeWriter barcodeWriter = new BarcodeWriter();
            EncodingOptions encodingOptions = new EncodingOptions() { Width = 200, Height = 200, Margin = 0, PureBarcode = false };
            encodingOptions.Hints.Add(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
            barcodeWriter.Renderer = new BitmapRenderer();
            barcodeWriter.Options = encodingOptions;
            barcodeWriter.Format = BarcodeFormat.QR_CODE;


            Bitmap bitmap = barcodeWriter.Write(texto);

            





    
            return BitmapToBytes(bitmap);
        }


        private static Byte[] BitmapToBytes(Bitmap img)
        {
            using (MemoryStream stream = new MemoryStream())
            {
                img.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                return stream.ToArray();
            }
        }


        public static void GenerarPDFQRProtocolo(int id_Protocolo)


        { 
            ProtocoloComponent  protocoloComponent=new ProtocoloComponent();
            Protocolo protocolo = new Protocolo();
            protocolo = protocoloComponent.ReadBy(id_Protocolo);
            Document  document = new Document(PageSize.A4,15,15,0,0);    
        MemoryStream memoryStream=new MemoryStream();
            PdfWriter pdfWriter = PdfWriter.GetInstance(document, memoryStream);

            iTextSharp.text.Image image= iTextSharp.text.Image.GetInstance(GenerarQR(protocolo.herramienta.codigoViejo));



        }



    }
}
