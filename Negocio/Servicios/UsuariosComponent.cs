using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Entities;


namespace Negocio
{

    public class UsuariosComponent : Component<Usuarios>
    {
       
      
            public void ResetearIntentos(int id)
        {
            var usuario = new UsuarioDac();
            usuario.AgregarErrorUsryPass(0, id);
        }

        public void DeleteTotal(int id)
        {
            UsuarioDac usuarioDac = new UsuarioDac();
            usuarioDac.DeleteTotal(id);
        }
            #region Crear

            public bool Verificar(string userName)
        {
            Usuarios usuarios = new Usuarios();
            UsuarioDac usuarioDac = new UsuarioDac();
            usuarios = usuarioDac.ReadByEmail(userName);
            if (usuarios is null)
            {
                return true;
            }
            else
            {
                return false;
            }

        }


        public void CambiarContraseña(Usuarios objeto)

        {


            UsuarioParcial usuariosFormateado = new UsuarioParcial();
            EncriptarSHA256 encriptarSHA256 = new EncriptarSHA256(objeto.Password);
            string pas = encriptarSHA256.Hashear();
            Usuarios usuarios = new Usuarios();
            usuarios = ReadBy(objeto.Id);
            usuariosFormateado.Email = usuarios.Email;
            usuariosFormateado.UserName = usuarios.UserName;
            usuariosFormateado.Password = objeto.Password;
          

            usuarios.Password = pas;
            UsuarioDac usuarioDac = new UsuarioDac();
            usuarioDac.Update(usuarios);
       
         

        }

        public bool Crear(Usuarios objeto)
        {
            Usuarios usuarios = new Usuarios();

            UsuarioParcial usuariosFormateado = new UsuarioParcial();


            usuariosFormateado.Email = objeto.Email;
            usuariosFormateado.UserName = objeto.UserName;
            usuariosFormateado.Password = objeto.Password;

            if (Verificar(objeto.UserName))
            {
                usuarios = objeto;
              
                EncriptarSHA256 encriptarSHA256 = new EncriptarSHA256(objeto.Password);
                usuarios.Password = encriptarSHA256.Hashear();
                UsuarioDac usuarioDac = new UsuarioDac();

                usuarioDac.Create(usuarios);

                UsuarioRoles unUsuario = new UsuarioRoles();
                unUsuario.usuarios = usuarioDac.ReadByEmail(objeto.Email);

                RolesComponent rolesComponent = new RolesComponent();

                UsuarioRolesComponent usuarioRolesComponent = new UsuarioRolesComponent();
                unUsuario.roles = rolesComponent.ReadByNombreRol(objeto.unRol.name);
                usuarioRolesComponent.Create(unUsuario);



                return true;
            }
            else
            {
                return false;
            }
        }




        #endregion
        public int AgregarErrorUsryPass(int id)

        {

            var usuario = new UsuarioDac();
            Entities.Usuarios unUsuario = new Usuarios();
            unUsuario = usuario.ReadBy(id);

            usuario.AgregarErrorUsryPass(unUsuario.CantidadIntentos + 1, id);


            return unUsuario.CantidadIntentos + 1;

        }
        public void Bloquear(int id)
        {
            var usuario = new UsuarioDac();

            usuario.Bloquear(id);
        }
        public void Desloquear(int id)
        {
            var usuario = new UsuarioDac();
            usuario.AgregarErrorUsryPass(0, id);
            usuario.Desbloquear(id);


        }
        public override void Delete(int id)
        {
            var usuario = new UsuarioDac();
            usuario.Delete(id);
        }

        public override List<Usuarios> Read()
        {
            List<Usuarios> result =  new List<Usuarios>();
            var usuario = new UsuarioDac();
            foreach (var item in usuario.Read())
            {
                UsuarioRolesComponent usuarioRoles = new UsuarioRolesComponent();
                foreach (var rol in usuarioRoles.ReadByUsuario(item.Id))
                {
                    item.roles.Add(
                        rol.roles);
                }
                result.Add(item);
            }
            
            return result;
        }
      
        public override Usuarios ReadBy(int id)
        {
            Usuarios result = default(Usuarios);
            var usuario = new UsuarioDac();
            result = usuario.ReadBy(id);

            UsuarioRolesComponent usuarioRoles = new UsuarioRolesComponent();
            foreach (var item in usuarioRoles.ReadByUsuario(id))
            {
                result.roles.Add(item.roles);
            }
        

            return result;
        }



        public Usuarios update(Usuarios objeto)
        {
            UsuarioDac usuarioDac = new UsuarioDac();
            return usuarioDac.update(objeto);


        }

        public Usuarios ReadByEmail(string emailUsername)
        {
            UsuarioDac usuarioDac = new UsuarioDac();
            return usuarioDac.ReadByEmail(emailUsername);
        }

      
        public override Usuarios Create(Usuarios objeto)
        {
            throw new NotImplementedException();
        }
        #region LaboratorioUsuario
        public List<Usuarios> ReadbyUsuariosLaboratorioDisponible(int id_Laboratorio)

        {
            UsuarioDac usuarioDac = new UsuarioDac();
            List<Usuarios> usuarioLaboratorio = new List<Usuarios>();
            usuarioLaboratorio = ReadbyUsuariosDeUnLaboratorio(id_Laboratorio);
            List<Usuarios> todosUsuariosLaboratorio = new List<Usuarios>();

            todosUsuariosLaboratorio = usuarioDac.ReadByTipoRol("Laboratorio");
            List<Usuarios> result = new List<Usuarios>();

            foreach (Usuarios item in todosUsuariosLaboratorio)
            {
                int a = 0;

                foreach (var subItem in usuarioLaboratorio)
                {
                    if (subItem.Id == item.Id)
                    {
                        a = 1;
                    }

                }
                if (a == 0)
                {
                    result.Add(item);
                }



            }



            return result;
        }

        public List<Usuarios> ReadbyUsuariosDeUnLaboratorio(int rol)
        {

            UsuarioDac usuarioDac = new UsuarioDac();

            return usuarioDac.ReadbyUsuariosDeUnLaboratorio(rol);
        }

        public override void Update(Usuarios objeto)
        {
            throw new NotImplementedException();
        }
        #endregion

    }
}
