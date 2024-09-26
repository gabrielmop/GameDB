using GameDB.Models.Consoles;

namespace GameDB.Services.Interfaces.Consoles
{
    public interface IPS3Service
    {
        public PS3 CadastrarJogoPS3(PS3 ps3);
        public void AlterarJogoPS3(PS3 ps3);
        public void ApagarJogoPS3(PS3 ps3);
        public PS3 BuscarJogoPS3(int id);
        public List<PS3Lista> ListarJogosPS3();
        public void AlterarParcialmenteJogoPS3(string Coluna, string ValorColuna, string Busca, string BuscaValor);


    }
}
