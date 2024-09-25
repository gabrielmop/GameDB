using GameDB.Models.Structure;

namespace GameDB.Services.Interface.Structure
{
    public interface IPlataformaService
    {
        public Plataforma CadastrarPlataforma(Plataforma plataforma);
        public void AlterarPlataforma(Plataforma plataforma);
        public void ApagarPlataforma(Plataforma plataforma);
        public Plataforma BuscarPlataforma(int id);
        public List<Plataforma> ListarPlataformas();
    }
}
