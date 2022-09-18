using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business;
using Data;
using Entities;
using Negocio;


namespace Bussiness
{
    public class ProtocoloComponent 
    {
        public Protocolo UltimoProtocolo(int id_herramienta)
        {
            ProtocoloDAC protocoloDAC = new ProtocoloDAC();
            return protocoloDAC.UltimoProtocolo(id_herramienta);
        }

        public Protocolo Create(Protocolo entity)
        {
            if (Verificar(entity))
            {
                ProtocoloDAC protocoloDAC = new ProtocoloDAC();
                return protocoloDAC.Create(entity);
            }
            else
            {
                return null;
            }
           
        }
        public Protocolo CreateMAsivo(Protocolo entity,int orden,List<string>itemNorma)
        {

            ProtocoloDAC protocoloDAC = new ProtocoloDAC();
            Protocolo protocolo = new Protocolo();
            protocolo = protocoloDAC.Create(entity);
            protocoloDAC.AgregarProtocolo(protocolo.Id, orden);
            ProtocoloItemComponent protocoloItem = new ProtocoloItemComponent();
            protocoloItem.CreateMasivoProtocoloItem(itemNorma, entity.norma.Id, protocolo.Id);

            if (entity.conclusion.ToLower() == "incorrecto")
            {
                HerramientaComponent herramientaComponent = new HerramientaComponent();
                herramientaComponent.UpdateEstado(entity.herramienta.Id, "Baja");

            }
            else
            {

                HerramientaComponent herramientaComponent = new HerramientaComponent();
                herramientaComponent.UpdateVencida(entity.herramienta.Id, true, entity.herramienta.tiempoMantenimiento);
            }




            return protocolo;
          

        }

   
        public void Delete(int id)
        {
            ProtocoloDAC protocoloDAC = new ProtocoloDAC();
             protocoloDAC.Delete(id);
        }

        public List<Protocolo> Read()
        {
            ProtocoloDAC protocoloDAC = new ProtocoloDAC();
            List<Protocolo> result = new List<Protocolo>();
            foreach (var item in protocoloDAC.Read())
            {
                result.Add(ReadBy(item.Id));
            }
            return result;
        }

        public Protocolo ReadBy(int id)
        {
            UsuariosComponent usuariosComponent = new UsuariosComponent();
            ProtocoloDAC protocoloDAC = new ProtocoloDAC();
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            Laboratorio laboratorio = new Laboratorio();
            HerramientaComponent herramientaComponent = new HerramientaComponent();
            Herramienta herramienta = new Herramienta();
            Protocolo protocolo = new Protocolo();
            protocolo = protocoloDAC.ReadBy(id);
            laboratorio = laboratorioComponent.ReadBy(protocolo.laboratorio.Id);
            herramienta = herramientaComponent.ReadBySimple(protocolo.herramienta.Id);
            List<Herramienta> instrumentos = new List<Herramienta>();
         
            Protocolo result = new Protocolo(herramienta, laboratorio,instrumentos);
            result.codigo = protocolo.codigo;
            result.conclusion = protocolo.conclusion;
            result.email = protocolo.email;
            result.fechaEnsayo =Fechas.FormatearAFecha( protocolo.fechaEnsayo);
            result.hmedadad = protocolo.hmedadad;
            result.Id = protocolo.Id;
            result.temperatura = protocolo.temperatura;
            result.usuario = usuariosComponent.ReadBy(protocolo.usuario.Id);
            result.qr = QR.GenerarQR(result.herramienta.codigoViejo);
            ProtocoloItemComponent protocoloItem = new ProtocoloItemComponent();
            result.protocoloItem = protocoloItem.ReadByProtocolo(id);

            return result;
        }



        public Protocolo ReadBy(string campo)
        {
            throw new NotImplementedException();
        }
        public List<Protocolo> ReadByHerramienta(int id_herramienta)
        {
            ProtocoloDAC protocoloDAC = new ProtocoloDAC();
            List<Protocolo> result = new List<Protocolo>();
            foreach (var item in protocoloDAC.ReadByHerramienta(id_herramienta))
            {
                result.Add(ReadBy(item.Id));
            }
            return result;
        }

        public Protocolo ReadBy(string fecha, int id_Herramienta)
        {
            UsuariosComponent usuariosComponent = new UsuariosComponent();
            ProtocoloDAC protocoloDAC = new ProtocoloDAC();
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            Laboratorio laboratorio = new Laboratorio();
            HerramientaComponent herramientaComponent = new HerramientaComponent();
            Herramienta herramienta = new Herramienta();
            Protocolo protocolo = new Protocolo();
            protocolo = protocoloDAC.ReadBy(fecha, id_Herramienta);
            laboratorio = laboratorioComponent.ReadBy(protocolo.laboratorio.Id);
            herramienta = herramientaComponent.ReadBy(protocolo.herramienta.Id);
            Protocolo result = new Protocolo(herramienta, laboratorio);
            result.codigo = protocolo.codigo;
            result.conclusion = protocolo.conclusion;
            result.email = protocolo.email;
            result.fechaEnsayo = Fechas.FormatearAFecha(protocolo.fechaEnsayo);
            result.hmedadad = protocolo.hmedadad;
            result.Id = protocolo.Id;
            result.observaciones = protocolo.observaciones;
            result.usuario = usuariosComponent.ReadBy(protocolo.usuario.Id);
            return result;

        }
        public void Update(Protocolo entity)
        {
            ProtocoloDAC protocoloDAC = new ProtocoloDAC();
            protocoloDAC.Update(entity);
        }

        public bool Verificar(Protocolo entity)
        {
            if (ReadBy(entity.fechaEnsayo,entity.herramienta.Id)==null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        #region ProtocoloOE

        public List<Protocolo> ReadByOrden(int orden)
        {
            List<Protocolo> result = new List<Protocolo>();



            ProtocoloDAC protocoloDAC = new ProtocoloDAC();
            foreach (var item in protocoloDAC.ReadByOrden(orden))
            {
                result.Add(ReadBy(item.Id));

            }



            return result;
        }
        
        #endregion


    }
}
