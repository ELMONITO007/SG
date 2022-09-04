using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
namespace Business
{
    public class EstadoOrdenEnsayoComponent
    {
        public EstadoOrdenEnsayo ReadByEstadoFinal(string EstadoFinal)

        {
            EstadoOrdenEnsayoDAC estadoOrdenEnsayo = new EstadoOrdenEnsayoDAC();
            return estadoOrdenEnsayo.ReadByEstadoFinal(EstadoFinal);


        }
        public EstadoOrdenEnsayo ReadByEstadoOrdenl(int orden)

        {
            EstadoOrdenEnsayoDAC estadoOrdenEnsayo = new EstadoOrdenEnsayoDAC();
            return estadoOrdenEnsayo.ReadByEstadoOrdenl(orden);


        }
        public EstadoOrdenEnsayo ReadBy(int id)

        {
            EstadoOrdenEnsayoDAC estadoOrdenEnsayo = new EstadoOrdenEnsayoDAC();
            return estadoOrdenEnsayo.ReadBy(id);


        }
   
    }
}
