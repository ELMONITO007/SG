using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Entities;
using Evaluaciones_Tecnicas.Filter;
using Negocio;

namespace TrabajoConTensionV2.Controllers.Servicios
{
    public class UsuarioController : Controller
    {
        // GET: Usuario
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Index()
        {
            UsuariosComponent usuariosComponent = new UsuariosComponent();


            return View(usuariosComponent.Read());
        }



        // GET: Usuario/Create
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Create()
        {

            ViewBag.sector = new List<string>() { "TCT_Laboratorio", "Tecnico" };

            return View();
        }

        // POST: Usuario/Create
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        [HttpPost]
        public ActionResult Create(FormCollection collection,Usuarios usuario)
        {
            try
            {
                UsuariosComponent usuariosComponent=new UsuariosComponent();
                usuariosComponent.Crear(usuario);
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Usuario/Edit/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Edit(int id)
        {
            UsuariosComponent usuariosComponent = new UsuariosComponent();


            return View(usuariosComponent.ReadBy(id));
        }



        // POST: Usuario/Edit/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection,Usuarios usuario)
        {
            try
            {
                // TODO: Add update logic here
                UsuariosComponent usuariosComponent = new UsuariosComponent();
                usuariosComponent.update(usuario);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Usuario/Delete/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Delete(int id)
        {
            UsuariosComponent usuariosComponent = new UsuariosComponent();


            return View(usuariosComponent.ReadBy(id));
        }

        // POST: Usuario/Delete/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                UsuariosComponent usuariosComponent = new UsuariosComponent();
                usuariosComponent.Delete(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
