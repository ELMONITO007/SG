using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Usuarios :EntityBase
    {
		public override int Id { get; set; }
		public string UserName { get; set; }
		public string Email { get; set; }
		public string Password { get; set; }

		public bool Bloqueado { get; set; }
		public int CantidadIntentos { get; set; }
		public string Nombre { get; set; }
		public string Apellido { get; set; }
		public string Tipo { get; set; }

	}
}
