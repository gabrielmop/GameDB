using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using GameDB.Services.Interfaces.Consoles;
using Microsoft.AspNetCore.JsonPatch;
using System.Linq;
using System.Xml;

namespace GameDB.Services.Consoles
{
    public class WiiUSerivce : IWiiUService
    {
        private readonly IWiiURepository Repositorio;

        public WiiUSerivce(IWiiURepository repositorio)
        {
            Repositorio = repositorio;
        }

        public WiiU AdicionarJogo(WiiU wu)
        {
            Repositorio.AdicionarJogo(wu);

            return wu;
        }

        public void ApagarJogo(WiiU wu)
        {
            Repositorio.ApagarJogo(wu);
        }

        public void EditarJogo(WiiU wu)
        {
            Repositorio.EditarJogo(wu);
        }

        public void EditarParcialmente(JsonPatchDocument patch, WiiU wu)
        {
            Repositorio.EditarParcialmente(patch, wu);
        }

        public List<WiiULista> ListarJogo()
        {
            var result = Repositorio.ListarJogo();
            foreach (var item in result)
            {
                if (item.Preco == "R$ 0,00" && item.Aquisicao == "20/04/2023")
                {
                    item.Preco = "Veio com o Videogame";
                }
            }
            return result;
        }

        public WiiU ProcurarJogo(int id)
        {
            var busca = Repositorio.ProcurarJogo(id);
            return busca;
        }
    }

}


