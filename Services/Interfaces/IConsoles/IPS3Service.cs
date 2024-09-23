using GameDB.Models.Consoles;

namespace GameDB.Services.Interfaces.Consoles
{
    public interface IPS3Service
    {
        public Ps3 AdicionarJogo(Ps3 ps3);
        public void EditarJogo(Ps3 ps3);
        public void ApagarJogo(Ps3 ps3);
        public Ps3 ProcurarJogo(int id);
        public List<Ps3Lista> ListarJogo();
        public void EdtiarParcialmente(string Tabela, string Coluna, string ValorColuna, string Busca, string BuscaValor);


    }
}
