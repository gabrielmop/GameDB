namespace GameDB.Repository.Interface.Structure
{
    public interface IlogRepository
    {
        public void RegistrarLog(DateTime DataHora, int TipoEvento, string Mensagem, string Exception);

    }
}
