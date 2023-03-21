using GameDB.Models;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Interface
{
    public interface IPS3Service
    {
        public Ps3 AdicionarJogo(Ps3 ps3);
        public void EditarJogo(Ps3 ps3);
        public List<PS3Lista> ListarJogo();
        public void EditarParcialmente(JsonPatchDocument patch, Ps3 ps3);
    }
}
