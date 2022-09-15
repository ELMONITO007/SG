using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Business;
using Entities;
using Evaluaciones_Tecnicas.Filter;
using Negocio;

namespace TrabajoConTensionV2.Controllers.OT
{
    public class PreCargaController : Controller

    {
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public FileResult Download(int id)

        {
            string ruta = Server.MapPath("/Ensayos/" + id + "/Subida.xls");
            return File(ruta, "application/xls", "SubidaOE"+ id+ ".xls");

        }

        // GET: PreCarga

        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Index(int id,string error)
        {

            CargaInicialHerramientaComponent cargaInicialHerramientaComponent=new CargaInicialHerramientaComponent();
            cargaInicialHerramientaComponent.ActualizarListado(id);
            OrdenTrabajo ordenTrabajo=new OrdenTrabajo();
            OrdenTrabajoComponent  ordenTrabajoComponent=new OrdenTrabajoComponent();
            ordenTrabajo = ordenTrabajoComponent.Readby(id);
            ordenTrabajo.cargaInicialHerramientas = cargaInicialHerramientaComponent.ReadbyOrden(id);
         


            if (error==null)
            {
                error = "Si la lista esta en blanco Sube el Archivo de De precarga";

            }
            ViewBag.Error=error;

            return View(ordenTrabajo);
        }
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        [HttpPost]
        public ActionResult Index( FormCollection collection, HttpPostedFileBase file)
        {
            try
            {
                int id = int.Parse(collection.Get("Id"));
                string error;
                CargaInicialHerramientaComponent cargaInicialHerramientaComponent = new CargaInicialHerramientaComponent();
                OrdenTrabajo ordenTrabajo = new OrdenTrabajo();
                OrdenTrabajoComponent ordenTrabajoComponent = new OrdenTrabajoComponent();
                ordenTrabajo = ordenTrabajoComponent.Readby(id);
                ordenTrabajo.cargaInicialHerramientas = cargaInicialHerramientaComponent.ReadbyOrden(id);
               
                string paths = Server.MapPath("~/Ensayos/");
                Archivo.path=paths;
             
                if (ordenTrabajo.cargaInicialHerramientas.Count==0)
                {
                    if (file==null)
                    {
                        error = "No selecciono Ningun Archivo";
                    }

                  
                    else
                    {
                        Archivo.VerificarSiExsiteArchivoSubida(id);
                        file.SaveAs(Server.MapPath("~/Ensayos/") + id + "/SubidaCompleta.xls");
                        if (Archivo.VerificarSiSubidaEstaVacio(id))
                        {
                           
                            string path = Server.MapPath("Ensayo");
                            cargaInicialHerramientaComponent.Create(id);
                            error = "Carga Existosa";

                        }
                        else
                        {
                            error = "El archivo Esta Vacio";
                        }


                    }
                }
                else
                {
                    error = "La carga Inicial ya fue realizada con anterioridad";
                }


                // TODO: Add update logic here


                
              
                return RedirectToAction("Index", new { id=id,error=error});


            }
            catch
            {
                return View();
            }
        }

        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Delete(int id)
        {
            CargaInicialHerramientaComponent cargaInicialHerramientaComponent = new CargaInicialHerramientaComponent();


            return View(cargaInicialHerramientaComponent.Readby(id));
        }
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        // POST: PreCarga/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                CargaInicialHerramientaComponent cargaInicialHerramientaComponent = new CargaInicialHerramientaComponent();
                cargaInicialHerramientaComponent.Delete(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
