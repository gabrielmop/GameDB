﻿using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using GameDB.Services.Interfaces.Consoles;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Services.Consoles
{
    public class PS4Service : IPS4Service
    {
        private readonly IPS4Repository Repositorio;

        public PS4Service(IPS4Repository repositorio)
        {
            Repositorio = repositorio;
        }

        public Ps4 AdicionarJogo(Ps4 ps4)
        {
            return Repositorio.AdicionarJogo(ps4);

        }

        public void ApagarJogo(Ps4 ps4)
        {
            Repositorio.ApagarJogo(ps4);
        }

        public void EditarJogo(Ps4 ps4)
        {
            Repositorio.EditarJogo(ps4);

        }

        public void EditarParcialmente(JsonPatchDocument patch, Ps4 ps4)
        {
            Repositorio.EditarParcialmente(patch, ps4);
        }

        public List<Ps4Lista> ListarJogo(bool incluiPS5)
        {
            var result = Repositorio.ListarJogo(incluiPS5);
            foreach (var item in result)
            {
                if (item.Preco == "R$ 0,00")
                {
                    if (item.Observacoes.Contains("Videogame"))
                    {
                        item.Preco = "Bundle com o Videogame";
                    }
                    else

                        item.Preco = "Presente";
                }
            }

            return result;

        }

        public Ps4 ProcurarJogo(int id)
        {
            return Repositorio.ProcurarJogo(id);
        }
    }
}
