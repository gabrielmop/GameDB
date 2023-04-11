using GameDB.Models;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Repository.Interface
{
    public interface IN3DSRepository
    {
        public N3DS AdicionarJogo(N3DS N3DS);
        public void EditarJogo(N3DS N3DS);
        public void ApagarJogo(N3DS N3DS);
        public N3DS ProcurarJogo(int id);
        public List<N3DSLista> ListarJogo();
        public void EditarParcialmente(JsonPatchDocument patch, N3DS N3DS);
    }
}
