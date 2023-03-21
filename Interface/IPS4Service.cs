﻿using GameDB.Models;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Interface
{
    public interface IPS4Service
    {
        public Ps4 AdicionarJogo(Ps4 ps4);
        public void EditarJogo(Ps4 ps4);
        public void ApagarJogo(Ps4 ps4);
        public Ps4 ProcurarJogo(int id);
        public List<Ps4Lista> ListarJogo();
        public void EditarParcialmente(JsonPatchDocument patch, Ps4 ps4);

    }
}
