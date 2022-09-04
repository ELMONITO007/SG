using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business;
using Data;
using Entities;
using Negocio;


namespace Bussiness
{
    public class HerramientaComponent 
    {
        public Herramienta ReadbyCodigo(string codigo, string numero)

        {
            HerramientaDAC herramientaDAC = new HerramientaDAC();
            return herramientaDAC.ReadbyCodigo(codigo,numero);
        }
        public Herramienta ReadbyCodigoViejo(string codigo)

        {
            HerramientaDAC herramientaDAC = new HerramientaDAC();
            return herramientaDAC.ReadbyCodigoViejo(codigo);
        }
        public Herramienta Create(Herramienta entity)
        {
            HerramientaDAC herramientaDAC = new HerramientaDAC();
            return herramientaDAC.Create(entity);
        }

        public void Delete(int id)
        {
            HerramientaDAC herramientaDAC = new HerramientaDAC();
            herramientaDAC.Delete(id);
        }

        public List<Herramienta> Read(int tipoHerramienta)
        {
            HerramientaDAC herramientaDAC = new HerramientaDAC();
            List<Herramienta> result = new List<Herramienta>();
      

            return herramientaDAC.ReadbyTipo(tipoHerramienta);
        }
        //falta
        public List<Herramienta> ReadbySector(int usuario)
        {
            HerramientaDAC herramientaDAC = new HerramientaDAC();
            List<Herramienta> result = new List<Herramienta>();

            foreach (var herramienta in (herramientaDAC.ReadbyUsuario(usuario)))
                {

                    result.Add(ReadBy(herramienta.Id));

                }

              

            return result;
        }
        public Herramienta ReadBySimple(int id)

        { HerramientaDAC herramientaDAC = new HerramientaDAC();
            Herramienta item = new Herramienta();

            item = herramientaDAC.ReadBy(id);
            Usuarios usuarios = new Usuarios();
            UsuariosComponent usuariosComponent = new UsuariosComponent();
            usuarios = usuariosComponent.ReadBy(item.usuarios.Id);
            TipoHerramienta tipo = new TipoHerramienta();
            TipoHerramientaComponent tipoHerramientaComponent = new TipoHerramientaComponent();
            tipo = tipoHerramientaComponent.ReadBySimple(item.tipoHerramienta.Id);

            Herramienta herramienta = new Herramienta(null, tipo, null);
            herramienta.codigo = item.codigo;
            herramienta.Estado = item.Estado;
            herramienta.Id = item.Id;
            herramienta.marca = item.marca;
            herramienta.modelo = item.modelo;
            herramienta.numeroSerie = item.numeroSerie;
            herramienta.tiempoMantenimiento = item.tiempoMantenimiento;
            herramienta.vencida = item.vencida;
            herramienta.proximaActualizacion =Fechas.FormatearAFecha( item.proximaActualizacion);
            herramienta.codigoViejo=item.codigoViejo;
            herramienta.usuarios = usuarios;
            return herramienta;
        }
        public void UpdateEstado(int id_Herramienta, string estado)

        {
            HerramientaDAC herramientaDAC = new HerramientaDAC();
            herramientaDAC.UpdateEstado(id_Herramienta, estado);

        }
        public void UpdateVencida(int id_Herramienta, bool estado,int tiempoEnsayoMeses)

        {
            HerramientaDAC herramientaDAC = new HerramientaDAC();
            herramientaDAC.UpdateVencida(id_Herramienta, estado);
            string hoy = Fechas.FormatearAAnsi(DateTime.Now.AddMonths(tiempoEnsayoMeses).ToString("yyyy-MM-dd"));

            herramientaDAC.UpdateFechaActualizacion(hoy, id_Herramienta);
        }
 
        public Herramienta ReadBy(int id)
        {
            HerramientaDAC herramientaDAC = new HerramientaDAC();
            Herramienta item = new Herramienta();
          
            item = herramientaDAC.ReadBy(id);

            Usuarios usuarios = new Usuarios();
            UsuariosComponent usuariosComponent = new UsuariosComponent();
            usuarios = usuariosComponent.ReadBy(item.usuarios.Id);
            TipoHerramienta tipo = new TipoHerramienta();
            TipoHerramientaComponent tipoHerramientaComponent = new TipoHerramientaComponent();
            tipo = tipoHerramientaComponent.ReadBy(item.tipoHerramienta.Id);
            HerramientaItemComponent herramientaItemComponent = new HerramientaItemComponent();
            List<HerramientaItem> herramientaItems = new List<HerramientaItem>();
            herramientaItems = herramientaItemComponent.ReadbyTipo(id);
            List<Protocolo> protocolos = new List<Protocolo>();
            ProtocoloComponent protocoloComponent = new ProtocoloComponent();
            protocolos = protocoloComponent.ReadByHerramienta(id);
            Herramienta herramienta = new Herramienta(herramientaItems,usuarios,tipo,protocolos,item.codigoHerramienta);
            herramienta.codigo = item.codigo;
            herramienta.Estado = item.Estado;
            herramienta.Id = item.Id;
            herramienta.marca = item.marca;
            herramienta.modelo = item.modelo;
            herramienta.numeroSerie = item.numeroSerie;
            herramienta.tiempoMantenimiento = item.tiempoMantenimiento;
            herramienta.vencida = item.vencida;
            herramienta.proximaActualizacion = item.proximaActualizacion;
            herramienta.codigoViejo = item.codigoViejo;
            herramienta.usuarios = usuarios;
            return herramienta;
        }

        public Herramienta ReadBy(string id)
        {
            HerramientaDAC herramientaDAC = new HerramientaDAC();
            return herramientaDAC.ReadBy(id);
        }

        public void Update(Herramienta entity)
        {
            throw new NotImplementedException();
        }

      

        public string ObtenerUltimoCodigo(int id)

        {
            throw new NotImplementedException();
        }

        public bool Verificar(Herramienta entity)
        {
            throw new NotImplementedException();
        }


    }
}
