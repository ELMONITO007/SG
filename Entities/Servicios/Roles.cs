using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Roles :EntityBase
    {
        public override int Id { get; set; }
        public string name { get; set; }
    
        public string tipo { get; set; }
    }
}
