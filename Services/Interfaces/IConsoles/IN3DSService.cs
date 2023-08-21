using GameDB.Models.Consoles;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Services.Interfaces.Console
{
    public interface IN3DSService
    {
        public N3DS AdicionarJogo(N3DS N3DS);
        public void EditarJogo(N3DS N3DS);
        public void ApagarJogo(N3DS N3DS);
        public N3DS ProcurarJogo(int id);
        public List<N3DSLista> ListarJogo();
        public void EditarParcialmente(JsonPatchDocument patch, N3DS N3DS);
    }
}
