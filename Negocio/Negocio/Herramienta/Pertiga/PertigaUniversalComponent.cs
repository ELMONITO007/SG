
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business;
using Bussiness;
using Data;
using Entities;

namespace Negocio
{
    public class PertigaUniversalComponent 
    {

       

        public PertigaUniversal Create(PertigaUniversal entity)
        {
            //creo la herramienta
            HerramientaComponent herramientaComponent = new HerramientaComponent();
            TipoHerramienta tipoHerramienta = new TipoHerramienta();
            TipoHerramientaComponent tipoHerramientaComponent = new TipoHerramientaComponent();
            tipoHerramienta = tipoHerramientaComponent.ReadBy("Pertiga universal");
            Usuarios usuarios = new Usuarios();
            usuarios.Id = entity.usuarios.Id;
            CodigoHerramienta codigoHerramienta = new CodigoHerramienta();
            CodigoHerramientaComponent codigoHerramientaComponent = new CodigoHerramientaComponent();
           
            codigoHerramienta=entity.codigoHerramienta;

          Entities.Herramienta herramienta = new Entities.Herramienta(usuarios, tipoHerramienta,codigoHerramienta);
            herramienta.modelo = entity.modelo;
            herramienta.Estado = "Activo";
            herramienta.numeroSerie = entity.numeroSerie;
            herramienta.tiempoMantenimiento = 24;
            herramienta.vencida = false;
            herramienta.marca = entity.marca;
            herramienta.proximaActualizacion = entity.proximaActualizacion;
            herramienta.codigoViejo = entity.codigoHerramienta.codigo + entity.codigoHerramienta.numero;
            if (herramientaComponent.Create(herramienta)!=null)
            {

                //Agrego los items especiales
                HerramientaItemComponent herramientaItemComponent = new HerramientaItemComponent();
                Entities.Herramienta herramientaCreada = new Entities.Herramienta();
                herramientaCreada = herramientaComponent.ReadbyCodigo("PEU", codigoHerramienta.numero);
           


          


                foreach (var item in entity.herramientaItem)
                {
                    ItemHerramienta itemHerramienta = new ItemHerramienta();
                    itemHerramienta.Id =int.Parse( item.Id);
                   
                    HerramientaItem herramientaItem = new HerramientaItem(herramientaCreada, itemHerramienta);
                    herramientaItem.valor = item.valor;
                    herramientaItemComponent.Create(herramientaItem);


                }
                return entity;
            }
            else
            {
                return null;
            }

            

        
        }

        public void Delete(int id)
        {
            HerramientaComponent herramientaComponent = new HerramientaComponent();
            herramientaComponent.UpdateEstado(id, "Baja");
           
        }

        public List<PertigaUniversal> Read()

         {
            TipoHerramientaDAC tipoHerramientaDAC = new TipoHerramientaDAC();
            TipoHerramienta tipoHerramienta = new TipoHerramienta();
            tipoHerramienta = tipoHerramientaDAC.ReadBy("Pertiga universal");
            List<Entities.Herramienta> herramientas = new List<Entities.Herramienta>();

            HerramientaComponent herramientaComponent = new HerramientaComponent();
            herramientas = herramientaComponent.Read(tipoHerramienta.Id);

            List<PertigaUniversal> result = new List<PertigaUniversal>();
            foreach (var item in herramientas)
            {

                Usuarios usuarios = new Usuarios();
      
                UsuariosComponent usuariosComponent = new UsuariosComponent();
                usuarios = usuariosComponent.ReadBy(item.usuarios.Id);
                CodigoHerramienta codigoHerramienta = new CodigoHerramienta();
                codigoHerramienta = item.codigoHerramienta;

                HerramientaItemComponent herramientaItemComponent = new HerramientaItemComponent();
                List<HerramientaItem> herramientaItems = new List<HerramientaItem>();
                herramientaItems = herramientaItemComponent.ReadbyTipo(item.Id);

                PertigaUniversal pertigaUniversales = new PertigaUniversal(codigoHerramienta, tipoHerramienta, herramientaItems);
                pertigaUniversales.Id = item.Id;
                pertigaUniversales.marca = item.marca;
                pertigaUniversales.modelo = item.modelo;
                pertigaUniversales.Estado = item.Estado;
                pertigaUniversales.numeroSerie = item.numeroSerie;
                pertigaUniversales.tiempoMantenimiento = item.tiempoMantenimiento;
                pertigaUniversales.vencida = item.vencida;
                pertigaUniversales.proximaActualizacion = item.proximaActualizacion;
                pertigaUniversales.usuarios = usuarios;
                pertigaUniversales.codigoViejo = item.codigoViejo;
                pertigaUniversales.proximaActualizacion = Fechas.FormatearAFecha(item.proximaActualizacion);
                pertigaUniversales.usuarios = usuarios;
                result.Add(pertigaUniversales);

            }



         return result;
        }

        public PertigaUniversal ObtenerVacio()

        {
            TipoHerramienta tipoHerramienta=new TipoHerramienta();
            TipoHerramientaComponent tipoHerramientaComponent = new TipoHerramientaComponent();
            tipoHerramienta = tipoHerramientaComponent.ReadBy("Pertiga universal");
            HerramientaItemComponent herramientaItemComponent = new HerramientaItemComponent();
            List<HerramientaItem> herramientaItems = new List<HerramientaItem>();
            herramientaItems = herramientaItemComponent.ReadbyTipo(tipoHerramienta.Id);

            PertigaUniversal pertigaUniversal=new PertigaUniversal(null,tipoHerramienta,herramientaItems);
        
            return pertigaUniversal;
        }

        public PertigaUniversal ReadBy(int id)
        {
            TipoHerramientaComponent tipoHerramientaDAC = new TipoHerramientaComponent();
            TipoHerramienta tipoHerramienta = new TipoHerramienta();
            tipoHerramienta = tipoHerramientaDAC.ReadBy("Pertiga universal");
            Entities.Herramienta item = new Entities.Herramienta();

            HerramientaComponent herramientaComponent = new HerramientaComponent();
            item = herramientaComponent.ReadBy(id);




            Usuarios usuarios = new Usuarios();

            UsuariosComponent usuariosComponent = new UsuariosComponent();
            usuarios = usuariosComponent.ReadBy(item.usuarios.Id);
            CodigoHerramienta codigoHerramienta = new CodigoHerramienta();
            codigoHerramienta = item.codigoHerramienta;

            HerramientaItemComponent herramientaItemComponent = new HerramientaItemComponent();
            List<HerramientaItem> herramientaItems = new List<HerramientaItem>();
            herramientaItems = herramientaItemComponent.ReadbyTipo(item.Id);

            PertigaUniversal pertigaUniversales = new PertigaUniversal(codigoHerramienta, tipoHerramienta, herramientaItems);
            pertigaUniversales.Id = item.Id;
            pertigaUniversales.marca = item.marca;
            pertigaUniversales.modelo = item.modelo;
            pertigaUniversales.Estado = item.Estado;
            pertigaUniversales.numeroSerie = item.numeroSerie;
            pertigaUniversales.tiempoMantenimiento = item.tiempoMantenimiento;
            pertigaUniversales.vencida = item.vencida;
            pertigaUniversales.listaProtocolo = item.listaProtocolo;
            pertigaUniversales.proximaActualizacion = Fechas.FormatearAFecha( item.proximaActualizacion);
            pertigaUniversales.codigoViejo = item.codigoViejo;
            pertigaUniversales.usuarios = usuarios;

            ProtocoloComponent protocoloComponent = new ProtocoloComponent();
            pertigaUniversales.listaProtocolo = protocoloComponent.ReadByHerramienta(id);
            return pertigaUniversales;

        }

        public PertigaUniversal ReadBy(string id)
        {
            throw new NotImplementedException();
        }

        public void Update(PertigaUniversal entity)
        {
            throw new NotImplementedException();
        }
    }
}
