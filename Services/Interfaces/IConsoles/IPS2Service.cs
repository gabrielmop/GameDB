using GameDB.Models.Consoles;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Services.Interfaces.Consoles
{
    public interface IPS2Service
    {
        public Ps2 AdicionarJogo(Ps2 ps2);
        public void EditarJogo(Ps2 ps2);
        public void ApagarJogo(Ps2 ps3ps2);
        public Ps2 ProcurarJogo(int id);
        public List<Ps2Lista> ListarJogo();
        public void EditarParcialmente(JsonPatchDocument patch, Ps2 ps2);


    }
}
