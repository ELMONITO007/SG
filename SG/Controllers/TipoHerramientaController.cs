using Bussiness;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Entities;
using Evaluaciones_Tecnicas.Filter;

namespace TrabajoConTension.Controllers
{
    public class TipoHerramientaController : Controller
    {
        // GET: TipoHerramienta
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Index()
        {
            TipoHerramientaComponent tipoHerramientaComponent = new TipoHerramientaComponent();
            return View(tipoHerramientaComponent.Read());
        }

        // GET: TipoHerramienta/Details/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Details(int id)
        {
            TipoHerramientaComponent tipoHerramientaComponent = new TipoHerramientaComponent();
            return View(tipoHerramientaComponent.ReadBy(id));
        }

        // GET: TipoHerramienta/Create
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Create()
        {
            NormaComponent normaComponent=new NormaComponent();
            List<Norma> normas = new List<Norma>();
            normas=normaComponent.Read();

            normas.Select(y =>
                                new
                                {
                                    Id = y.Id,
                                    codigoNorma = y.codigoNorma
                                });

            ViewBag.norma = new SelectList(normas, "Id", "codigoNorma");

            TipoHerramienta tipoHerramienta = new TipoHerramienta();
            List<TipoHerramienta> tipoHerramientaList = new List<TipoHerramienta>();
            tipoHerramienta.subTipo = "Herramienta";
            tipoHerramienta.tipoEnsayo = "Eléctrico";
            tipoHerramienta.tipoUso = "Portatil";
            TipoHerramienta tipoHerramienta2 = new TipoHerramienta();
            tipoHerramienta2.subTipo = "Instrumento";
            tipoHerramienta2.tipoEnsayo = "Mecanico";
            tipoHerramienta2.tipoUso = "Fijo";
            tipoHerramientaList.Add(tipoHerramienta2);
            tipoHerramientaList.Add(tipoHerramienta);
            tipoHerramientaList.Select(y =>
                                new
                                {
                                    Id = y.Id,
                                    subTipo = y.subTipo
                                });

            ViewBag.subTipo = new SelectList(tipoHerramientaList, "subTipo", "subTipo");


            tipoHerramientaList.Select(y =>
                               new
                               {
                                   Id = y.Id,
                                   subTipo = y.tipoUso
                               });

            ViewBag.tipoUso = new SelectList(tipoHerramientaList, "tipoUso", "tipoUso");
            tipoHerramientaList.Select(y =>
                            new
                            {
                                Id = y.Id,
                                tipoEnsayo = y.tipoEnsayo
                            });

            ViewBag.tipoEnsayo = new SelectList(tipoHerramientaList, "tipoEnsayo", "tipoEnsayo");

            return View();
        }

        // POST: TipoHerramienta/Create
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                Norma norma = new Norma();
                norma.Id=int.Parse(collection.Get("norma.codigoNorma"));
                // TODO: Add insert logic here
                TipoHerramienta tipoHerramienta=new TipoHerramienta(null,null, norma);
                tipoHerramienta.subTipo = collection.Get("subTipo");
                tipoHerramienta.tipoUso = collection.Get("tipoUso");
                tipoHerramienta.tipoHerramienta = collection.Get("tipoHerramienta");
                tipoHerramienta.tipoEnsayo = collection.Get("tipoEnsayo");
                TipoHerramientaComponent tipoHerramientaComponent = new TipoHerramientaComponent();
                if (tipoHerramientaComponent.Create(tipoHerramienta)==null)
                {
                    return RedirectToAction("ErrorPage");
                }
                else
                {
                    return RedirectToAction("Index");
                }
                
            }
            catch
            {
                return View();
            }
        }
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult ErrorPage()
        {
            return View();
        }
        // GET: TipoHerramienta/Edit/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Edit(int id)
        {
            NormaComponent normaComponent = new NormaComponent();
            List<Norma> normas = new List<Norma>();
            normas = normaComponent.Read();

            normas.Select(y =>
                                new
                                {
                                    Id = y.Id,
                                    codigoNorma = y.codigoNorma
                                });

            ViewBag.norma = new SelectList(normas, "Id", "codigoNorma");

            TipoHerramienta tipoHerramienta = new TipoHerramienta();
            List<TipoHerramienta> tipoHerramientaList = new List<TipoHerramienta>();
            tipoHerramienta.subTipo = "Herramienta";
            tipoHerramienta.tipoEnsayo = "Eléctrico";
            tipoHerramienta.tipoUso = "Portatil";
            TipoHerramienta tipoHerramienta2 = new TipoHerramienta();
            tipoHerramienta2.subTipo = "Instrumento";
            tipoHerramienta2.tipoEnsayo = "Mecanico";
            tipoHerramienta2.tipoUso = "Fijo";
            tipoHerramientaList.Add(tipoHerramienta2);
            tipoHerramientaList.Add(tipoHerramienta);
            tipoHerramientaList.Select(y =>
                                new
                                {
                                    Id = y.Id,
                                    subTipo = y.subTipo
                                });

            ViewBag.subTipo = new SelectList(tipoHerramientaList, "subTipo", "subTipo");


            tipoHerramientaList.Select(y =>
                               new
                               {
                                   Id = y.Id,
                                   subTipo = y.tipoUso
                               });

            ViewBag.tipoUso = new SelectList(tipoHerramientaList, "tipoUso", "tipoUso");
            tipoHerramientaList.Select(y =>
                            new
                            {
                                Id = y.Id,
                                tipoEnsayo = y.tipoEnsayo
                            });

            ViewBag.tipoEnsayo = new SelectList(tipoHerramientaList, "tipoEnsayo", "tipoEnsayo");
            TipoHerramientaComponent tipoHerramientaComponent = new TipoHerramientaComponent();
            return View(tipoHerramientaComponent.ReadBy(id));
        }

        // POST: TipoHerramienta/Edit/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                Norma norma = new Norma();
                norma.Id = int.Parse(collection.Get("norma.codigoNorma"));
                // TODO: Add insert logic here
                TipoHerramienta tipoHerramienta = new TipoHerramienta(null, null, norma);
                tipoHerramienta.subTipo = collection.Get("subTipo");
                tipoHerramienta.tipoUso = collection.Get("tipoUso");
                tipoHerramienta.tipoHerramienta = collection.Get("tipoHerramienta");
                tipoHerramienta.tipoEnsayo = collection.Get("tipoEnsayo");
                tipoHerramienta.Id = id;
                TipoHerramientaComponent tipoHerramientaComponent = new TipoHerramientaComponent();
                tipoHerramientaComponent.Update(tipoHerramienta);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: TipoHerramienta/Delete/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Delete(int id)
        {
            TipoHerramientaComponent tipoHerramienta = new TipoHerramientaComponent();
            return View(tipoHerramienta.ReadBy(id));
        }

        // POST: TipoHerramienta/Delete/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                TipoHerramientaComponent tipoHerramienta = new TipoHerramientaComponent();
                tipoHerramienta.Delete(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
