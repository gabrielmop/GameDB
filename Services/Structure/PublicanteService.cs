using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Services.Interface.Structure;


namespace GameDB.Services.Structure
{
    public class PublicanteService : IPublicanteService
    {
        private readonly IPublicanteRepository Repositorio;

        public PublicanteService(IPublicanteRepository repositorio)
        {
            Repositorio = repositorio;
        }
        public void ApagarPublicante(Publicante Publicante)
        {
            Repositorio.ApagarPublicante(Publicante);
        }

        public void AlterarPublicante(Publicante Publicante)
        {
            Repositorio.AlterarPublicante(Publicante);
        }

        public List<Publicante> ListarPublicantes()
        {
            var resultado = Repositorio.ListarPublicantes();
            return resultado;
        }

        public Publicante BuscarPublicante(int id)
        {
            var busca = Repositorio.BuscarPublicante(id);
            return busca;
        }

        public Publicante CadastrarPublicante(Publicante Publicante)
        {
            Repositorio.CadastrarPublicante(Publicante);
            return Publicante;
        }
    }
}
