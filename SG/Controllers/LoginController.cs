using Entities;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SG.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public ActionResult Index(Usuarios usuarios)
        {
          
            

                LoginComponent loginComponent = new LoginComponent();
                LoginError loginError = new LoginError();
                loginError = loginComponent.VerificarLogin(usuarios);

                if (loginError.error == "")
                {


                    UsuariosComponent usuariosComponent = new UsuariosComponent();
                    Session["UserName"] = usuariosComponent.ReadByEmail(usuarios.Email);
                    Usuarios unUsuario = new Usuarios();
                    unUsuario = usuariosComponent.ReadByEmail(usuarios.Email);
                    UsuarioRolesComponent usuarioRolesComponent = new UsuarioRolesComponent();
                    string pagina = "";
                    string primera = "";

                    foreach (UsuarioRoles item in usuarioRolesComponent.obtenerRolesDisponiblesDelUsuario(unUsuario.Id))
                    {

                            pagina = item.roles.name;
                        




                    }
                    #region Layout
                    string permiso;
                    if (pagina == "Laboratorio")
                    {

                        Session["Layout"] = "_Layout";
                    }
                    if (pagina == "Tecnico")
                    {
                        Session["Layout"] = "_LayoutTecnico";
                    }
                    
                    #endregion
                    #region Error
                    ViewBag.ErrorLogin = loginError.error;
                    return RedirectToAction(pagina, "Admin");
                }
                else
                {
                    ViewBag.ErrorLogin = loginError.error;

                    return View("index");
                }
                #endregion

            }

        

      
    }
}
