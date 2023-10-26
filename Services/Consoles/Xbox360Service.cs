using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using GameDB.Services.Interfaces.Consoles;
using Microsoft.AspNetCore.JsonPatch;
using System.Linq;
using System.Xml;

namespace GameDB.Services.Consoles
{
    public class Xbox360Serivce : IXbox360Service
    {
        private readonly IXbox360Repository Repositorio;

        public Xbox360Serivce(IXbox360Repository repositorio)
        {
            Repositorio = repositorio;
        }

        public Xbox360 AdicionarJogo(Xbox360 x360)
        {
            Repositorio.AdicionarJogo(x360);

            return x360;
        }

        public void ApagarJogo(Xbox360 x360)
        {
            Repositorio.ApagarJogo(x360);
        }

        public void EditarJogo(Xbox360 x360)
        {
            Repositorio.EditarJogo(x360);
        }

        public void EditarParcialmente(JsonPatchDocument patch, Xbox360 ps3)
        {
            Repositorio.EditarParcialmente(patch, ps3);
        }

    
        public List<Xbox360Lista> ListarJogo()
        {
            var result = Repositorio.ListarJogo();
            return result;
        }

        public Xbox360 ProcurarJogo(int id)
        {

            return Repositorio.ProcurarJogo(id);
        }
    }

}


