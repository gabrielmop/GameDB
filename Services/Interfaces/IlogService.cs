namespace GameDB.Services.Interfaces
{
    public interface IlogService
    {
        public void RegistrarLog(DateTime DataHora, int TipoEvento, string Mensagem, string Exception);
    }
}
