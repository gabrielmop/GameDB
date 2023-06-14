﻿using GameDB.DataContext;
using GameDB.Models;
using GameDB.Repository.Interface;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository
{
    public class EstadoRepository : IEstadoRepository
    {
        GameDBContext DBC;

        public EstadoRepository(GameDBContext _DBC)
        {
            DBC = _DBC;
        }


        public void ApagarEstado(Estado estado)
        {
            DBC.Estado.Remove(estado);
            DBC.SaveChanges();
        }

        public void EditarEstado(Estado estado)
        {
           DBC.Entry(estado).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<Estado> ListarEstados()
        {
           return DBC.Estado.ToList();
        }

        public Estado ProcurarEstado(int id)
        {
            return DBC.Estado.Find(id);
        }

        public Estado RegistrarEstado(Estado estado)
        {
            DBC.Add(estado);
            DBC.SaveChanges();
            return estado;
        }
    }
}
