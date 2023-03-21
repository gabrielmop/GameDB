using GameDB.Models;

namespace GameDB.Interface
{
    public interface IPlataformaRepository
    {
        public Plataforma RegistrarPlataforma(Plataforma plataforma);
        public void EditarPlataforma(Plataforma plataforma);
        public void ApagarPlataforma(Plataforma plataforma);
        public Plataforma ProcurarPlataforma(int id);
        public List<Plataforma> ListarPlataforma();
    }
}
