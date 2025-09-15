using GameDB.Models.Consoles;


namespace GameDB.Repository.Interface.Consoles
{
    public interface IXoneRepository
    {
        public Xone CadastrarJogoXboxOne(Xone PS4);
        public void AlterarJogoXboxOne(Xone PS4);
        public void ApagarJogoXboxOne(Xone PS4);
        public Xone BuscarJogoXboxOne(int id);
        public List<XoneLista> ListarJogosXboxOne();
        public void AlterarParcialmenteJogoXboxOne(string Coluna, string ValorColuna, string Busca, string BuscaValor);
    }
}
