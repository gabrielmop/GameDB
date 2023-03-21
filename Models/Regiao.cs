using System;
using System.Collections.Generic;

namespace GameDB.Models
{
    public partial class Regiao
    {
        public Regiao()
        {
            Ps3s = new HashSet<Ps3>();
            Ps4s = new HashSet<Ps4>();
        }

        public int RegiaoId { get; set; }
        public string? RegiaoNome { get; set; }

        public virtual ICollection<Ps3>? Ps3s { get; set; }
        public virtual ICollection<Ps4>? Ps4s { get; set; }
    }
}
