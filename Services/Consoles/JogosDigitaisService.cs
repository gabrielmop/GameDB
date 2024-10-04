using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using GameDB.Services.Interfaces.Consoles;


namespace GameDB.Services.Consoles
{
    public class JogosDigitaisService : IJogosDigitaisService
    {
        private readonly IJogosDigitaisRepository Repositorio;

        public JogosDigitaisService(IJogosDigitaisRepository repositorio)
        {
            Repositorio = repositorio;
        }

        public JogosDigitais CadastrarJogoDigital(JogosDigitais jd)
        {
            Repositorio.CadastrarJogoDigital(jd);
            return jd;
        }

        public void ApagarJogoDigital(JogosDigitais jd)
        {
            Repositorio.ApagarJogoDigital(jd);
        }

        public void AlterarJogoDigital(JogosDigitais jd)
        {
            Repositorio.AlterarJogoDigital(jd);
        }

        public void AlterarParcialmenteJogoDigital(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {
           Repositorio.AlterarParcialmenteJogoDigital(Coluna, ValorColuna, Busca, BuscaValor);
        }

        public List<JogosDigitaisLista> ListarJogosDigitais()
        {
            var result = Repositorio.ListarJogosDigitais();
            return result;
        }

        public JogosDigitais BuscarJogoDigital(int id)
        {
            var busca = Repositorio.BuscarJogoDigital(id);
            return busca;
        }
    }

}


