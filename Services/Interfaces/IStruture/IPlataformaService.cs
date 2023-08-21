using GameDB.Models.Structure;

namespace GameDB.Services.Interface.Structure
{
    public interface IPlataformaService
    {
        public Plataforma RegistrarPlataforma(Plataforma plataforma);
        public void EditarPlataforma(Plataforma plataforma);
        public void ApagarPlataforma(Plataforma plataforma);
        public Plataforma ProcurarPlataforma(int id);
        public List<Plataforma> ListarPlataforma();
    }
}
