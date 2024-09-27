using GameDB.Models.Consoles;


namespace GameDB.Repository.Interface.Consoles
{
    public interface IPS4Repository
    {
        public PS4 CadastrarJogoPS4(PS4 PS4);
        public void AlterarJogoPS4(PS4 PS4);
        public void ApagarJogoPS4(PS4 PS4);
        public PS4 BuscarJogoPS4(int id);
        public List<PS4Lista> ListarJogosPS4();
        public void AlterarParcialmenteJogoPS4(string Coluna, string ValorColuna, string Busca, string BuscaValor);
    }
}
