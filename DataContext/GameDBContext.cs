using GameDB.Models.Consoles;
using GameDB.Models.Structure;
using Microsoft.EntityFrameworkCore;

namespace GameDB.DataContext;

public partial class GameDBContext : DbContext
{
    public GameDBContext()
    {
    }

    public GameDBContext(DbContextOptions<GameDBContext> options)
        : base(options)
    {
    }

    //dbset das structures
    public virtual DbSet<Estado> Estados { get; set; }
    public virtual DbSet<Genero> Generos { get; set; }
    public virtual DbSet<Logs> Logs { get; set; }
    public virtual DbSet<Plataforma> Plataformas { get; set; }
    public virtual DbSet<Regioes> Regiaos { get; set; }
    public virtual DbSet<Publicante> Publis { get; set; }
    public virtual DbSet<Desenvolvedora> Devs { get; set; }

    //dbset dos consoles
    public virtual DbSet<Ps3> Ps3s { get; set; }
    public virtual DbSet<Ps3Lista> Ps3l { get; set; }
  





    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=Moop_PC;Initial Catalog=GameDB;Integrated Security=true;TrustServerCertificate=true");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Estado>(entity =>
        {
            entity.HasKey(e => e.EstadoID).HasName("PK__Estado__C696F36348ED37AD");

            entity.ToTable("Estado");

            entity.Property(e => e.EstadoID).HasColumnName("estadoID");
            entity.Property(e => e.EstadoNome)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Publicante>(entity =>
        {
           entity.ToTable("Publicante");

            entity.Property(e => e.PubliID).HasColumnName("PubliID");
            entity.Property(e => e.PubliNome)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Desenvolvedora>(entity =>
        {
           entity.ToTable("Desenvolvedora");

            entity.Property(e => e.DevID).HasColumnName("DevID");
            entity.Property(e => e.DevNome)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Genero>(entity =>
        {
            entity.HasKey(e => e.GeneroId).HasName("PK__Genero__A99D0268E917AC40");

            entity.ToTable("Genero");

            entity.Property(e => e.GeneroId).HasColumnName("GeneroID");
            entity.Property(e => e.GeneroNome)
                .HasMaxLength(50)
                .HasColumnName("Genero");
        });


        
        modelBuilder.Entity<Plataforma>(entity =>
        {
            entity.HasKey(e => e.PlataformaId).HasName("PK__Platafor__B83567EDABBA7196");

            entity.ToTable("Plataforma");

            entity.Property(e => e.Console).HasMaxLength(50);
            entity.Property(e => e.Marca).HasMaxLength(50);
        });

        
        modelBuilder.Entity<Regioes>(entity =>
        {
            entity.HasKey(e => e.RegiaoId).HasName("PK__Regiao__1FC4ACDF5AE377E7");

            entity.ToTable("Regiao");

            entity.Property(e => e.Regiao)
                .HasMaxLength(3)
                .HasColumnName("Regiao");
        });

       

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
