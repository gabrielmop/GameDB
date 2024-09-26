using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using GameDB.Services.Interfaces.Consoles;


namespace GameDB.Services.Consoles
{
    public class PS3Serivce : IPS3Service
    {
        private readonly IPS3Repository Repositorio;

        public PS3Serivce(IPS3Repository repositorio)
        {
            Repositorio = repositorio;
        }

        public PS3 CadastrarJogoPS3(PS3 ps3)
        {
            Repositorio.CadastrarJogoPS3(ps3);
            return ps3;
        }

        public void ApagarJogoPS3(PS3 ps3)
        {
            Repositorio.ApagarJogoPS3(ps3);
        }

        public void AlterarJogoPS3(PS3 ps3)
        {
            Repositorio.AlterarJogoPS3(ps3);
        }

        public void AlterarParcialmenteJogoPS3(string Coluna, string ValorColuna, string Busca, string BuscaValor)
        {
           Repositorio.AlterarParcialmenteJogoPS3(Coluna, ValorColuna, Busca, BuscaValor);
        }

        public List<PS3Lista> ListarJogosPS3()
        {
            var result = Repositorio.ListarJogosPS3();
            foreach (var item in result)
            {
                if (item.Preco == "R$ 0,00")
                {
                    if (item.Notas.Contains("Guitarra"))
                    {
                        item.Preco = "Bundle com a Guitarra";
                    }
                    else

                        item.Preco = "Presente";
                }
            }
            return result;
        }

        public PS3 BuscarJogoPS3(int id)
        {
            var busca = Repositorio.BuscarJogoPS3(id);
            return busca;
        }
    }

}


