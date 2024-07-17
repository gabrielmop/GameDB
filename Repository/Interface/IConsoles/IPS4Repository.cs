using GameDB.Models.Consoles;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Repository.Interface.Consoles
{
    public interface IPS4Repository
    {

        public Ps4 AdicionarJogo(Ps4 ps4);
        public void EditarJogo(Ps4 ps4);
        public void ApagarJogo(Ps4 ps4);
        public Ps4 ProcurarJogo(int id);
        public List<Ps4Lista> ListarJogo();
        public void EdtiarParcialmente(string Tabela, string Coluna, string ValorColuna, string Busca, string BuscaValor);
    }
}
