using GameDB.Models.Consoles;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace GameDB.Repository.Interface.Consoles
{
    public interface IPs3Repository
    {
        public Ps3 AdicionarJogo(Ps3 ps3);
        public void EditarJogo(Ps3 ps3);
        public void ApagarJogo(Ps3 ps3);
        public Ps3 ProcurarJogo(int id);
        public List<Ps3Lista> ListarJogo();
        public void EditarParcialmente(JsonPatchDocument<Ps3> patch, Ps3 ps3);
        public void EdtiarParcialmenteTeste(string Tabela, string Coluna, string ValorColuna, string Busca, string BuscaValor);
    }
}
