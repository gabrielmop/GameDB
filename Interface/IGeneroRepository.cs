﻿using GameDB.Models;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;

namespace GameDB.Interface
{
    public interface IGeneroRepository
    {
        public Genero RegistrarGenero(Genero Genero);
        public void EditarGenero(Genero Genero);
        public void ApagarGenero(Genero genero);
        public Genero ProcurarGenero(int id);
        public List<Genero> ListarGeneros();
        public void EditarGeneroParcialmente(JsonPatchDocument patch, Genero genero);

    }
}
