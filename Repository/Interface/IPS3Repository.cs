﻿using GameDB.Models;
using Microsoft.AspNetCore.JsonPatch;

namespace GameDB.Repository.Interface
{
    public interface IPs3Repository
    {
        public Ps3 AdicionarJogo(Ps3 ps3);
        public void EditarJogo(Ps3 ps3);
        public void ApagarJogo(Ps3 ps3);
        public Ps3 ProcurarJogo(int id);
        public List<PS3Lista> ListarJogo();
        public void EditarParcialmente(JsonPatchDocument patch, Ps3 ps3);
    }
}