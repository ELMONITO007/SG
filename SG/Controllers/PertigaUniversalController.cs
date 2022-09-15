using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Negocio;

using System.Web.Mvc;
using Evaluaciones_Tecnicas.Filter;
using Entities;
using Business;

namespace TCT.Controllers.Negocio.Herramientas.Pertigas
{
    public class PertigaUniversalController : Controller
    {
        // GET: PertigaUniversal

        //[AuthorizerUser(_roles: "Administrador")]
        public ActionResult Index()
        {
            PertigaUniversalComponent pertigaUniversalComponent = new PertigaUniversalComponent();


            return View(pertigaUniversalComponent.Read());
        }

        // GET: PertigaUniversal/Details/5
        //[AuthorizerUser(_roles: "Administrador")]
        public ActionResult Details(int id)
        {
            PertigaUniversalComponent pertigaUniversalComponent = new PertigaUniversalComponent();

            return View(pertigaUniversalComponent.ReadBy(id));
        }

        // GET: PertigaUniversal/Create
        public ActionResult Create(string codigo)
        {
            UsuariosComponent sectorComponent = new UsuariosComponent();

            List<Usuarios> sectors = new List<Usuarios>();
            sectors = sectorComponent.Read();
            ViewBag.tipo = new List<string>() { "Eléctrico", "Mecánico" };
            PertigaUniversalComponent pertigaUniversal = new PertigaUniversalComponent();
            sectors.Select(y =>
                                new
                                {
                                    Id = y.Id,
                                    UserName = y.UserName
                                });

            ViewBag.sector = new SelectList(sectors, "Id", "UserName");

            PertigaUniversal resul = new PertigaUniversal();
            if (codigo != null)
            {
                CodigoHerramienta codigoHerramienta = new CodigoHerramienta();

                codigoHerramienta.codigo = Texto.seperarLetrasDeUnaCadena(codigo);
                codigoHerramienta.numero = Texto.seperarNumeroDeUnaCadena(codigo);
                PertigaUniversal pertigaUniversal1 = new PertigaUniversal();
                pertigaUniversal1= pertigaUniversal.ObtenerVacio();
                List<HerramientaItem> herramientaItems = new List<HerramientaItem>();
                resul=new PertigaUniversal(codigoHerramienta, pertigaUniversal1.tipoHerramienta, pertigaUniversal1.herramientaItem);
                resul.codigoViejo = pertigaUniversal1.codigoViejo;
              


                resul.codigoViejo = codigo;
            }
            else
            {
         
                resul = pertigaUniversal.ObtenerVacio();
               
            }



            return View(resul);
        }

        // POST: PertigaUniversal/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection, PertigaUniversal pertigaUniversales)
        {
            try
            {
                // TODO: Add insert logic here
                PertigaUniversalComponent herramienta = new PertigaUniversalComponent();
                Usuarios sector = new Usuarios();
                sector.Id = int.Parse(collection.Get("usuarios.Id"));
                CodigoHerramienta codigoHerramienta = new CodigoHerramienta();
                codigoHerramienta.codigo = collection.Get("codigoHerramienta.codigo");
                codigoHerramienta.numero = collection.Get("codigoHerramienta.numero");


                PertigaUniversal pertigaUniversal = new PertigaUniversal(codigoHerramienta, null, pertigaUniversales.herramientaItem);
                pertigaUniversal.usuarios = sector;
                pertigaUniversal.marca = collection.Get("Marca");
                pertigaUniversal.modelo = collection.Get("modelo");
                pertigaUniversal.numeroSerie = collection.Get("numeroSerie");
                pertigaUniversal.proximaActualizacion = collection.Get("proximaActualizacion");
                pertigaUniversal.tiempoMantenimiento = int.Parse(collection.Get("tiempoMantenimiento"));
                pertigaUniversal.tipo = collection.Get("tipo");




                if (herramienta.Create(pertigaUniversal) == null)
                {
                    return RedirectToAction("ErrorPage");
                }
                else
                {
                    return RedirectToAction("Index");
                }


            }
            catch (Exception e)
            {
                return View();
            }
        }

        // GET: PertigaUniversal/Edit/5
        public ActionResult Edit(int id)
        {
            PertigaUniversalComponent pertigaUniversalComponent = new PertigaUniversalComponent();

            return View(pertigaUniversalComponent.ReadBy(id));
        }

        // POST: PertigaUniversal/Edit/5
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

        // GET: PertigaUniversal/Delete/5
        public ActionResult Delete(int id)
        {
            PertigaUniversalComponent pertigaUniversalComponent = new PertigaUniversalComponent();

            return View(pertigaUniversalComponent.ReadBy(id));
        }

        // POST: PertigaUniversal/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                PertigaUniversalComponent pertigaUniversalComponent = new PertigaUniversalComponent();

                pertigaUniversalComponent.Delete(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult ErrorPage()
        {
            try
            {


                return View();
            }
            catch
            {
                return View();
            }
        }
    }
}
