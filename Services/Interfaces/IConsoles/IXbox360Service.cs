using GameDB.Models.Consoles;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Services.Interfaces.Consoles
{
    public interface IXbox360Service
    {
        public Xbox360 AdicionarJogo(Xbox360 ps3);
        public void EditarJogo(Xbox360 ps3);
        public void ApagarJogo(Xbox360 ps3);
        public Xbox360 ProcurarJogo(int id);
        public List<Xbox360Lista> ListarJogo();
        public void EditarParcialmente(JsonPatchDocument patch, Xbox360 ps3);


    }
}
