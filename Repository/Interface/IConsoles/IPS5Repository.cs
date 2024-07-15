using GameDB.Models.Consoles;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Repository.Interface.Consoles
{
    public interface IPS5Repository
    {

        public PS5 AdicionarJogo(PS5 ps5);
        public void EditarJogo(PS5 ps5);
        public void ApagarJogo(PS5 ps5);
        public PS5 ProcurarJogo(int id);
        public List<PS5Lista> ListarJogo();
        public void EditarParcialmente(JsonPatchDocument patch, PS5 ps5);
    }
}
