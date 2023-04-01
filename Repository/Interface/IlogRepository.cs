namespace GameDB.Repository.Interface
{
    public interface IlogRepository
    {
        public void RegistrarLog(DateTime DataHora, int TipoEvento, string Mensagem, string Exception);

    }
}
