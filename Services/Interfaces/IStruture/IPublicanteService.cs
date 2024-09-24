using GameDB.Models.Structure;


namespace GameDB.Services.Interface.Structure
{
    public interface IPublicanteService
    {
        public Publicante CadastrarPublicante(Publicante Publicante);
        public void AlterarPublicante(Publicante Publicante);
        public void ApagarPublicante(Publicante Publicante);
        public Publicante BuscarPublicante(int id);
        public List<Publicante> ListarPublicantes();

    }
}
