
using Entities;

using Negocio;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class LoginComponent
    {
        public bool VerificarBloqueado(int id)
        {
            UsuariosComponent usuariosComponent = new UsuariosComponent();
            Usuarios usuarioTabla = new Usuarios();
            usuarioTabla = usuariosComponent.ReadBy(id);
            if (usuarioTabla.Bloqueado)
            {
                return false;
            }
            else
            {

                return true;
            }
        }
        public void VerificarIntentos(int id)
        {
            UsuariosComponent usuariosComponent = new UsuariosComponent();
            Usuarios usuarioTabla = new Usuarios();
            usuarioTabla = usuariosComponent.ReadBy(id);
            if (usuarioTabla.CantidadIntentos >= 4)
            {
                usuariosComponent.Bloquear(id);
            }

        }






        public bool VeriricarUserName(Usuarios usuarios)
        {
            UsuariosComponent usuariosComponent = new UsuariosComponent();
            Usuarios usuarioTabla = new Usuarios();
            usuarioTabla = usuariosComponent.ReadByEmail(usuarios.Email);
            if (usuarioTabla is null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }



        public bool VerificarContraseña(int id, Usuarios usuarios)
        {
            UsuariosComponent usuariosComponent = new UsuariosComponent();
            Usuarios usuarioTabla = new Usuarios();
            usuarioTabla = usuariosComponent.ReadBy(id);
            EncriptarSHA256 encriptarSHA256 = new EncriptarSHA256(usuarios.Password);
            string pass = encriptarSHA256.Hashear();
            if (usuarioTabla.Password == pass)
            {
                return true;
            }
            else
            {
                return false;
            }

        }


        public LoginError VerificarLogin(Usuarios usuarios)

        {

            bool userName = VeriricarUserName(usuarios);
            LoginError loginError = new LoginError();
            if (userName)
            {
                UsuariosComponent usuariosComponent = new UsuariosComponent();
                Usuarios usuarioTabla = new Usuarios();

                usuarioTabla = usuariosComponent.ReadByEmail(usuarios.Email);
                bool password = VerificarContraseña(usuarioTabla.Id, usuarios);
                VerificarIntentos(usuarioTabla.Id);
                if (password)
                {

                    if (VerificarBloqueado(usuarioTabla.Id))
                    {

                        loginError.error = "";
                        usuariosComponent.ResetearIntentos(usuarioTabla.Id);
                    }
                    else
                    {
                        loginError.error = "La cuenta esta Bloqueada ";

                    }
                }

                else
                {
                    loginError.error = "Usuario o Contraseña Invalido";

                }

            }

            else
            {
                loginError.error = "Usuario o Contraseña Invalido";

            }

            return loginError;
        }

    }
}
