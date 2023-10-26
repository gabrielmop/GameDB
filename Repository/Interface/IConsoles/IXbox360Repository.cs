using GameDB.Models.Consoles;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Repository.Interface.Consoles
{
    public interface IXbox360Repository
    {
        public Xbox360 AdicionarJogo(Xbox360 x360);
        public void EditarJogo(Xbox360 x360);
        public void ApagarJogo(Xbox360 x360);
        public Xbox360 ProcurarJogo(int id);
        public List<Xbox360Lista> ListarJogo();
        public void EditarParcialmente(JsonPatchDocument patch, Xbox360 x360);
    }
}
