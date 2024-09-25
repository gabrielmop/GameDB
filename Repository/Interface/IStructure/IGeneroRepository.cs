using GameDB.Models.Structure;

namespace GameDB.Repository.Interface.Structure
{
    public interface IGeneroRepository
    {
        public Genero CadastrarGenero(Genero Genero);
        public void AlterarGenero(Genero Genero);
        public void ApagarGenero(Genero genero);
        public Genero BuscarGenero(int id);
        public List<Genero> ListarGeneros();

    }
}
