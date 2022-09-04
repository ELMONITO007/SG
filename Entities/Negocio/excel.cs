using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class excel
    {
        public string nombreHoja { get; set; }

        public List<string> filas = new List<string>();
        public List<string> ListaFilas =new List<string>();

        public List<excel> lista =new List<excel>();

        public excel()
        {
        }
    }
}
