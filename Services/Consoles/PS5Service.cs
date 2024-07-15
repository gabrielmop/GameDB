using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using GameDB.Services.Interfaces.Consoles;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Services.Consoles
{
    public class PS5Service : IPS5Service
    {
        private readonly IPS5Repository Repositorio;

        public PS5Service(IPS5Repository repositorio)
        {
            Repositorio = repositorio;
        }

        public PS5 AdicionarJogo(PS5 ps5)
        {
            return Repositorio.AdicionarJogo(ps5);

        }

        public void ApagarJogo(PS5 ps5)
        {
            Repositorio.ApagarJogo(ps5);
        }

        public void EditarJogo(PS5 ps5)
        {
            Repositorio.EditarJogo(ps5);

        }

        public void EditarParcialmente(JsonPatchDocument patch, PS5 ps5)
        {
            Repositorio.EditarParcialmente(patch, ps5);
        }

        public List<PS5Lista> ListarJogo()
        {
            var result = Repositorio.ListarJogo();
            return result;

        }

        public PS5 ProcurarJogo(int id)
        {
            return Repositorio.ProcurarJogo(id);
        }
    }
}
