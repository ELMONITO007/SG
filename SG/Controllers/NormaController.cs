using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bussiness;
using Entities;
namespace SG.Controllers
{
    public class NormaController : Controller
    {
        // GET: Norma
        public ActionResult Index()
        {
            NormaComponent  normaComponent = new NormaComponent();
            return View(normaComponent.Read());
        }

        // GET: Norma/Details/5
        public ActionResult Details(int id)
        {
            NormaComponent normaComponent = new NormaComponent();
            return View(normaComponent.ReadBy(id));
        }

        // GET: Norma/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Norma/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection,Norma norma)
        {
            try
            {
                // TODO: Add insert logic here
                NormaComponent normaComponent = new NormaComponent();
                if (normaComponent.Create(norma)==null)
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

        // GET: Norma/Edit/5
        public ActionResult Edit(int id)
        {
            NormaComponent normaComponent = new NormaComponent();
            return View(normaComponent.ReadBy(id));
        }
        public ActionResult ErrorPage()
        {
            return View();
        }

        // POST: Norma/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection,Norma norma)
        {
            try
            {
                // TODO: Add update logic here
                NormaComponent normaComponent = new NormaComponent();
                norma.Id = id;
                normaComponent.Update(norma);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Norma/Delete/5
        public ActionResult Delete(int id)
        {
            NormaComponent normaComponent = new NormaComponent();
            return View(normaComponent.ReadBy(id));
        }

        // POST: Norma/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                NormaComponent normaComponent = new NormaComponent();
                normaComponent.Delete(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
