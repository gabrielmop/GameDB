namespace GameDB.Services.Interfaces.Struture
{
    public interface IlogService
    {
        public void RegistrarLog(DateTime DataHora, int TipoEvento, string Mensagem, string Exception);
    }
}
