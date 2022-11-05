using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Business;

namespace Negocio
{
    public class OrdenTrabajoEstadoComponent
    {

        public OrdenTrabajoEstado Create(OrdenTrabajoEstado entity)


        {

            OrdenTrabajoEstadoDAC ordenTrabajoEstadoDAC = new OrdenTrabajoEstadoDAC();
            return ordenTrabajoEstadoDAC.Create(entity);


        }


        public OrdenTrabajoEstado EstadoActual(int id_orden)


        {
            OrdenTrabajoEstadoDAC ordenTrabajoEstadoDAC = new OrdenTrabajoEstadoDAC();


            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado();
            ordenTrabajoEstado = ordenTrabajoEstadoDAC.EstadoActual(id_orden);
            UsuariosComponent usuariosComponent = new UsuariosComponent();
            Usuarios usuario = new Usuarios();
            usuario = usuariosComponent.ReadBy(ordenTrabajoEstado.Usuarios.Id);
            EstadoOrdenEnsayo estadoOrdenEnsayo = new EstadoOrdenEnsayo();
            EstadoOrdenEnsayoComponent estadoOrdenEnsayoComponent = new EstadoOrdenEnsayoComponent();
            estadoOrdenEnsayo = estadoOrdenEnsayoComponent.ReadBy(ordenTrabajoEstado.EstadoOrdenEnsayo.Id);

            OrdenTrabajoEstado result = new OrdenTrabajoEstado(usuario, null, estadoOrdenEnsayo);
            result.Id = ordenTrabajoEstado.Id;
            result.estado = ordenTrabajoEstado.estado;
            result.observaciones = ordenTrabajoEstado.observaciones;

            result.fecha = ordenTrabajoEstado.fecha;
            result.ordenTrabajo = ordenTrabajoEstado.ordenTrabajo;
            result.Usuarios = ordenTrabajoEstado.Usuarios;
            return result;
        }

        public OrdenTrabajoEstado ReadBy(OrdenTrabajoEstado entity)

        {
            OrdenTrabajoEstadoDAC ordenTrabajoEstadoDAC = new OrdenTrabajoEstadoDAC();
            return ordenTrabajoEstadoDAC.ReadBy(entity);

        }
        public List<OrdenTrabajoEstado> ReadByOrden(int Orden)

        {
            TurnoComponent turnoComponent = new TurnoComponent();
            List<OrdenTrabajoEstado> result = new List<OrdenTrabajoEstado>();
            OrdenTrabajoEstadoDAC ordenTrabajoEstadoDAC = new OrdenTrabajoEstadoDAC();
            foreach (var item in ordenTrabajoEstadoDAC.ReadByOrden(Orden))
            {
                UsuariosComponent usuariosComponent = new UsuariosComponent();
                Usuarios usuario = new Usuarios();
                usuario = usuariosComponent.ReadBy(item.Usuarios.Id);

                EstadoOrdenEnsayo estadoOrdenEnsayo = new EstadoOrdenEnsayo();
                EstadoOrdenEnsayoComponent estadoOrdenEnsayoComponent = new EstadoOrdenEnsayoComponent();

                estadoOrdenEnsayo = estadoOrdenEnsayoComponent.ReadBy(item.EstadoOrdenEnsayo.Id);

                OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado(usuario, null, estadoOrdenEnsayo);
                ordenTrabajoEstado.observaciones = item.observaciones;
                ordenTrabajoEstado.Id = item.Id;
                ordenTrabajoEstado.fecha = turnoComponent.FormatearAFecha(item.fecha);
                ordenTrabajoEstado.ordenTrabajo = item.ordenTrabajo;
                ordenTrabajoEstado.Usuarios = item.Usuarios;

                result.Add(ordenTrabajoEstado);

            }



            return result;



        }

        public bool Verificar(OrdenTrabajoEstado entity)

        {
            if (ReadBy(entity) == null)
            {
                return true;
            }
            else
            {
                return false;
            }


        }


        #region estados
        private OrdenTrabajoEstado CrearEstado(OrdenTrabajo ordenEnsayo, int orden)

        {
            UsuariosComponent usuariosComponent = new UsuariosComponent();
            Usuarios usuarios = new Usuarios();
            usuarios = usuariosComponent.ReadBy(ordenEnsayo.Usuario.Id);
            EstadoOrdenEnsayoComponent estadoOrdenEnsayoComponent = new EstadoOrdenEnsayoComponent();

            EstadoOrdenEnsayo estadoOrdenEnsayo = new EstadoOrdenEnsayo();
            estadoOrdenEnsayo = estadoOrdenEnsayoComponent.ReadByEstadoOrdenl(orden);
            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado(usuarios, ordenEnsayo, estadoOrdenEnsayo);

            ordenTrabajoEstado.estado = estadoOrdenEnsayo.estadoFinal;
            ordenTrabajoEstado.fecha = Fechas.FormatearAAnsi(DateTime.Now.ToString("yyyy-MM-dd"));

            return ordenTrabajoEstado;
        }


        public OrdenTrabajoEstado EstadoCrearOE(OrdenTrabajo ordenEnsayo)

        {
            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado();

            ordenTrabajoEstado = CrearEstado(ordenEnsayo, 1);
            List<string> datos = Texto.SepararTextoPorCaracter('-', ordenTrabajoEstado.EstadoOrdenEnsayo.texto);

            ordenTrabajoEstado.observaciones = datos[0] + ordenTrabajoEstado.ordenTrabajo.Id + datos[1] + Fechas.FormatearAFecha(ordenTrabajoEstado.ordenTrabajo.Fecha) + datos[2] + ordenTrabajoEstado.Usuarios.UserName;


            return Create(ordenTrabajoEstado);

        }
        public OrdenTrabajoEstado EstadoAsignarTurno(OrdenTrabajo ordenEnsayo)

        {
            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado();
            TurnoComponent turnoComponent = new TurnoComponent();
            ordenEnsayo.Turno = turnoComponent.ReadByOrden(ordenEnsayo.Id);
            ordenTrabajoEstado = CrearEstado(ordenEnsayo, 2);
            List<string> datos = Texto.SepararTextoPorCaracter('-', ordenTrabajoEstado.EstadoOrdenEnsayo.texto);

            ordenTrabajoEstado.observaciones = ordenEnsayo.Usuario.UserName + datos[0] + ordenEnsayo.Turno.FechaRecepcionMateriales + datos[1] + ordenEnsayo.Turno.FechaFinDeEnsayo;


            Create(ordenTrabajoEstado);

            return EstadoActual(ordenEnsayo.Id);

        }
        public OrdenTrabajoEstado EstadoHerramientaEnviadas(OrdenTrabajo ordenEnsayo)

        {
            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado();
            TurnoComponent turnoComponent = new TurnoComponent();
            ordenEnsayo.Turno = turnoComponent.ReadByOrden(ordenEnsayo.Id);
            ordenTrabajoEstado = CrearEstado(ordenEnsayo, 3);
            List<string> datos = Texto.SepararTextoPorCaracter('-', ordenTrabajoEstado.EstadoOrdenEnsayo.texto);

            ordenTrabajoEstado.observaciones = datos[0]+ ordenEnsayo.Usuario.UserName + datos[1] + DateTime.Now.ToString("dd-mm-yyyy") + datos[2] + ordenEnsayo.TransporteRecepcion + datos[3]+ ordenEnsayo.GuiaRecepcion;


            Create(ordenTrabajoEstado);

            return EstadoActual(ordenEnsayo.Id);

        }
        public OrdenTrabajoEstado EstadoRecepcion(OrdenTrabajo ordenEnsayo)

        {
            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado();
          
            ordenTrabajoEstado = CrearEstado(ordenEnsayo, 4);
       

            ordenTrabajoEstado.observaciones = ordenEnsayo.Usuario.UserName + ordenTrabajoEstado.EstadoOrdenEnsayo.texto + DateTime.Now.ToString("dd-mm-yyyy") ;


            Create(ordenTrabajoEstado);

            return EstadoActual(ordenEnsayo.Id);

        }

        public OrdenTrabajoEstado EstadoConfirmarTurno(OrdenTrabajo ordenEnsayo)

        {
            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado();
            TurnoComponent turnoComponent = new TurnoComponent();
            ordenEnsayo.Turno = turnoComponent.ReadByOrden(ordenEnsayo.Id);
            ordenTrabajoEstado = CrearEstado(ordenEnsayo, 5);
            List<string> datos = Texto.SepararTextoPorCaracter('-', ordenTrabajoEstado.EstadoOrdenEnsayo.texto);

            ordenTrabajoEstado.observaciones = ordenEnsayo.Usuario.UserName+ datos[0] + ordenEnsayo.Turno.FechaComienzoDeEnsayo + datos[1]+ ordenEnsayo.Turno.FechaFinDeEnsayo;


            Create(ordenTrabajoEstado);

            return EstadoActual(ordenEnsayo.Id);

        }

        public OrdenTrabajoEstado EstadoEnsyar(OrdenTrabajo ordenEnsayo)

        {
            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado();
            TurnoComponent turnoComponent = new TurnoComponent();
            ordenEnsayo.Turno = turnoComponent.ReadByOrden(ordenEnsayo.Id);
            ordenTrabajoEstado = CrearEstado(ordenEnsayo, 6);
            List<string> datos = Texto.SepararTextoPorCaracter('-', ordenTrabajoEstado.EstadoOrdenEnsayo.texto);

            ordenTrabajoEstado.observaciones = ordenEnsayo.Usuario.UserName + datos[0] + ordenEnsayo.Turno.FechaComienzoDeEnsayo ;


            Create(ordenTrabajoEstado);

            return EstadoActual(ordenEnsayo.Id);

        }
        public OrdenTrabajoEstado EstadoRecepcionado(OrdenTrabajo ordenEnsayo)

        {
            OrdenTrabajoEstado ordenTrabajoEstado = new OrdenTrabajoEstado();
            TurnoComponent turnoComponent = new TurnoComponent();
            ordenEnsayo.Turno = turnoComponent.ReadByOrden(ordenEnsayo.Id);
            ordenTrabajoEstado = CrearEstado(ordenEnsayo, 8);
            List<string> datos = Texto.SepararTextoPorCaracter('-', ordenTrabajoEstado.EstadoOrdenEnsayo.texto);

            ordenTrabajoEstado.observaciones = datos[0]+ ordenEnsayo.Usuario.UserName + datos[0] +" "+ DateTime.Now.ToString("dd-MM-yyyy");


            Create(ordenTrabajoEstado);

            return EstadoActual(ordenEnsayo.Id);

        }
        #endregion
    }
}
