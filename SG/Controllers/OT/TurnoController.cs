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

                return View(ordenTrabajo);
                
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
                    return RedirectToAction("index","ordenTrabajo",new { error= "Turno Asignado correctamente" });
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

                string path= collection.Get("path");
                CargaInicialHerramientaComponent excel =new CargaInicialHerramientaComponent();
               
                turno.Id = int.Parse(collection.Get("Turno.Id"));
                TurnoComponent turnoComponent = new TurnoComponent();
                turnoComponent.UpdateFechaFinYcomienzo(turno);
                return RedirectToAction("index", "ordenTrabajo", new { error = "Turno Confirmado correctamente" });


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
