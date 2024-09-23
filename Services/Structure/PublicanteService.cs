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

        public void EditarPublicante(Publicante Publicante)
        {
            Repositorio.EditarPublicante(Publicante);
        }

        public List<Publicante> ListarPublicante()
        {
            var resultado = Repositorio.ListarPublicante();
            return resultado;
        }

        public Publicante ProcurarPublicante(int id)
        {
            var busca = Repositorio.ProcurarPublicante(id);
            return busca;
        }

        public Publicante RegistrarPublicante(Publicante Publicante)
        {
            Repositorio.RegistrarPublicante(Publicante);
            return Publicante;
        }
    }
}
