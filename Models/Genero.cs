using System;
using System.Collections.Generic;

namespace GameDB.Models
{
    public partial class Genero
    {
       
        public int GeneroId { get; set; }
        public string GeneroNome { get; set; }

        public virtual ICollection<Ps3>? Ps3s { get; set; }
        public virtual ICollection<Ps4>? Ps4s { get; set; }
    }
}
