using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Business;
using Entities;
using Evaluaciones_Tecnicas.Filter;
using Negocio;

namespace TCT.Controllers.Negocio.OT
{
    public class OrdenTrabajoController : Controller
    {
        // GET: EnviarEquipos
        [AuthorizerUser(_roles: "TCT_Laboratorio,Tecnico")]
        public ActionResult EnviarEquipos(int id)

        {


            Usuarios usuarios = new Usuarios();
            usuarios = (Usuarios)Session["UserName"];
            OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios, null);


            OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();

            ordenTrabajo = ordenTrabajoComponent.Readby(id);
            return View(ordenTrabajo);



        }
        [AuthorizerUser(_roles: "TCT_Laboratorio,Tecnico")]
        [HttpPost]
        public ActionResult EnviarEquipos(FormCollection collection, int id)


        {
            TurnoComponent turnoComponent = new TurnoComponent();
            Usuarios usuarios = new Usuarios();
            usuarios = (Usuarios)Session["UserName"];
            OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios, null);
            ordenTrabajo.Id = id;
            //ordenTrabajo.Estado = "Herramientas enviadas";
            ordenTrabajo.GuiaRecepcion = collection.Get("GuiaRecepcion");
            ordenTrabajo.TransporteRecepcion = collection.Get("TransporteRecepcion");


            OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();

            ordenTrabajoComponent.UpdateGuiaRecepcion(ordenTrabajo);
            return RedirectToAction("OrdenSupervisor");



        }


        [AuthorizerUser(_roles: "Tecnico,TCT_Laboratorio")]
        public ActionResult OrdenSupervisor()
        {
            OrdenTrabajoComponent ordenTrabajo = new OrdenTrabajoComponent();
            Usuarios usuarios = new Usuarios();
            usuarios = (Usuarios)Session["UserName"];
            return View(ordenTrabajo.ReadbySector(usuarios.Id));
        }

        [AuthorizerUser(_roles: "TCT_Laboratorio,Tecnico")]
        public ActionResult Historico(int id)
        {
            OrdenTrabajoComponent ordenTrabajo = new OrdenTrabajoComponent();
            OrdenTrabajo orden = new OrdenTrabajo();
            orden = ordenTrabajo.VerEstados(id);
        
            return View(orden);
        }

        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Index(string error)
        {
            if (error == null)
            {
                ViewBag.Error = "Podra ver las ordenes de ensayos en la lista de abajo";
            }
            else
            {
                ViewBag.Error = error;
            }
            Usuarios usuarios = new Usuarios();
            usuarios = (Usuarios)Session["UserName"];
            OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();


            return View(ordenTrabajoComponent.ReadbyEnsayista(usuarios.Id));
        }



        // GET: OrdenTrabajo/Create
        //[AuthorizerUser(_roles: "TCT_Supervisor")]
        public ActionResult Create()
        {
            #region Laboratorio
           
            Usuarios usuarios = new Usuarios();
            usuarios = (Usuarios)Session["UserName"];
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
          
            #endregion

            OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios);

            ordenTrabajo.Fecha = DateTime.Now.ToString("dd-MM-yyyy");
        

            return View(ordenTrabajo);
        }

        // POST: OrdenTrabajo/Create
        [AuthorizerUser(_roles: "TCT_Laboratorio,Tecnico")]
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
                Usuarios usuarios = new Usuarios();

                usuarios.Id = int.Parse(collection.Get("Usuario.Id"));
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios, null);
                ordenTrabajo.cantidadEquipos = int.Parse(collection.Get("cantidadEquipos"));
                //ordenTrabajo.Estado = collection.Get("Estado");
                ordenTrabajo.Observaciones = collection.Get("Observaciones");
                ordenTrabajo.TransporteRecepcion = collection.Get("TransporteRecepcion");
                ordenTrabajo.GuiaRecepcion = collection.Get("GuiaRecepcion");
              

                OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                ordenTrabajoComponent.Create(ordenTrabajo);

                return RedirectToAction("OrdenSupervisor");
            }
            catch (Exception e)
            {
                return View();
            }
        }
        // GET: OrdenTrabajo/Create
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult CrearOrdenCompleto(string semana, string año)
        {
            #region Laboratorio
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            List<Laboratorio> laboratorios = new List<Laboratorio>();
            laboratorios = laboratorioComponent.Read();
            laboratorios.Select(y =>
                                new
                                {
                                    Id = y.Id,
                                    gerencia = y.nombre
                                });

            ViewBag.laboratorios = new SelectList(laboratorios, "Id", "nombre");

            #endregion


            try
            {
                OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                Usuarios usuarios = new Usuarios();
                usuarios = (Usuarios)Session["UserName"];
                TurnoComponent turnoComponent = new TurnoComponent();
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo();


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



                    ordenTrabajo.Fecha = DateTime.Now.ToString("dd-MM-yyyy");

                    return View(ordenTrabajo);
                }
            }
            catch (Exception e)
            {

                return RedirectToAction("ErrorPage");
                throw;
            }






        }

        // POST: OrdenTrabajo/Create
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        [HttpPost]
        public ActionResult CrearOrdenCompleto(FormCollection collection)
        {
            try
            {


                // TODO: Add insert logic here
                Usuarios usuarios = new Usuarios();
                Laboratorio laboratorio = new Laboratorio();
                laboratorio.Id = int.Parse(collection.Get("Laboratorio.nombre"));
                usuarios = (Usuarios)Session["UserName"];
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo(usuarios, laboratorio);
                ordenTrabajo.cantidadEquipos = int.Parse(collection.Get("cantidadEquipos"));
                //ordenTrabajo.Estado = "Esperando ensayo";
                ordenTrabajo.Observaciones = collection.Get("Observaciones");
                ordenTrabajo.TransporteRecepcion = collection.Get("TransporteRecepcion");
                ordenTrabajo.GuiaRecepcion = collection.Get("GuiaRecepcion");

                OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                Turno turno = new Turno();
                turno.FechaComienzoDeEnsayo = collection.Get("turno.FechaComienzoDeEnsayo");
                turno.FechaFinDeEnsayo = collection.Get("turno.FechaFinDeEnsayo");
                turno.FechaRecepcionMateriales = collection.Get("turno.FechaRecepcionMateriales");
                turno.FechaComienzoDeEnsayo = collection.Get("turno.FechaComienzoDeEnsayo");

                ordenTrabajoComponent.CrearOrdenCompleta(ordenTrabajo, turno);


                return RedirectToAction("index");
            }
            catch (Exception e)
            {
                return View();
            }
        }


        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        // GET: OrdenTrabajo/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        // POST: OrdenTrabajo/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: OrdenTrabajo/Delete/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Delete(int id)
        {
            return View();
        }

        [AuthorizerUser(_roles: "Tecnico")]
        public ActionResult Recibido(int id)
        {
            Usuarios usuarios = new Usuarios();
            usuarios = (Usuarios)Session["UserName"];
            OrdenTrabajoComponent ordenTrabajo = new OrdenTrabajoComponent();
            ordenTrabajo.Ensayado(id, usuarios.Id);

            return RedirectToAction("ordenSupervisor");
        }
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        // POST: OrdenTrabajo/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        [AuthorizerUser(_roles: "TCT_Laboratorio,Tecnico")]
        public ActionResult Download(int id)

        {
            CargaInicialHerramientaComponent cargaInicialHerramientaComponent = new CargaInicialHerramientaComponent();
            if (cargaInicialHerramientaComponent.VerificarTodasHerramientasSubidas(id))
            {
                string paths = Server.MapPath("~/Ensayos/");
                ExcelComponent excelComponent = new ExcelComponent();
                excelComponent.ExportExcel(id, paths);

                string ruta = paths + id + @"\ensayoN" + id + ".xls";
                return File(ruta, "application/xls", "EnsayoN" + id + ".xls");
            }
            else
            {
                return RedirectToAction("index", "Precarga", new { id = id, error = "No se puede Descargar. Agregue las heramientas que no existen" });
            }
        }
        [AuthorizerUser(_roles: "TCT_Laboratorio")]

        public ActionResult Ensayar(int id)
        {
            CargaInicialHerramientaComponent cargaInicialHerramientaComponent = new CargaInicialHerramientaComponent();
            if (cargaInicialHerramientaComponent.VerificarTodasHerramientasSubidas(id))
            {

                OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                return View(ordenTrabajoComponent.Readby(id));
            }
            else
            {
                return RedirectToAction("index", "Precarga", new { id = id, error = "No se puede ensayar. Agregue las heramientas que no existen" });
            }



        }
        [AuthorizerUser(_roles: "TCT_Laboratorio")]

        [HttpPost]
        public ActionResult Ensayar(int id, FormCollection collection, HttpPostedFileBase file)
        {
            try
            {
                // TODO: Add delete logic here
                Usuarios usuarios = new Usuarios();
                usuarios = (Usuarios)Session["UserName"];

                string error;


                if (file != null)
                {
                    string path = Server.MapPath("~/Ensayos/") + id + @"\ensayoN" + id + ".xls";
                    Archivo.VerificarSiExsiteArchivo(path);
                    file.SaveAs(Server.MapPath("~/Ensayos/") + id + @"\ensayoN" + id + ".xls");

                  
                    OrdenTrabajoComponent ordenTrabajo = new OrdenTrabajoComponent();
                    ordenTrabajo.Ensayar(id, usuarios.Id,path);

                    error = "Ensayo Realizado Correctamente";
                }

                else
                {
                    error = "No subio ningu archivo";
                }







                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

    }
}
