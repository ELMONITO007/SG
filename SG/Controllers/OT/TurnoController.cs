using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Negocio;
using Entities;
using Evaluaciones_Tecnicas.Filter;
using Business;

namespace TCT.Controllers.Negocio.OT
{
    public class TurnoController : Controller
    {
        // GET: Turno
        

        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        // GET: Turno/Create
        public ActionResult Create( int id,string semana,string año)
        {
                   
            try
            {
             
                OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                Usuarios usuarios = new Usuarios();
                usuarios = (Usuarios)Session["UserName"];
                TurnoComponent turnoComponent = new TurnoComponent();
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
               
                ordenTrabajo = ordenTrabajoComponent.Readby(id);
                LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
                List<Laboratorio> sectores = new List<Laboratorio>();
                sectores = laboratorioComponent.Read();
                sectores.Select(y =>
                                    new
                                    {
                                        Id = y.Id,
                                        gerencia = y.nombre
                                    });

                ViewBag.laboratorios = new SelectList(sectores, "Id", "nombre");



                if (semana == null || año == null)
                {
                    int year = int.Parse(DateTime.Now.Year.ToString());
                    int week = ordenTrabajoComponent.ObtenerNumeroSemana(DateTime.Now.ToString("dd-MM-yyyy")) - 1;
                   
                    ViewBag.semana = week;
                    ViewBag.fechaInicio = DateTime.Now.ToString("dd-MM-yyyy");
                    ViewBag.fechaFinal = DateTime.Now.AddDays(5).ToString("dd-MM-yyyy");

                    ordenTrabajo.turnos = turnoComponent.ReadByFechaYLaboratorioSemana(week, year, usuarios.Id);
                    ordenTrabajo.turnosEnsayo= turnoComponent.VerTurnosDeEnsayoSemana(week, year, usuarios.Id, "Turno para ensayo asignado");

                    return View(ordenTrabajo);
                }
                else
                {
                    int year = int.Parse(año);
                    int week = int.Parse(semana);
                    ViewBag.semana = week;
                    DateTime f = ordenTrabajoComponent.FirstDateOfWeekISO8601(year, week);
                    ViewBag.fechaInicio = f.ToString("dd-MM-yyyy");
                    ViewBag.fechaFinal = f.AddDays(5).ToString("dd-MM-yyyy");

                    ordenTrabajo.turnos = turnoComponent.ReadByFechaYLaboratorioSemana(week, year, usuarios.Id);

                    ordenTrabajo.turnosEnsayo = turnoComponent.VerTurnosDeEnsayoSemana(week, year, usuarios.Id, "Turno para ensayo asignado");
                    ordenTrabajo.turnosEnsayoFin = turnoComponent.ReadByFechaFinalLaboratorioEstado(week, year, usuarios.Id, "Turno para ensayo asignado");
                    return View(ordenTrabajo);
                }
            }
            catch (Exception e)
            {

                return RedirectToAction("ErrorPage");
                throw;
            }



  
        }
   

               // POST: Turno/Create
               [HttpPost]
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                Usuarios usuarios = new Usuarios();
               usuarios=(Usuarios)Session["UserName"];Laboratorio laboratorio=new Laboratorio();
                laboratorio.Id = int.Parse(collection.Get("Laboratorio.Id"));
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios, laboratorio);
                ordenTrabajo.Id = int.Parse(collection.Get("Id"));
     
                Turno turno = new Turno(ordenTrabajo);
                turno.FechaRecepcionMateriales = collection.Get("Turno.FechaRecepcionMateriales");
                turno.FechaComienzoDeEnsayo = collection.Get("Turno.FechaComienzoDeEnsayo");
                turno.FechaFinDeEnsayo = collection.Get("Turno.FechaFinDeEnsayo");

                TurnoComponent turnoComponent = new TurnoComponent();
                Archivo.path= Server.MapPath("~/Ensayos/");
                if (turnoComponent.Create(turno)==null)
                {
                    return RedirectToAction("ErrorPage");

                }
                else
                {
                    return RedirectToAction("index","ordenTrabajo",new { id= ordenTrabajo.Id });
                }
               
                // TODO: Add insert logic here

               
            }
            catch (Exception e)
            {
                return View();
            }
        }


        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        // GET: Turno/Create
        public ActionResult EditarTurnoEnsayo(int id, string semana, string año)
        {

            try
            {

                OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                Usuarios usuarios = new Usuarios();
                usuarios = (Usuarios)Session["UserName"];
                TurnoComponent turnoComponent = new TurnoComponent();
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
                ordenTrabajo = ordenTrabajoComponent.Readby(id);
                ordenTrabajo.Turno.FechaRecepcionMateriales = Fechas.FechaUsa(ordenTrabajo.Turno.FechaRecepcionMateriales);
                ordenTrabajo.Turno.FechaComienzoDeEnsayo = Fechas.FechaUsa(ordenTrabajo.Turno.FechaComienzoDeEnsayo);
                ordenTrabajo.Turno.FechaFinDeEnsayo = Fechas.FechaUsa(ordenTrabajo.Turno.FechaFinDeEnsayo);
                if (semana == null || año == null)
                {
                    int year = int.Parse(DateTime.Now.Year.ToString());
                    int week = ordenTrabajoComponent.ObtenerNumeroSemana(DateTime.Now.ToString("dd-MM-yyyy")) - 1;
                    ViewBag.semana = week;
                    ViewBag.fechaInicio = DateTime.Now.ToString("dd-MM-yyyy");
                    ViewBag.fechaFinal = DateTime.Now.AddDays(5).ToString("dd-MM-yyyy");

                    ordenTrabajo.turnos = turnoComponent.ReadByFechaYLaboratorioSemana(week, year, usuarios.Id);


                    return View(ordenTrabajo);
                }
                else
                {
                    int year = int.Parse(año);
                    int week = int.Parse(semana);
                    ViewBag.semana = week;
                    DateTime f = ordenTrabajoComponent.FirstDateOfWeekISO8601(year, week);
                    ViewBag.fechaInicio = f.ToString("dd-MM-yyyy");
                    ViewBag.fechaFinal = f.AddDays(5).ToString("dd-MM-yyyy");

                    ordenTrabajo.turnos = turnoComponent.ReadByFechaYLaboratorioSemana(week, year, usuarios.Id);


                    return View(ordenTrabajo);
                }
            }
            catch (Exception e)
            {

                return RedirectToAction("ErrorPage");
       
            }




        }
        // POST: Turno/Create
        [HttpPost]
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult EditarTurnoEnsayo(FormCollection collection)
        {
            try
            {

                Usuarios usuarios = new Usuarios();
                usuarios = (Usuarios)Session["UserName"];
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios, null);
                ordenTrabajo.Id = int.Parse(collection.Get("Id"));

                Turno turno = new Turno(ordenTrabajo);
                turno.FechaRecepcionMateriales = collection.Get("Turno.FechaRecepcionMateriales");
                turno.FechaComienzoDeEnsayo = collection.Get("Turno.FechaComienzoDeEnsayo");
                turno.FechaFinDeEnsayo = collection.Get("Turno.FechaFinDeEnsayo");

                string path= collection.Get("path");
                CargaInicialHerramientaComponent excel =new CargaInicialHerramientaComponent();
               
                turno.Id = int.Parse(collection.Get("Turno.Id"));
                TurnoComponent turnoComponent = new TurnoComponent();
                turnoComponent.UpdateFechaFinYcomienzo(turno);
                return RedirectToAction("index", "ordenTrabajo" );
                

                // TODO: Add insert logic here


            }
            catch (Exception e)
            {
                return View();
            }
        }

        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult ErrorPage()
        {
            return View();

        }
        // GET: Turno/Edit/5
     
    }
}
