using GameDB.Models;
using GameDB.Repository.Interface;
using GameDB.Services.Interfaces;
using Microsoft.AspNetCore.JsonPatch;
using System.Data;

namespace GameDB.Services
{
    public class N3DSService : IN3DSService
    {
        private readonly IN3DSRepository Repositorio;

        public N3DSService(IN3DSRepository repositorio)
        {
            Repositorio = repositorio;
        }
        public N3DS AdicionarJogo(N3DS N3DS)
        {
            Repositorio.AdicionarJogo(N3DS);
            return N3DS;
        }

        public void ApagarJogo(N3DS N3DS)
        {
            Repositorio.ApagarJogo(N3DS);
        }

        public void EditarJogo(N3DS N3DS)
        {
            Repositorio.EditarJogo(N3DS);
        }

        public void EditarParcialmente(JsonPatchDocument patch, N3DS N3DS)
        {
            Repositorio.EditarParcialmente(patch, N3DS);
        }

        public List<N3DSLista> ListarJogo()
        {
            var Result = Repositorio.ListarJogo();

            foreach (var item in Result)
            {
                item.Tamanho = $"{item.Tamanho}MB";

                if (item.Preco == "R$ 0,00")
                {
                    if (item.Observacoes.Contains("Videogame"))
                    {
                        item.Preco = "Veio com O Videogame";
                    }else
                    {
                        item.Preco = "Presente";
                    }
                   
                }          
            }
            return Result;
        }

            public N3DS ProcurarJogo(int id)
            {
                var busca = Repositorio.ProcurarJogo(id);
                return busca;
            }
        }
    } 

