using GameDB.Models.Structure;


namespace GameDB.Services.Interface.Structure
{
    public interface IPublicanteService
    {
        public Publicante RegistrarPublicante(Publicante Publicante);
        public void EditarPublicante(Publicante Publicante);
        public void ApagarPublicante(Publicante Publicante);
        public Publicante ProcurarPublicante(int id);
        public List<Publicante> ListarPublicante();

    }
}
