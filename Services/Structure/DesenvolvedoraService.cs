using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using GameDB.Services.Interface.Structure;


namespace GameDB.Services.Structure
{
    public class DesenvolvedoraService : IDesenvolvedoraService
    {
        private readonly IDesenvolvedoraRepository Repositorio;

        public DesenvolvedoraService(IDesenvolvedoraRepository repositorio)
        {
            Repositorio = repositorio;
        }
        public void ApagarDesenvolvedora(Desenvolvedora Desenvolvedora)
        {
            Repositorio.ApagarDesenvolvedora(Desenvolvedora);
        }

        public void AlterarDesenvolvedora(Desenvolvedora Desenvolvedora)
        {
            Repositorio.AlterarDesenvolvedora(Desenvolvedora);
        }

        public List<Desenvolvedora> ListarDesenvolvedoras()
        {
            var resultado = Repositorio.ListarDesenvolvedoras();
            return resultado;
        }

        public Desenvolvedora BuscarDesenvolvedora(int id)
        {
            var busca = Repositorio.BuscarDesenvolvedora(id);
            return busca;
        }

        public Desenvolvedora CadastrarDesenvolvedora(Desenvolvedora Desenvolvedora)
        {
            Repositorio.CadastrarDesenvolvedora(Desenvolvedora);
            return Desenvolvedora;
        }
    }
}
