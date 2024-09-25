using GameDB.Models.Structure;


namespace GameDB.Services.Interface.Structure
{
    public interface IGeneroService
    {
        public Genero CadastrarGenero(Genero Genero);
        public void AlterarGenero(Genero Genero);
        public void ApagarGenero(Genero genero);
        public Genero BuscarGenero(int id);
        public List<Genero> ListarGeneros();

    }
}
