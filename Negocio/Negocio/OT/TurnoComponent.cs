using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using Data;
using System.Globalization;
using Business;

namespace Negocio
{
    public class TurnoComponent
    {
        public Turno CrearOdernCOmpleta(Turno entity)

        {
            if (Verificar(entity.orden.Id))
            {

                TurnoDAC turnoDAC = new TurnoDAC();
                Turno turno = new Turno();
                entity.FechaComienzoDeEnsayo = FormatearAAnsi(entity.FechaComienzoDeEnsayo);
                entity.FechaFinDeEnsayo = FormatearAAnsi(entity.FechaFinDeEnsayo);
                entity.FechaRecepcionMateriales = FormatearAAnsi(entity.FechaRecepcionMateriales);
                turno = turnoDAC.Create(entity);
                OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo(entity.orden.Usuario, null);
                ordenTrabajo.Id = entity.orden.Id;
                
                String observiaciones = entity.orden.Usuario.UserName + " ha asignado los turnos. Turno para envio de herramientas: " + FormatearAFecha(entity.FechaRecepcionMateriales) + " ,Se ensayara entre los dias: " + FormatearAFecha(entity.FechaComienzoDeEnsayo) +" y " + FormatearAFecha(entity.FechaFinDeEnsayo);

                ordenTrabajoComponent.Update(ordenTrabajo, observiaciones);
                return turnoDAC.ReadByOrden(entity.orden.Id);


            }
            else
            {
                return null;
            }

        }

        public Turno Create(Turno entity)

        {
            if (Verificar(entity.orden.Id))
            {
              
                TurnoDAC turnoDAC = new TurnoDAC();
                Turno turno = new Turno();
                entity.FechaComienzoDeEnsayo = FormatearAAnsi(entity.FechaComienzoDeEnsayo);
                entity.FechaFinDeEnsayo = FormatearAAnsi(entity.FechaFinDeEnsayo);
                entity.FechaRecepcionMateriales = FormatearAAnsi(entity.FechaRecepcionMateriales);
                turno = turnoDAC.Create(entity);


                OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo(entity.orden.Usuario,entity.orden.Laboratorio);
                ordenTrabajo.Id =entity.orden.Id;

                OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado(entity.orden.Usuario,ordenTrabajo,null);

                OrdenTrabajoEstadoComponent ordenTrabajoEstadoComponent = new OrdenTrabajoEstadoComponent();

                ordenTrabajo.Estado = ordenTrabajoEstadoComponent.EstadoAsignarTurno(ordenTrabajo);
                ordenTrabajo.Id = entity.orden.Id;
                ordenTrabajoComponent.UpdateEstado(ordenTrabajo);
                Archivo.CrearExcelSubida(entity.orden.Id);
                return turnoDAC.ReadByOrden(entity.orden.Id);


            }
            else
            {
                return null;
            }

        }

        public Turno ReadBy(int id)
        {

            TurnoDAC turnoDAC = new TurnoDAC();
            return turnoDAC.ReadBy(id);
        }


        public Turno ReadByOrden(int id)


        {
            TurnoDAC turnoDAC = new TurnoDAC();
            Turno turno = new Turno();
            turno = turnoDAC.ReadByOrden(id);
            if (turno!=null)
            {
                turno.FechaRecepcionMateriales = FormatearAFecha(turno.FechaRecepcionMateriales);
                if (turno.FechaComienzoDeEnsayo != "A designar")
                {
                    turno.FechaFinDeEnsayo =FormatearAFecha(turno.FechaFinDeEnsayo);
                    turno.FechaComienzoDeEnsayo =FormatearAFecha(turno.FechaComienzoDeEnsayo);
                }
            }
          
            return turno;

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
        public List<Turno> ReadByFechaYLaboratorioMes(int mes,int año, int laboratorio)

        {
            string fechaInicio = string.Concat("1-", mes, "-", año);
            DateTime primerDia = DateTime.Parse(fechaInicio);
            DateTime ultimoDia = primerDia.AddMonths(1).AddDays(-1);
            string fechaFinal = ultimoDia.ToString("dd-MM-yyyy");

            TurnoDAC turnoDAC = new TurnoDAC();
            return turnoDAC.ReadByFechaYLaboratorio(fechaInicio,fechaFinal,laboratorio);
        }


        public string FormatearAFecha(string fecha)


        {

            string año = fecha.Substring(0, 4);
            string mes = fecha.Substring(4, 2);
            string dia = fecha.Substring(6, 2);

            string result = string.Concat(dia, "-", mes, "-", año);


            return result;

        }
        public string FormatearAAnsi(string fecha)


        {

            string año = fecha.Substring(0, 4);
            string mes = fecha.Substring(5, 2);
            string dia = fecha.Substring(8, 2);

            string result = string.Concat(año,mes,dia);


            return result;

        }


        public List<Turno> ReadByFechaYLaboratorioSemana(int semana, int año,int id)

        {
            List<Turno> result = new List<Turno>();
            DateTime fi = FirstDateOfWeekISO8601(año, semana);

            string fechaInicio = FormatearAAnsi(fi.ToString("yyyy-MM-dd"));
            DateTime ff = fi.AddDays(5);
            string fechaFinal = FormatearAAnsi(ff.ToString("yyyy-MM-dd"));
            TurnoDAC turnoDAC = new TurnoDAC();
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            foreach (var item in laboratorioComponent.ReadbyUsuario(id)) 
            {

                foreach (Turno turno in turnoDAC.ReadByFechaYLaboratorio(fechaInicio, fechaFinal, item.Id))
                {
                    OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
                    OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                    ordenTrabajo = ordenTrabajoComponent.Readby(turno.orden.Id);
                    Turno unTurno = new Turno(ordenTrabajo);
                    unTurno.CantidadOT = turno.CantidadOT;
                    unTurno.FechaRecepcionMateriales = FormatearAFecha(turno.FechaRecepcionMateriales);
                    if (turno.FechaFinDeEnsayo== "A designar")
                    {
                        unTurno.FechaComienzoDeEnsayo = turno.FechaComienzoDeEnsayo;
                        unTurno.FechaFinDeEnsayo = turno.FechaFinDeEnsayo;
                      
                    }
                    else
                    {
                        unTurno.FechaFinDeEnsayo = FormatearAFecha(turno.FechaFinDeEnsayo);
                        unTurno.FechaComienzoDeEnsayo = FormatearAFecha(turno.FechaComienzoDeEnsayo);
                    }
                    unTurno.Id = turno.Id;
                    result.Add(unTurno);

                }
            }
          
            return result ;
        }
        public List<Turno> VerTurnosDeEnsayoSemana(int semana, int año, int id,string estado)

        {
            List<Turno> result = new List<Turno>();
            DateTime fi = FirstDateOfWeekISO8601(año, semana);

            string fechaInicio = FormatearAAnsi(fi.ToString("yyyy-MM-dd"));
            DateTime ff = fi.AddDays(5);
            string fechaFinal = FormatearAAnsi(ff.ToString("yyyy-MM-dd"));
            TurnoDAC turnoDAC = new TurnoDAC();
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            foreach (var item in laboratorioComponent.ReadbyUsuario(id))
            {

                foreach (Turno turno in turnoDAC.ReadByFechaComienzoLaboratorioEstado(fechaInicio, fechaFinal, item.Id, estado))
                {
                    OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
                    OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                    ordenTrabajo = ordenTrabajoComponent.Readby(turno.orden.Id);
                    Turno unTurno = new Turno(ordenTrabajo);
                    unTurno.CantidadOT = turno.CantidadOT;
                    unTurno.FechaRecepcionMateriales = turno.FechaRecepcionMateriales;
                    if (turno.FechaFinDeEnsayo == "A designar")
                    {
                        unTurno.FechaComienzoDeEnsayo = turno.FechaComienzoDeEnsayo;
                        unTurno.FechaFinDeEnsayo = turno.FechaFinDeEnsayo;

                    }
                    else
                    {
                        unTurno.FechaFinDeEnsayo = FormatearAFecha(turno.FechaFinDeEnsayo);
                        unTurno.FechaComienzoDeEnsayo = FormatearAFecha(turno.FechaComienzoDeEnsayo);
                    }
                    unTurno.Id = turno.Id;
                    result.Add(unTurno);

                }
              
            }

            return result;
        }
        public List<Turno> ReadByFechaFinalLaboratorioEstado(int semana, int año, int id, string estado)

        {
            List<Turno> result = new List<Turno>();
            DateTime fi = FirstDateOfWeekISO8601(año, semana);

            string fechaInicio = FormatearAAnsi(fi.ToString("yyyy-MM-dd"));
            DateTime ff = fi.AddDays(5);
            string fechaFinal = FormatearAAnsi(ff.ToString("yyyy-MM-dd"));
            TurnoDAC turnoDAC = new TurnoDAC();
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            foreach (var item in laboratorioComponent.ReadbyUsuario(id))
            {

                foreach (Turno turno in turnoDAC.ReadByFechaFinalLaboratorioEstado(fechaInicio, fechaFinal, item.Id, estado))
                {
                    OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
                    OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                    ordenTrabajo = ordenTrabajoComponent.Readby(turno.orden.Id);
                    Turno unTurno = new Turno(ordenTrabajo);
                    unTurno.CantidadOT = turno.CantidadOT;
                    unTurno.FechaRecepcionMateriales = turno.FechaRecepcionMateriales;
                    if (turno.FechaFinDeEnsayo == "A designar")
                    {
                        unTurno.FechaComienzoDeEnsayo = turno.FechaComienzoDeEnsayo;
                        unTurno.FechaFinDeEnsayo = turno.FechaFinDeEnsayo;

                    }
                    else
                    {
                        unTurno.FechaFinDeEnsayo = FormatearAFecha(turno.FechaFinDeEnsayo);
                        unTurno.FechaComienzoDeEnsayo = FormatearAFecha(turno.FechaComienzoDeEnsayo);
                    }
                    unTurno.Id = turno.Id;
                    result.Add(unTurno);

                }

            }

            return result;
        }
        public List<Turno> ReadByFechaYLaboratorioSemanaSimple(int semana, int año, int id)

        {
            List<Turno> result = new List<Turno>();
            DateTime fi = FirstDateOfWeekISO8601(año, semana);

            string fechaInicio = FormatearAAnsi(fi.ToString("yyyy-MM-dd"));
            DateTime ff = fi.AddDays(5);
            string fechaFinal = FormatearAAnsi(ff.ToString("yyyy-MM-dd"));
            TurnoDAC turnoDAC = new TurnoDAC();
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            foreach (var item in laboratorioComponent.ReadbyUsuario(id))
            {

                foreach (Turno turno in turnoDAC.ReadByFechaYLaboratorio(fechaInicio, fechaFinal, item.Id))
                {
                  
                    Turno unTurno = new Turno();
                    unTurno.CantidadOT = turno.CantidadOT;
                    unTurno.FechaRecepcionMateriales = turno.FechaRecepcionMateriales;
                    if (turno.FechaFinDeEnsayo == "A designar")
                    {
                        unTurno.FechaComienzoDeEnsayo = turno.FechaComienzoDeEnsayo;
                        unTurno.FechaFinDeEnsayo = turno.FechaFinDeEnsayo;

                    }
                    else
                    {
                        unTurno.FechaFinDeEnsayo = FormatearAFecha(turno.FechaFinDeEnsayo);
                        unTurno.FechaComienzoDeEnsayo = FormatearAFecha(turno.FechaComienzoDeEnsayo);
                    }
                    unTurno.Id = turno.Id;
                    result.Add(unTurno);

                }
            }

            return result;
        }
        public void UpdateFechaFinYcomienzo(Turno entity)


        {
            Turno turno = new Turno();
            turno = ReadBy(entity.Id);
            TurnoDAC turnoDAC = new TurnoDAC();
           

            entity.FechaFinDeEnsayo=FormatearAAnsi(entity.FechaFinDeEnsayo);
            entity.FechaComienzoDeEnsayo = FormatearAAnsi(entity.FechaComienzoDeEnsayo);

            turnoDAC.UpdateFechaFinYcomienzo(entity);

            UpdateFechaRecpecion(entity);

            OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
            ordenTrabajo = entity.orden;
            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado(entity.orden.Usuario, ordenTrabajo, null);

            OrdenTrabajoEstadoComponent ordenTrabajoEstadoComponent = new OrdenTrabajoEstadoComponent();
            ordenTrabajoEstadoComponent.EstadoRecepcion(ordenTrabajo);
            ordenTrabajo.Estado = ordenTrabajoEstadoComponent.EstadoConfirmarTurno(ordenTrabajo);
            ordenTrabajo.Id = entity.orden.Id;
        

            OrdenTrabajoComponent orden = new OrdenTrabajoComponent();
            orden.UpdateEstado(ordenTrabajo);
           

        }
       
        public void UpdateFechaRecpecion(Turno entity)


        {

            TurnoDAC turnoDAC = new TurnoDAC();
            entity.FechaRecepcionMateriales = FormatearAAnsi(entity.FechaRecepcionMateriales);
            turnoDAC.UpdateFechaRecpecion(entity);

        }
       
        public bool Verificar(int id_Orden)

        {
            if (ReadByOrden(id_Orden)==null)
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
