using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using System.Globalization;
using Bussiness;

namespace Negocio
{
    public class OrdenTrabajoComponent
    {
        public OrdenTrabajo Create(OrdenTrabajo entity)

        {

            TurnoComponent turnoComponent = new TurnoComponent();
            OrdenTrabajoDAC ordenTrabajoDAC = new OrdenTrabajoDAC();
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            entity.Fecha = turnoComponent.FormatearAAnsi(date);

            entity.guia = "A Asignar";
            entity.transporte = "A Asignar";

            //labo
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            Laboratorio laboratorio = new Laboratorio();
            laboratorio = laboratorioComponent.ReadbyUsuario(1)[0];
            entity.Laboratorio = laboratorio;
            OrdenTrabajo ordenTrabajo = new OrdenTrabajo();

            UsuariosComponent usuarios = new UsuariosComponent();
           
            entity.asignado.Id =1 ;
            ordenTrabajo = ordenTrabajoDAC.Create(entity);

            OrdenTrabajo ordenCreada = new OrdenTrabajo();
            ordenCreada = ordenTrabajoDAC.ObtenerUlrimaOrden(entity);

            //creo  el estado
            OrdenTrabajoEstadoComponent ordenTrabajoComponent = new OrdenTrabajoEstadoComponent();

            ordenTrabajoComponent.EstadoCrearOE(ordenCreada);


            //agrego el estado a la OE

            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado();
            ordenTrabajoEstado = ordenTrabajoComponent.EstadoActual(ordenCreada.Id);
            ordenCreada.Estado = ordenTrabajoEstado;
            UpdateEstado(ordenCreada);


            return ordenCreada;


        }


        public void CrearOrdenCompleta(OrdenTrabajo entity, Turno turno)


        {
            OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
            ordenTrabajo = Create(entity);
            TurnoComponent turnoComponent = new TurnoComponent();
            turno.orden = ordenTrabajo;
            turnoComponent.CrearOdernCOmpleta(turno);





        }
        public void Delete(int id)
        {
            OrdenTrabajoDAC ordenTrabajoDAC = new OrdenTrabajoDAC();
            ordenTrabajoDAC.Delete(id);
        }





        public List<OrdenTrabajo> ReadbyLaboratorio(int id_Laboratorio)

        {
            List<OrdenTrabajo> result = new List<OrdenTrabajo>();
            OrdenTrabajoDAC ordenTrabajoDAC = new OrdenTrabajoDAC();

            foreach (var item in ordenTrabajoDAC.ReadbyLaboratorio(id_Laboratorio))
            {
                Laboratorio laboratorio = new Laboratorio();
                LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
                laboratorio = laboratorioComponent.ReadBy(item.Laboratorio.Id);
                Usuarios usuarios = new Usuarios();
                UsuariosComponent usuariosComponent = new UsuariosComponent();
                usuarios = usuariosComponent.ReadBy(item.Usuario.Id);
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios, laboratorio);
                ordenTrabajo.cantidadEquipos = item.cantidadEquipos;
                ordenTrabajo.Estado = item.Estado;



                ordenTrabajo.Id = item.Id;
                ordenTrabajo.FechaAEnsayar = item.FechaAEnsayar;
                result.Add(ordenTrabajo);
            }

            return result;

        }

        public OrdenTrabajo VerEstados(int id)


        {
            ProtocoloComponent protocoloComponent = new ProtocoloComponent();
            List<Protocolo>  protocolos=new List<Protocolo>();
            protocolos = protocoloComponent.ReadByOrden(id);
            OrdenTrabajo orden = new OrdenTrabajo();
            orden = Readby(id);


            OrdenTrabajoEstadoComponent ordenTrabajoEstadoComponent = new OrdenTrabajoEstadoComponent();
            orden.estados = ordenTrabajoEstadoComponent.ReadByOrden(id);
            orden.protocolos = protocolos;
           
            return orden;



        }

        public List<OrdenTrabajo> ReadbySector(int id)
        {
            List<OrdenTrabajo> result = new List<OrdenTrabajo>();
            OrdenTrabajoDAC ordenTrabajoDAC = new OrdenTrabajoDAC();
            List<OrdenTrabajo> ListaOE = new List<OrdenTrabajo>();

         
                foreach (var item in ordenTrabajoDAC.ReadbySector(0))
                {
                    Laboratorio laboratorio = new Laboratorio();
                    LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
                    laboratorio = laboratorioComponent.ReadBy(item.Laboratorio.Id);
                    Usuarios usuarios = new Usuarios();
                    UsuariosComponent usuariosComponent = new UsuariosComponent();
                    usuarios = usuariosComponent.ReadBy(item.Usuario.Id);

                    OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios, laboratorio);
                    ordenTrabajo.cantidadEquipos = item.cantidadEquipos;
                    OrdenTrabajoEstado estado = new OrdenTrabajoEstado();
                    OrdenTrabajoEstadoComponent ordenTrabajoEstadoComponent = new OrdenTrabajoEstadoComponent();
                    estado = ordenTrabajoEstadoComponent.EstadoActual(item.Id);
                    ordenTrabajo.Estado = estado;
                    ordenTrabajo.Fecha = item.Fecha;
                    ordenTrabajo.Id = item.Id;
                    TurnoComponent turnoComponent = new TurnoComponent();
                    ordenTrabajo.Fecha = turnoComponent.FormatearAFecha(item.Fecha);
                    Turno turno = new Turno();
                    turno = turnoComponent.ReadByOrden(item.Id);
                    if (turno == null)
                    {
                        turno = new Turno();
                        turno.FechaFinDeEnsayo = "A Asignar";
                        turno.FechaRecepcionMateriales = "A Asignar";
                    }
                    else
                    {
                        ordenTrabajo.Turno = turno;

                    }
                    if (item.guia == null)
                    {
                        ordenTrabajo.transporte = "A Asignar";
                        ordenTrabajo.guia = "A Asignar";
                    }
                    else
                    {
                        ordenTrabajo.transporte = item.transporte;
                        ordenTrabajo.guia = item.guia;

                    }
                    result.Add(ordenTrabajo);
                }


           






            return result;

        }


        public OrdenTrabajo Readby(int id)
        {
            List<OrdenTrabajo> result = new List<OrdenTrabajo>();
            OrdenTrabajoDAC ordenTrabajoDAC = new OrdenTrabajoDAC();

            foreach (var item in ordenTrabajoDAC.Readby(id))
            {
                Laboratorio laboratorio = new Laboratorio();
                LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
                laboratorio = laboratorioComponent.ReadBy(item.Laboratorio.Id);
                Usuarios usuarios = new Usuarios();
                UsuariosComponent usuariosComponent = new UsuariosComponent();
                usuarios = usuariosComponent.ReadBy(item.Usuario.Id);
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios, laboratorio);
                ordenTrabajo.cantidadEquipos = item.cantidadEquipos;
                OrdenTrabajoEstado estado = new OrdenTrabajoEstado();
                OrdenTrabajoEstadoComponent ordenTrabajoEstadoComponent = new OrdenTrabajoEstadoComponent();
                estado = ordenTrabajoEstadoComponent.EstadoActual(item.Id);
                ordenTrabajo.Fecha = item.Fecha;
                ordenTrabajo.Id = item.Id;
                ordenTrabajo.GuiaRecepcion = item.GuiaRecepcion;
                ordenTrabajo.TransporteRecepcion = item.TransporteRecepcion;
                ordenTrabajo.Observaciones = item.Observaciones;
                TurnoComponent turnoComponent = new TurnoComponent();
                ordenTrabajo.Turno = turnoComponent.ReadByOrden(id);
                ordenTrabajo.Fecha = turnoComponent.FormatearAFecha(item.Fecha);
                result.Add(ordenTrabajo);
            }

            return result[0];

        }
        public List<OrdenTrabajo> ReadbyEnsayista(int id)
        {
            List<Laboratorio> laboratorios = new List<Laboratorio>();
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            laboratorios = laboratorioComponent.ReadbyUsuario(id);



            List<OrdenTrabajo> result = new List<OrdenTrabajo>();
            OrdenTrabajoDAC ordenTrabajoDAC = new OrdenTrabajoDAC();
            foreach (Laboratorio labo in laboratorios)
            {
                foreach (var item in ordenTrabajoDAC.ReadbyLaboratorio(labo.Id))
                {
                    Laboratorio laboratorio = new Laboratorio();

                    laboratorio = laboratorioComponent.ReadBy(item.Laboratorio.Id);
                    Usuarios usuarios = new Usuarios();
                    UsuariosComponent usuariosComponent = new UsuariosComponent();
                    usuarios = usuariosComponent.ReadBy(item.Usuario.Id);
                    OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios, laboratorio);
                    ordenTrabajo.cantidadEquipos = item.cantidadEquipos;
                    OrdenTrabajoEstado estado = new OrdenTrabajoEstado();
                    OrdenTrabajoEstadoComponent ordenTrabajoEstadoComponent = new OrdenTrabajoEstadoComponent();
                    estado = ordenTrabajoEstadoComponent.EstadoActual(item.Id);
                    ordenTrabajo.Estado = estado;
                    ordenTrabajo.Fecha = item.Fecha;
                    ordenTrabajo.Id = item.Id;
                    ordenTrabajo.GuiaRecepcion = item.GuiaRecepcion;
                    ordenTrabajo.TransporteRecepcion = item.TransporteRecepcion;
                    ordenTrabajo.Observaciones = item.Observaciones;
                    TurnoComponent turnoComponent = new TurnoComponent();
                    ordenTrabajo.Turno = turnoComponent.ReadByOrden(item.Id);
                    ordenTrabajo.Fecha = turnoComponent.FormatearAFecha(item.Fecha);
                    result.Add(ordenTrabajo);
                }
            }




            return result;

        }
        public DateTime FirstDateOfWeekISO8601(int year, int weekOfYear)
        {
            DateTime jan1 = new DateTime(year, 1, 1);
            int daysOffset = DayOfWeek.Thursday - jan1.DayOfWeek;

            // Use first Thursday in January to get first week of the year as
            // it will never be in Week 52/53
            DateTime firstThursday = jan1.AddDays(daysOffset);
            var cal = CultureInfo.CurrentCulture.Calendar;
            int firstWeek = cal.GetWeekOfYear(firstThursday, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);

            var weekNum = weekOfYear;
            // As we're adding days to a date in Week 1,
            // we need to subtract 1 in order to get the right date for week #1
            if (firstWeek == 1)
            {
                weekNum -= 1;
            }

            // Using the first Thursday as starting week ensures that we are starting in the right year
            // then we add number of weeks multiplied with days
            var result = firstThursday.AddDays(weekNum * 7);

            // Subtract 3 days from Thursday to get Monday, which is the first weekday in ISO8601
            return result.AddDays(-3);
        }

        public int ObtenerNumeroSemana(string fecha)


        {
            DateTime f = DateTime.Parse(fecha);
            DateTime v2 = new DateTime(f.Year, f.Month, f.Day);
            int x = System.Globalization.CultureInfo.CurrentUICulture.Calendar.GetWeekOfYear(v2, CalendarWeekRule.FirstDay, v2.DayOfWeek);

            return x;

        }

        public void Update(OrdenTrabajo entity, string observaciones)
        {
            OrdenTrabajoDAC ordenTrabajoDAC = new OrdenTrabajoDAC();
            ordenTrabajoDAC.Update(entity);
            OrdenTrabajoEstadoComponent ordenTrabajoComponent = new OrdenTrabajoEstadoComponent();
            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado();
            ordenTrabajoEstado.Usuarios = entity.Usuario;
            ordenTrabajoEstado.ordenTrabajo = entity;

            ordenTrabajoEstado.observaciones = observaciones;

            ordenTrabajoComponent.Create(ordenTrabajoEstado);
        }
        public void UpdateEstado(OrdenTrabajo entity)

        {
            OrdenTrabajoDAC ordenTrabajoDAC = new OrdenTrabajoDAC();
            ordenTrabajoDAC.UpdateEstado(entity);

        }
        public void UpdateGuia(OrdenTrabajo entity)

        {
            OrdenTrabajoDAC ordenTrabajoDAC = new OrdenTrabajoDAC();
            ordenTrabajoDAC.UpdateGuia(entity);

        }
        public void UpdateGuiaRecepcion(OrdenTrabajo entity)

        {
            OrdenTrabajoDAC ordenTrabajoDAC = new OrdenTrabajoDAC();
            ordenTrabajoDAC.UpdateGuiaRecepcion(entity);

            //cambio estado
            OrdenTrabajo ordenTrabajo = new OrdenTrabajo(entity.Usuario, entity.Laboratorio);
            OrdenTrabajo result = new OrdenTrabajo();
            result = Readby( entity.Id);
            ordenTrabajo.GuiaRecepcion = result.GuiaRecepcion;
            ordenTrabajo.TransporteRecepcion = result.TransporteRecepcion;
            ordenTrabajo.Id = result.Id;
            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado(entity.Usuario, ordenTrabajo, null);

            OrdenTrabajoEstadoComponent ordenTrabajoEstadoComponent = new OrdenTrabajoEstadoComponent();

            ordenTrabajo.Estado = ordenTrabajoEstadoComponent.EstadoHerramientaEnviadas(ordenTrabajo);

            UpdateEstado(ordenTrabajo);

        }


        public void Ensayar(int id_orden, int id_usuario,string path)


        {
            ProtocoloMasivo protocolo = new ProtocoloMasivo();
           
            protocolo.registroMasivo(id_orden, id_usuario,path);

            //creo  el estado
            OrdenTrabajoEstadoComponent ordenTrabajoComponent = new OrdenTrabajoEstadoComponent();

            OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
            ordenTrabajo = Readby(id_orden);
            ordenTrabajoComponent.EstadoEnsyar(ordenTrabajo);


            //agrego el estado a la OE

            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado();
            ordenTrabajoEstado = ordenTrabajoComponent.EstadoActual(ordenTrabajo.Id);
            ordenTrabajo.Estado = ordenTrabajoEstado;
            UpdateEstado(ordenTrabajo);


        }

        public void Ensayado(int id_orden, int id_usuario)


        {
     

            //creo  el estado
            OrdenTrabajoEstadoComponent ordenTrabajoComponent = new OrdenTrabajoEstadoComponent();

            OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
            ordenTrabajo = Readby(id_orden);
            ordenTrabajoComponent.EstadoRecepcionado(ordenTrabajo);


            //agrego el estado a la OE

            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado();
            ordenTrabajoEstado = ordenTrabajoComponent.EstadoActual(ordenTrabajo.Id);
            ordenTrabajo.Estado = ordenTrabajoEstado;
            UpdateEstado(ordenTrabajo);


        }


    }
}
