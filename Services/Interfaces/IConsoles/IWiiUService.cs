using GameDB.Models.Consoles;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Services.Interfaces.Consoles
{
    public interface IWiiUService
    {
        public WiiU AdicionarJogo(WiiU wu);
        public void EditarJogo(WiiU wu);
        public void ApagarJogo(WiiU wu);
        public WiiU ProcurarJogo(int id);
        public List<WiiULista> ListarJogo();
        public void EditarParcialmente(JsonPatchDocument patch, WiiU wu);


    }
}
