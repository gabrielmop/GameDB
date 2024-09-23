using GameDB.Models.Structure;


namespace GameDB.Services.Interface.Structure
{
    public interface IGeneroService
    {
        public Genero RegistrarGenero(Genero Genero);
        public void EditarGenero(Genero Genero);
        public void ApagarGenero(Genero genero);
        public Genero ProcurarGenero(int id);
        public List<Genero> ListarGeneros();

    }
}
