using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Negocio;
using Entities;
using Evaluaciones_Tecnicas.Filter;


namespace TrabajoConTension.Controllers
{
    public class LaboratorioController : Controller
    {



        // GET: Laboratorio
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Index()
        {
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();

            return View(laboratorioComponent.Read());
        }


        // GET: Laboratorio/Create/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Create()
        {

            return View();
        }


        // POST: Laboratorio/Create/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
                Laboratorio laboratorio = new Laboratorio();
                laboratorio.nombre = collection.Get("nombre");
                laboratorio.piePagina = collection.Get("piePagina");
                laboratorioComponent.Create(laboratorio);

                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                return View();
            }
        }


        // GET: Laboratorio/Edit/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult Edit(int id)
        {
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            return View(laboratorioComponent.ReadBy(id));
        }

        // POST: Laboratorio/Edit/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
                Laboratorio laboratorio = new Laboratorio();
                laboratorio.Id = id;
                laboratorio.nombre = collection.Get("nombre");
                laboratorio.piePagina = collection.Get("piePagina");
                laboratorioComponent.Update(laboratorio);

                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                return View();
            }
        }
        // GET: Laboratorio/Edit/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult delete(int id, int Usuario)
        {
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            UsuariosComponent usuariosComponent = new UsuariosComponent();

            List<Usuarios> usuarios = new List<Usuarios>();
            Usuarios usuario = new Usuarios();
            usuario = usuariosComponent.ReadBy(Usuario);
            usuarios.Add(usuario);


            Laboratorio a = new Laboratorio();


            Laboratorio laboratorio = new Laboratorio(usuarios);
            a = laboratorioComponent.ReadBy(id);
            laboratorio.Id = a.Id;

            laboratorio.nombre = a.nombre;
            laboratorio.piePagina = a.piePagina;

            return View(laboratorio);
        }


        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult ensayistas(int id)
        {
            Laboratorio l = new Laboratorio();
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            l = laboratorioComponent.ReadBy(id);
            UsuariosComponent usuariosComponent = new UsuariosComponent();

            Laboratorio laboratorio = new Laboratorio(usuariosComponent.ReadbyUsuariosDeUnLaboratorio(id));

            laboratorio.nombre = l.nombre;
            laboratorio.piePagina = l.piePagina;
            laboratorio.Id = id;

            return View(laboratorio);
        }


        // POST: Laboratorio/Delete/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        [HttpPost]
        public ActionResult ensayistas(int id, FormCollection collection, string Usuario)
        {
            try
            {
                // TODO: Add delete logic here


                return RedirectToAction("AgregarUsuario", new { id = id });
            }
            catch
            {
                return View();
            }
        }

        // GET: Laboratorio/Delete/5
        [AuthorizerUser(_roles: "TCT_Laboratorio")]
        public ActionResult AgregarUsuario(int id)
        {
            UsuariosComponent usuariosComponent = new UsuariosComponent();

            Laboratorio l = new Laboratorio();
            LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
            l = laboratorioComponent.ReadBy(id);

            Laboratorio laboratorio = new Laboratorio(usuariosComponent.ReadbyUsuariosLaboratorioDisponible(id));

            laboratorio.nombre = l.nombre;
            laboratorio.piePagina = l.piePagina;
            laboratorio.Id = id;

            return View(laboratorio);
        }
        // POST: Laboratorio/Delete/5
        //[AuthorizerUser(_roles: "TCT_Laboratorio")]
        //[HttpPost]
        //public ActionResult AgregarUsuario(int id, FormCollection collection, string Usuario)
        //{
        //    try
        //    {
        //        // TODO: Add delete logic here
        //        Usuarios usuarios = new Usuarios();

        //        LaboratorioComponent laboratorioComponent = new LaboratorioComponent();
        //        laboratorioComponent.CreateLaboratorioUsuario(id, int.Parse(Usuario));

        //        return RedirectToAction("ensayistas", new { id = id });
        //    }
        //    catch (Exception e)
        //    {
        //        return View();
        //    }
        //}

    }
}
