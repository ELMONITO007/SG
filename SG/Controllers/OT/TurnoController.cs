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
        public ActionResult Create(int id, string semana, string año, string errorTurno)
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
                if (errorTurno==null)
                {
                    ViewBag.errorTurno ="Selecciones el turno, recuerde el orden de las fechas primero la recepcion, luego el comienzo, terminando en el fin";
                }
                else
                {
                    ViewBag.errorTurno = errorTurno;
                }
             
                return View(ordenTrabajo);

            }
            catch (Exception e)
            {

                return RedirectToAction("ErrorPage");
                throw;
            }




        }

        private string ValidarFechas(string FechaRecepcionMateriales, string FechaComienzoDeEnsayo, string FechaFinDeEnsayo)


        {

           

            string result = "";

            if (FechaRecepcionMateriales == "" || FechaComienzoDeEnsayo == "" || FechaFinDeEnsayo == "")
            {
                result = "Error debe ingresar todas las Fechas";
            }
            else
            {

                FechaRecepcionMateriales = Fechas.FormatearAAnsi(FechaRecepcionMateriales);
                FechaComienzoDeEnsayo = Fechas.FormatearAAnsi(FechaComienzoDeEnsayo);
                FechaFinDeEnsayo = Fechas.FormatearAAnsi(FechaFinDeEnsayo);
                string hoy = Fechas.FormatearAAnsi(DateTime.Now.ToString("yyyy-MM-dd"));
                int recepcion = int.Parse(FechaRecepcionMateriales);
                int Comienzo = int.Parse(FechaComienzoDeEnsayo);
                int Fin = int.Parse(FechaFinDeEnsayo);
                int today = int.Parse(hoy);


                if (recepcion-today   < 0)
                {
                    result = "La fecha de recepcion debe ser mayor o igual a la fecha de hoy";

                }
                else
                {


                    if ( Comienzo -recepcion < 0)
                    {
                        result = "La fecha de comienzo debe ser mayor o igual a la fecha de recepcion";

                    }
                    else
                    {
                        if (Fin-Comienzo  < 0)
                        {
                            result = "La fecha de fin debe ser mayor o igual a la fecha de comienzo";

                        }
                    }


                }
            }

            return result;


        }

        // POST: Turno/Create
        [HttpPost]
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                Usuarios usuarios = new Usuarios();
                usuarios = (Usuarios)Session["UserName"]; Laboratorio laboratorio = new Laboratorio();
                laboratorio.Id = int.Parse(collection.Get("Laboratorio.Id"));
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios, laboratorio);
                ordenTrabajo.Id = int.Parse(collection.Get("Id"));

                Turno turno = new Turno(ordenTrabajo);
                turno.FechaRecepcionMateriales = collection.Get("Turno.FechaRecepcionMateriales");
                turno.FechaComienzoDeEnsayo = collection.Get("Turno.FechaComienzoDeEnsayo");
                turno.FechaFinDeEnsayo = collection.Get("Turno.FechaFinDeEnsayo");
                string validar = ValidarFechas(turno.FechaRecepcionMateriales, turno.FechaComienzoDeEnsayo, turno.FechaFinDeEnsayo);
                if (validar == "")
                {
                    TurnoComponent turnoComponent = new TurnoComponent();
                    Archivo.path = Server.MapPath("~/Ensayos/");
                    if (turnoComponent.Create(turno) == null)
                    {
                        return RedirectToAction("ErrorPage");

                    }
                    else
                    {
                        return RedirectToAction("index", "ordenTrabajo", new { error = "Turno Asignado correctamente" });
                    }
                }
                else
                {
                
                    return RedirectToAction("Create", new { id = ordenTrabajo.Id,errorTurno = validar});
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
        public ActionResult EditarTurnoEnsayo(int id, string semana, string año, string errorTurno)
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

                if (errorTurno == null)
                {
                    ViewBag.errorTurno = "Selecciones el turno, recuerde el orden de las fechas primero la recepcion, luego el comienzo, terminando en el fin";
                }
                else
                {
                    ViewBag.errorTurno = errorTurno;
                }

                return View(ordenTrabajo);


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
                string validar = ValidarFechas(turno.FechaRecepcionMateriales, turno.FechaComienzoDeEnsayo, turno.FechaFinDeEnsayo);
                if (validar == "")
                {
                    string path = collection.Get("path");
                    CargaInicialHerramientaComponent excel = new CargaInicialHerramientaComponent();

                    turno.Id = int.Parse(collection.Get("Turno.Id"));
                    TurnoComponent turnoComponent = new TurnoComponent();
                    turnoComponent.UpdateFechaFinYcomienzo(turno);
                    return RedirectToAction("index", "ordenTrabajo", new { error = "Turno Confirmado correctamente" });

                }
                else
                {
                    return RedirectToAction("EditarTurnoEnsayo", new { id = ordenTrabajo.Id, errorTurno = validar });
                }
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
