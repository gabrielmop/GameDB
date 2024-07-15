using GameDB.DataContext;
using GameDB.Models.Consoles;
using GameDB.Repository.Interface.Consoles;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;


namespace GameDB.Repository.Consoles
{
    public class Xbox360Repository : IXbox360Repository
    {
        GameDBContext DBC;

        public Xbox360Repository(GameDBContext _dbc)
        {
            DBC = _dbc;
        }

        public Xbox360 AdicionarJogo(Xbox360 x360)
        {
            DBC.Add(x360);
            DBC.SaveChanges();
            return x360;
        }

        public void ApagarJogo(Xbox360 x360)
        {
            DBC.Remove(x360);
            DBC.SaveChanges();
        }

        public void EditarJogo(Xbox360 x360)
        {
            DBC.Entry(x360).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public void EditarParcialmente(JsonPatchDocument patch, Xbox360 x360)
        {
            patch.ApplyTo(x360);
            DBC.Entry(x360).State = EntityState.Modified;
            DBC.SaveChanges();
        }

        public List<Xbox360Lista> ListarJogo()
        {
            var Lista = DBC.Xbox360l.FromSqlRaw("execute dbo.Listar_Jogos_Xbox360");
            return Lista.ToList();

        }


        public Xbox360 ProcurarJogo(int id)
        {

            return DBC.Xbox360s.Find(id);
        }
    }
}
