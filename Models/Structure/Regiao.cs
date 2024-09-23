using GameDB.Models.Consoles;

namespace GameDB.Models.Structure
{
    public partial class Regioes
    {

        public int RegiaoId { get; set; }
        public string? Sigla { get; set; }
        public string? Regiao {  get; set; }

        public virtual ICollection<N3DS>? N3ds { get; set; }
        public virtual ICollection<Ps2>? ps2s { get; set; }
        public virtual ICollection<PS5>? PS5s { get; set; }
        public virtual ICollection<WiiU>? WiiUs { get; set; }
        public virtual ICollection<Xbox360>? Xbox360s { get; set; }

    }
}
