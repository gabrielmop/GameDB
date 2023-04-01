using GameDB.Models;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Services.Interfaces
{
    public interface IPS3Service
    {
        public Ps3 AdicionarJogo(Ps3 ps3);
        public void EditarJogo(Ps3 ps3);
        public void ApagarJogo(Ps3 ps3);
        public Ps3 ProcurarJogo(int id);
        public List<PS3Lista> ListarJogo();
        public void EditarParcialmente(JsonPatchDocument patch, Ps3 ps3);


    }
}
