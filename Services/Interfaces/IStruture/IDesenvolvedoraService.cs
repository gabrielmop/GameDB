using GameDB.Models.Structure;


namespace GameDB.Services.Interface.Structure
{
    public interface IDesenvolvedoraService
    {
        public Desenvolvedora CadastrarDesenvolvedora(Desenvolvedora Desenvolvedora);
        public void AlterarDesenvolvedora(Desenvolvedora Desenvolvedora);
        public void ApagarDesenvolvedora(Desenvolvedora Desenvolvedora);
        public Desenvolvedora BuscarDesenvolvedora(int id);
        public List<Desenvolvedora> ListarDesenvolvedoras();

    }
}
