using GameDB.Models.Consoles;
using System;
using System.Collections.Generic;

namespace GameDB.Models.Structure
{
    public partial class Plataforma
    {
        public int PlataformaId { get; set; }
        public string? Marca { get; set; }
        public string? Console { get; set; }

        public virtual ICollection<N3DS>? N3ds { get; set; }
        public virtual ICollection<Ps2>? ps2s { get; set; }
        public virtual ICollection<Ps3> ps3s { get; set; }
        public virtual ICollection<Ps4> ps4s { get; set; }
        public virtual ICollection<PS5> PS5s { get; set; }
        public virtual ICollection<WiiU> WiiUs { get; set; }
        public virtual ICollection<Xbox360> Xbox360s { get; set; }


    }
}
