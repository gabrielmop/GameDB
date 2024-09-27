using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using GameDB.Services.Interfaces.Consoles;


namespace GameDB.Services.Consoles
{
    public class PS4Service : IPS4Service
    {
        private readonly IPS4Repository Repositorio;

        public PS4Service(IPS4Repository repositorio)
        {
            Repositorio = repositorio;
        }

        public PS4 CadastrarJogoPS4(PS4 ps4)
        {
            Repositorio.CadastrarJogoPS4(ps4);
            return ps4;
        }

        public void ApagarJogoPS4(PS4 ps4)
        {
            Repositorio.CadastrarJogoPS4(ps4);
        }

        public void AlterarJogoPS4(PS4 ps4)
        {
            Repositorio.AlterarJogoPS4(ps4);
        }

        public void AlterarParcialmenteJogoPS4(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {
           Repositorio.AlterarParcialmenteJogoPS4(Coluna, ValorColuna, Busca, BuscaValor);
        }

        public List<PS4Lista> ListarJogosPS4()
        {
            var result = Repositorio.ListarJogosPS4();
            foreach (var item in result)
            {
                if (item.Preco == "R$ 0,00")
                {
                    if (item.Notas.Contains("videogame"))
                    {
                        item.Preco = "Bundle com o videogame";
                    }
                    else

                        item.Preco = "Presente";
                }
            }
            return result;
        }

        public PS4 BuscarJogoPS4(int id)
        {
            var busca = Repositorio.BuscarJogoPS4(id);
            return busca;
        }
    }

}


