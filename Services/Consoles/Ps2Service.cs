using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using GameDB.Services.Interfaces.Consoles;
using Microsoft.AspNetCore.JsonPatch;
using System.Linq;
using System.Xml;

namespace GameDB.Services.Consoles
{
    public class Ps2Serivce : IPS2Service
    {
        private readonly IPs2Repository Repositorio;

        public Ps2Serivce(IPs2Repository repositorio)
        {
            Repositorio = repositorio;
        }

        public Ps2 AdicionarJogo(Ps2 ps2)
        {
            Repositorio.AdicionarJogo(ps2);

            return ps2;
        }

        public void ApagarJogo(Ps2 ps2)
        {
            Repositorio.ApagarJogo(ps2);
        }

        public void EditarJogo(Ps2 ps2)
        {
            Repositorio.EditarJogo(ps2);
        }

        public void EditarParcialmente(JsonPatchDocument patch, Ps2 ps2)
        {
            Repositorio.EditarParcialmente(patch, ps2);
        }

        public List<Ps2Lista> ListarJogo()
        {
            var result = Repositorio.ListarJogo();
            return result;
        }

        public Ps2 ProcurarJogo(int id)
        {
            var busca = Repositorio.ProcurarJogo(id);
            return busca;
        }
    }

}


