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
    public virtual DbSet<Regiao> Regioes { get; set; }
    public virtual DbSet<Publicante> Publis { get; set; }
    public virtual DbSet<Desenvolvedora> Devs { get; set; }

    //dbset dos consoles
    public virtual DbSet<PS3> Ps3s { get; set; }
    public virtual DbSet<PS3Lista> Ps3l { get; set; }
    public virtual DbSet<PS4> Ps4s { get; set; }
    public virtual DbSet<PS4Lista> Ps4l { get; set; }
    public virtual DbSet<JogosDigitais> Digitals { get; set; }
    public virtual DbSet<JogosDigitaisLista> DigitalL { get; set; }
  





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

        modelBuilder.Entity<JogosDigitais>(entity =>
        {
           
            entity.ToTable("Jogos_Digitais");

          
            entity.HasKey(e => e.GameId);

          
            entity.Property(e => e.Nome)
                  .HasMaxLength(250);  

            entity.Property(e => e.Serial)
                  .HasMaxLength(60); 

            entity.Property(e => e.Lancamento)
                  .IsRequired();

            entity.Property(e => e.Tamanho)
                  .HasColumnType("decimal(18, 0)");

            entity.Property(e => e.DataBackup)
                  .HasColumnType("datetime");

            entity.Property(e => e.LocalBackup)
                  .HasMaxLength(60);  

            entity.Property(e => e.Notas)
                  .HasMaxLength(250); 

            
        });



        modelBuilder.Entity<PS3>(entity =>
        {
           
            entity.ToTable("PS3");

          
            entity.HasKey(e => e.GameId);

           
            entity.Property(e => e.Nome)
                  .HasMaxLength(255);

            entity.Property(e => e.Serial)
                  .HasMaxLength(20); 

            entity.Property(e => e.ResMax)
                  .HasMaxLength(5);  

            entity.Property(e => e.Lancamento)
                  .IsRequired();

            entity.Property(e => e.Preco)
                  .HasColumnType("decimal(5, 2)");

            entity.Property(e => e.Aquisicao)
                  .HasColumnType("datetime");

            entity.Property(e => e.LocalAdq)
                  .HasMaxLength(100); 

            entity.Property(e => e.Notas)
                  .HasMaxLength(300);

            entity.Property(e => e.Instalacao)
                  .IsRequired(false);

            
        });

        modelBuilder.Entity<PS4>(entity =>
        {
           
            entity.ToTable("PS4");

            
            entity.HasKey(e => e.GameId);

           
            entity.Property(e => e.Nome)
                  .HasMaxLength(255); 

            entity.Property(e => e.Serial)
                  .HasMaxLength(20); 

            entity.Property(e => e.Tamanho)
                  .HasColumnType("decimal(18, 2)");

            entity.Property(e => e.Lancamento)
                  .IsRequired();

            entity.Property(e => e.Preco)
                  .HasColumnType("decimal(5, 2)");

            entity.Property(e => e.Aquisicao)
                  .HasColumnType("datetime");

            entity.Property(e => e.LocalAdq)
                  .HasMaxLength(100);  

            entity.Property(e => e.Notas)
                  .HasMaxLength(300);  

            entity.Property(e => e.PS4Pro)
                  .IsRequired(false);
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
            entity.ToTable("Genero");

            entity.Property(e => e.GeneroID).HasColumnName("GeneroID");
            entity.Property(e => e.GeneroNome)
                .HasMaxLength(50);
        });


        
        modelBuilder.Entity<Plataforma>(entity =>
        {
            entity.HasKey(e => e.PlataformaId).HasName("PK__Platafor__B83567EDABBA7196");

            entity.ToTable("Plataforma");

            entity.Property(e => e.Console).HasMaxLength(50);
            entity.Property(e => e.Marca).HasMaxLength(50);
        });

        
        modelBuilder.Entity<Regiao>(entity =>
        {
           entity.ToTable("Regiao");

            entity.Property(e => e.Sigla).HasMaxLength(3);
            entity.Property(entity => entity.RegiaoNome).HasMaxLength(50);
        });

       

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
