using System;
using System.Collections.Generic;

namespace GameDB.Models
{
    public partial class Plataforma
    {
        public Plataforma()
        {
            Ps3s = new HashSet<Ps3>();
            Ps4s = new HashSet<Ps4>();
        }

        public int PlataformaId { get; set; }
        public string? Marca { get; set; }
        public string? Console { get; set; }

        public virtual ICollection<Ps3>? Ps3s { get; set; }
        public virtual ICollection<Ps4>? Ps4s { get; set; }
    }
}
