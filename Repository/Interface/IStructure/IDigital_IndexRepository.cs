using GameDB.Models.Structure;

namespace GameDB.Repository.Interface.Structure
{
    public interface IDigital_IndexRepository
    {
        public Digital_Index CadastrarDigital_Index(Digital_Index Desenvolvedora);
        public void AlterarDigital_Index(Digital_Index Desenvolvedora);
        public void ApagarDigital_Index(Digital_Index Desenvolvedora);
        public Digital_Index BuscarDigital_Index(int id);
        public List<Digital_Index> ListarDigital_Index();

    }
}
