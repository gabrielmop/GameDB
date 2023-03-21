using GameDB.Interface;
using GameDB.Models;
using Microsoft.AspNetCore.JsonPatch;
using System.Linq;
using System.Xml;

namespace GameDB.Services
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

        public void EditarJogo(Ps3 ps3)
        {
            Repositorio.EditarJogo(ps3);
        }

        public void EditarParcialmente(JsonPatchDocument patch, Ps3 ps3)
        {
            Repositorio.EditarParcialmente(patch, ps3);
        }

        public List<PS3Lista> ListarJogo()
        {

            var result = Repositorio.ListarJogo();
            foreach (var item in result)
            {

                if (item.Preco == "R$ 0,00")

                {
                  item.Preco = "Presente";
                }

                if (item.Observacoes.Contains("Bundle"))
                {
                    item.Preco = "Bundle Com A Guitarra";
                }
            }

            return result;



        }
    }
            
}


