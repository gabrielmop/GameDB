using GameDB.Models.Consoles;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Services.Interfaces.Consoles
{
    public interface IPS4Service
    {
        public Ps4 AdicionarJogo(Ps4 ps4);
        public void EditarJogo(Ps4 ps4);
        public void ApagarJogo(Ps4 ps4);
        public Ps4 ProcurarJogo(int id);
        public List<Ps4Lista> ListarJogo(bool incluiPS5);
        public void EditarParcialmente(JsonPatchDocument patch, Ps4 ps4);

    }
}
