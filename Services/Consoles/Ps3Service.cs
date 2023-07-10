using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using GameDB.Services.Interfaces.Consoles;
using Microsoft.AspNetCore.JsonPatch;
using System.Linq;
using System.Xml;

namespace GameDB.Services.Consoles
{
    public class Ps3Serivce : IPS3Service
    {
        private readonly IPs3Repository Repositorio;

        public Ps3Serivce(IPs3Repository repositorio)
        {
            Repositorio = repositorio;
        }

        public Ps3 AdicionarJogo(Ps3 ps3)
        {
            Repositorio.AdicionarJogo(ps3);

            return ps3;
        }

        public void ApagarJogo(Ps3 ps3)
        {
            Repositorio.ApagarJogo(ps3);
        }

        public void EditarJogo(Ps3 ps3)
        {
            Repositorio.EditarJogo(ps3);
        }

        public void EditarParcialmente(JsonPatchDocument patch, Ps3 ps3)
        {
            Repositorio.EditarParcialmente(patch, ps3);
        }

        public List<Ps3Lista> ListarJogo()
        {
            var result = Repositorio.ListarJogo();
            foreach (var item in result)
            {
                if (item.Preco == "R$ 0,00")
                {
                    if (item.Observacoes.Contains("Guitarra"))
                    {
                        item.Preco = "Bundle com a Guitarra";
                    }
                    else

                        item.Preco = "Presente";
                }
            }
            return result;
        }

        public Ps3 ProcurarJogo(int id)
        {
            var busca = Repositorio.ProcurarJogo(id);
            return busca;
        }
    }

}


