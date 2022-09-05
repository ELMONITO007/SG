using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bussiness;
using Entities;
namespace SG.Controllers
{
    public class ItemNormaController : Controller
    {
        // GET: ItemNorma
    


        // GET: ItemNorma/Create
        public ActionResult Create(int id_norma)
        {
            ItemNorma itemNorma = new ItemNorma();
            itemNorma.Id = id_norma;
           
            return View(itemNorma);
        }

        // POST: ItemNorma/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection,ItemNorma itemNorma)
        {
            try
            {
                int id = itemNorma.Id;
                // TODO: Add insert logic here
                ItemNormaComponent itemNormaComponent = new ItemNormaComponent();
                if (itemNormaComponent.Create(itemNorma, itemNorma.Id)==null) 
                {
                    return RedirectToAction("ErrorPage");
                }
                else
                {
                    return RedirectToAction("details", "Norma", new { id=id});

                }
            }
            catch
            {
                return View();
            }
        }
        public ActionResult ErrorPage()
        {
            return View();
        }
        // GET: ItemNorma/Edit/5
        public ActionResult Edit(int id)
        {
            ItemNormaComponent itemNorma = new ItemNormaComponent();

            return View(itemNorma.ReadBy(id));
        }

        // POST: ItemNorma/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection,ItemNorma itemNorma)
        {
            try
            {
                // TODO: Add update logic here
                ItemNormaComponent itemNormaComponent = new ItemNormaComponent();
                itemNormaComponent.Update(itemNorma);
                return RedirectToAction("index", "norma");
            }
            catch
            {
                return View();
            }
        }

        // GET: ItemNorma/Delete/5
        public ActionResult Delete(int id)
        {
            ItemNormaComponent itemNorma = new ItemNormaComponent();

            return View(itemNorma.ReadBy(id));
        }

        // POST: ItemNorma/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                ItemNormaComponent itemNorma = new ItemNormaComponent();
                itemNorma.delete(id);
                return RedirectToAction("index","norma");
            }
            catch
            {
                return View();
            }
        }
    }
}
