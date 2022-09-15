using Bussiness;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TrabajoConTension.Controllers
{
    public class ProtocoloController : Controller
    {
        // GET: Protocolo

        public ActionResult Index(int id)
        {
            ProtocoloComponent protocoloComponent = new ProtocoloComponent();
            return View(protocoloComponent.ReadBy(id));
        }

        // GET: Protocolo/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }
        public ActionResult QrError(int id)
        {
            ProtocoloComponent protocoloComponent = new ProtocoloComponent();
            return View(protocoloComponent.ReadBy(id));
        }
        public ActionResult Qr(int id)
        {
            ProtocoloComponent protocoloComponent=new ProtocoloComponent(); 
            return View(protocoloComponent.ReadBy(id));
        }
        // GET: Protocolo/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Protocolo/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Protocolo/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Protocolo/Edit/5
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

        // GET: Protocolo/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Protocolo/Delete/5
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
    }
}
