using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using Data;
using Negocio;
using Business;

namespace Negocio.Herramienta
{
    public class InstrumentoComponent
    {
        public Instrumento ReadbyCodigo(string codigo)

        {

            Instrumento instrumento = new Instrumento();
            InstrumentoDAC instrumentoDAC = new InstrumentoDAC();
            instrumento = instrumentoDAC.ReadbyCodigo("TT0001");
            LaboratorioComponent  laboratorioComponent = new LaboratorioComponent();
            Instrumento result = new Instrumento(laboratorioComponent.ReadBy(instrumento.laboratorio.Id));
            result.Id=instrumento.Id;
            result.codigo = instrumento.codigo;
            result.marca = instrumento.marca;
            result.vencimiento = Fechas.FormatearAFecha(instrumento.vencimiento);
            result.tipo = instrumento.tipo;
            result.numeroSerie = instrumento.numeroSerie;
            result.tipoEnsayo = instrumento.tipoEnsayo;
            result.tipoUso = instrumento.tipoUso;
            result.certificado = instrumento.certificado;

            return result;


        }
        public Instrumento ReadBy(int id)

        {
            Instrumento instrumento = new Instrumento();
            InstrumentoDAC instrumentoDAC = new InstrumentoDAC();
            instrumento = instrumentoDAC.ReadBy(id);
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            Instrumento result = new Instrumento(laboratorioComponent.ReadBy(instrumento.laboratorio.Id));
            result.Id = instrumento.Id;
            result.codigo = instrumento.codigo;
            result.marca = instrumento.marca;
            result.vencimiento = Fechas.FormatearAFecha(instrumento.vencimiento);
            result.tipo = instrumento.tipo;
            result.numeroSerie = instrumento.numeroSerie;
            result.tipoEnsayo = instrumento.tipoEnsayo;
            result.tipoUso = instrumento.tipoUso;
            result.certificado = instrumento.certificado;
            return result;
        }
        public Instrumento Create(Instrumento entity)

        {
            InstrumentoDAC instrumentoDAC = new InstrumentoDAC();
            entity.codigo = ObtenerCodigo(entity.tipo);
            entity.vencimiento = Fechas.FormatearAAnsi(entity.vencimiento);
            Laboratorio laboratorio = new Laboratorio();
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            laboratorio = laboratorioComponent.ReadBy(entity.laboratorio.nombre);
            entity.laboratorio.Id = laboratorio.Id;
            return instrumentoDAC.Create(entity);                       


        }
        public List<Instrumento> ReadbyTipo(string tipo)
        {
            InstrumentoDAC instrumentoDAC = new InstrumentoDAC();
            return instrumentoDAC.ReadbyTipo(tipo);
        }

        public string ObtenerCodigo(string tipo)

        {
            Instrumento instrumento = new Instrumento();
            instrumento = ReadbyTipo(tipo).Last();
            string codigo="";
            if (instrumento==null)
            {

            }
            else
            {
                int numero = int.Parse(Texto.seperarNumeroDeUnaCadena(instrumento.codigo)) + 1;

                 codigo = Texto.seperarLetrasDeUnaCadena(instrumento.codigo) +"00"+ numero.ToString();
            }


       

            return codigo;
        }

        public void Delete(int id)

        {
            InstrumentoDAC instrumentoDAC = new InstrumentoDAC();
            instrumentoDAC.Delete(id);
        }
        public List<Instrumento> Read()

        {
            InstrumentoDAC instrumentoDAC = new InstrumentoDAC();
            List<Instrumento> list = new List<Instrumento>();   
            foreach (var instrumento in instrumentoDAC.Read())
            {
                LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
                Instrumento result = new Instrumento(laboratorioComponent.ReadBy(instrumento.laboratorio.Id));
                result.Id = instrumento.Id;
                result.codigo = instrumento.codigo;
                result.marca = instrumento.marca;
                result.vencimiento = Fechas.FormatearAFecha(instrumento.vencimiento);
                result.tipo = instrumento.tipo;
                result.numeroSerie = instrumento.numeroSerie;
                result.tipoEnsayo = instrumento.tipoEnsayo;
                result.tipoUso = instrumento.tipoUso;
                result.certificado = instrumento.certificado;
                list.Add(result);

            }
            return list;
        }

        public List<Instrumento> ReadbyLaboratorio(int id_Laboratorio)

        {
            InstrumentoDAC instrumentoDAC = new InstrumentoDAC();
            List<Instrumento> list = new List<Instrumento>();
            foreach (var instrumento in instrumentoDAC.ReadbyLaboratorio(id_Laboratorio))
            {
                LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
                Instrumento result = new Instrumento(laboratorioComponent.ReadBy(instrumento.laboratorio.Id));
                result.Id = instrumento.Id;
                result.codigo = instrumento.codigo;
                result.marca = instrumento.marca;
                result.vencimiento = Fechas.FormatearAFecha(instrumento.vencimiento);
                result.tipo = instrumento.tipo;
                result.numeroSerie = instrumento.numeroSerie;
                result.tipoEnsayo = instrumento.tipoEnsayo;
                result.tipoUso = instrumento.tipoUso;
                result.certificado = instrumento.certificado;
                list.Add(result);

            }
            return list;
        }
        public List<Instrumento> ReadbyLaboratorioTipoHerramienta(int id_Laboratorio, int id_tipoHerramienta)

        {
            InstrumentoDAC instrumentoDAC = new InstrumentoDAC();
            List<Instrumento> list = new List<Instrumento>();
            foreach (var instrumento in instrumentoDAC.ReadbyLaboratorioTipoHerramienta(id_Laboratorio,id_tipoHerramienta))
            {
                LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
                Instrumento result = new Instrumento(laboratorioComponent.ReadBy(instrumento.laboratorio.Id));
                result.Id = instrumento.Id;
                result.codigo = instrumento.codigo;
                result.marca = instrumento.marca;
                result.vencimiento =Fechas.FormatearAFecha( instrumento.vencimiento);
                result.tipo = instrumento.tipo;
                result.numeroSerie = instrumento.numeroSerie;
                result.tipoEnsayo = instrumento.tipoEnsayo;
                result.tipoUso = instrumento.tipoUso;
                result.certificado = instrumento.certificado;
                list.Add(result);

            }
            return list;
        }

        public void UpdateFechaVencimiento( int id,string vencimiento)

        {
            InstrumentoDAC instrumentoDAC = new InstrumentoDAC();
     
          
            vencimiento = Fechas.FormatearAAnsi(vencimiento);
            
       
            instrumentoDAC.UpdateFechaVencimiento(vencimiento, id);


        }

    }
}
