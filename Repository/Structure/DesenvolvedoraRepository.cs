using GameDB.DataContext;
using GameDB.Models.Structure;
using GameDB.Repository.Interface.Structure;
using Microsoft.EntityFrameworkCore;

namespace GameDB.Repository.Structure
{
    public class DesenvolvedoraRepository : IDesenvolvedoraRepository
    {
        GameDBContext DBC;

        public DesenvolvedoraRepository(GameDBContext _DBC)
        {
            DBC = _DBC;
        }

        public void ApagarDesenvolvedora(Desenvolvedora Desenvolvedora)
        {
            DBC.Devs.Remove(Desenvolvedora);
            DBC.SaveChanges();
        }

        public void AlterarDesenvolvedora(Desenvolvedora Desenvolvedora)
        {
            var existingEntity = DBC.Devs.Local.FirstOrDefault(e => e.DevID == Desenvolvedora.DevID);
            if (existingEntity != null)
            {
                DBC.Entry(existingEntity).State = EntityState.Detached;
            }
            DBC.Entry(Desenvolvedora).State = EntityState.Modified;
            DBC.SaveChanges();
        }


        public List<Desenvolvedora> ListarDesenvolvedoras()
        {
            return DBC.Devs.ToList();
        }

        public Desenvolvedora BuscarDesenvolvedora(int id)
        {
            //Expressão lambda:
            // return DBC.Genero.Where(s => s.id == id).FirstOrDefault();
            return DBC.Devs.Find(id);
        }

        public Desenvolvedora CadastrarDesenvolvedora(Desenvolvedora Desenvolvedora)
        {
            DBC.Add(Desenvolvedora);
            DBC.SaveChanges();
            return Desenvolvedora;
        }
    }
}
