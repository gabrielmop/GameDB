using GameDB.Models.Consoles;


namespace GameDB.Repository.Interface.Consoles
{
    public interface IJogosDigitaisRepository
    {
        public JogosDigitais CadastrarJogoDigital(JogosDigitais jd);
        public void AlterarJogoDigital(JogosDigitais jd);
        public void ApagarJogoDigital(JogosDigitais jd);
        public JogosDigitais BuscarJogoDigital(int id);
        public List<JogosDigitaisLista> ListarJogosDigitais();
        public void AlterarParcialmenteJogoDigital(string Coluna, string ValorColuna, string Busca, string BuscaValor);
    }
}
