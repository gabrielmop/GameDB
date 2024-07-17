using System;
using System.Collections.Generic;
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

    public virtual DbSet<Estado> Estados { get; set; }
    public virtual DbSet<Genero> Generos { get; set; }
    public virtual DbSet<Logs> Logs { get; set; }
    public virtual DbSet<N3DS> N3DS { get; set; }
    public virtual DbSet<N3DSLista> N3DSL {  get; set; }
    public virtual DbSet<Plataforma> Plataformas { get; set; }
    public virtual DbSet<Ps2> Ps2s { get; set; }
    public virtual DbSet<Ps2Lista> Ps2l { get; set; }
    public virtual DbSet<Ps3> Ps3s { get; set; }
    public virtual DbSet<Ps3Lista> Ps3l { get; set; }
    public virtual DbSet<Ps4> Ps4s { get; set; }
    public virtual DbSet<Ps4Lista> Ps4l { get; set; }
    public virtual DbSet<PS5> Ps5s { get; set; }
    public virtual DbSet<PS5Lista> Ps5l { get; set; }
    public virtual DbSet<Regiao> Regiaos { get; set; }
    public virtual DbSet<WiiU> WiiUs { get; set; }
    public virtual DbSet<WiiULista> WiiUl { get; set; }
    public virtual DbSet<Xbox360> Xbox360s { get; set; }
    public virtual DbSet<Xbox360Lista> Xbox360l { get; set; }




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

        modelBuilder.Entity<Genero>(entity =>
        {
            entity.HasKey(e => e.GeneroId).HasName("PK__Genero__A99D0268E917AC40");

            entity.ToTable("Genero");

            entity.Property(e => e.GeneroId).HasColumnName("GeneroID");
            entity.Property(e => e.GeneroNome)
                .HasMaxLength(50)
                .HasColumnName("Genero");
        });


        modelBuilder.Entity<N3DS>(entity =>
        {
            entity.HasKey(e => e.GameId).HasName("PK__N3DS__2AB897DD057014CC");

            entity.ToTable("N3DS");

            entity.Property(e => e.GameId).HasColumnName("GameID");
            entity.Property(e => e.Aquisicao).HasColumnType("date");
            entity.Property(e => e.EstadoID).HasColumnName("EstadoID");
            entity.Property(e => e.Lancamento).HasColumnType("date");
            entity.Property(e => e.LocalAdq)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.Nome)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.Observacoes)
                .HasMaxLength(300)
                .IsUnicode(false);
            entity.Property(e => e.Serial)
                .HasMaxLength(25)
                .IsUnicode(false);

            entity.HasOne(d => d.Estado)
            .WithMany(p => p.N3ds)
            .HasForeignKey(d => d.EstadoID)
            .HasConstraintName("FK__N3DS__EstadoID__4F47C5E3");

            entity.HasOne(d => d.Genero).WithMany(p => p.N3ds)
                .HasForeignKey(d => d.GeneroId)
                .HasConstraintName("FK__N3DS__GeneroId__2B0A656D");

            entity.HasOne(d => d.Plataforma).WithMany(p => p.N3ds)
                .HasForeignKey(d => d.PlataformaId)
                .HasConstraintName("FK__N3DS__Plataforma__2A164134");

            entity.HasOne(d => d.Regiao).WithMany(p => p.N3ds)
                .HasForeignKey(d => d.RegiaoId)
                .HasConstraintName("FK__N3DS__RegiaoId__29221CFB");
        });

        modelBuilder.Entity<Plataforma>(entity =>
        {
            entity.HasKey(e => e.PlataformaId).HasName("PK__Platafor__B83567EDABBA7196");

            entity.ToTable("Plataforma");

            entity.Property(e => e.Console).HasMaxLength(50);
            entity.Property(e => e.Marca).HasMaxLength(50);
        });

        modelBuilder.Entity<Ps2>(entity =>
        {
            entity.HasKey(e => e.GameId).HasName("PK__PS2__2AB897DDFE8F01DB");

            entity.ToTable("PS2");

            entity.Property(e => e.GameId).HasColumnName("GameID");
            entity.Property(e => e.Aquisicao).HasColumnType("datetime");
            entity.Property(e => e.EstadoID).HasColumnName("EstadoID");
            entity.Property(e => e.Lancamento).HasColumnType("datetime");
            entity.Property(e => e.LocalAdq)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.Nome)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.Observacoes).IsUnicode(false);
            entity.Property(e => e.Serial)
                .HasMaxLength(25)
                .IsUnicode(false);

            entity.HasOne(d => d.Estado).WithMany(p => p.ps2s)
                .HasForeignKey(d => d.EstadoID)
                .HasConstraintName("FK__PS2__EstadoID__0B5CAFEA");

            entity.HasOne(d => d.Genero).WithMany(p => p.ps2s)
                .HasForeignKey(d => d.GeneroId)
                .HasConstraintName("FK__PS2__GeneroId__0A688BB1");

            entity.HasOne(d => d.Plataforma).WithMany(p => p.ps2s)
                .HasForeignKey(d => d.PlataformaId)
                .HasConstraintName("FK__PS2__PlataformaI__09746778");

            entity.HasOne(d => d.Regiao).WithMany(p => p.ps2s)
                .HasForeignKey(d => d.RegiaoId)
                .HasConstraintName("FK__PS2__RegiaoId__0880433F");
        });

        modelBuilder.Entity<Ps3>(entity =>
        {
            entity.HasKey(e => e.GameId).HasName("PK__PS3__2AB897DD8C4F0C78");

            entity.ToTable("PS3");

            entity.Property(e => e.GameId).HasColumnName("GameID");
            entity.Property(e => e.Aquisicao).HasColumnType("date");
            entity.Property(e => e.EstadoID).HasColumnName("EstadoID");
            entity.Property(e => e.GeneroId).HasColumnName("GeneroID");
            entity.Property(e => e.Lancamento).HasColumnType("date");
            entity.Property(e => e.LocalAdq).HasMaxLength(100);
            entity.Property(e => e.Nome).HasMaxLength(350);
            entity.Property(e => e.Observacoes).HasMaxLength(300);
            entity.Property(e => e.Preco).HasColumnType("decimal(5, 2)");
            entity.Property(e => e.Serial).HasMaxLength(15);

           
        });

        modelBuilder.Entity<Ps4>(entity =>
        {
            entity.HasKey(e => e.GameId).HasName("PK__PS4__2AB897DD8467B9CF");

            entity.ToTable("PS4");

            entity.Property(e => e.GameId).HasColumnName("GameID");
            entity.Property(e => e.Aquisicao).HasColumnType("date");
            entity.Property(e => e.EstadoId).HasColumnName("EstadoID");
            entity.Property(e => e.GeneroId).HasColumnName("GeneroID");
            entity.Property(e => e.Lancamento).HasColumnType("date");
            entity.Property(e => e.LocalAdq).HasMaxLength(100);
            entity.Property(e => e.Nome).HasMaxLength(350);
            entity.Property(e => e.Observacoes).HasMaxLength(300);
            entity.Property(e => e.Ps4pro).HasColumnName("PS4Pro");
            entity.Property(e => e.Serial).HasMaxLength(25);

           
        });

        modelBuilder.Entity<PS5>(entity =>
        {
            entity.HasKey(e => e.GameID).HasName("PK__PS5__2AB897DD6D850ABC");

            entity.ToTable("PS5");

            entity.Property(e => e.GameID).HasColumnName("GameID");
            entity.Property(e => e.Aquisicao).HasColumnType("date");
            entity.Property(e => e.EstadoID).HasColumnName("EstadoID");
            entity.Property(e => e.GeneroID).HasColumnName("GeneroID");
            entity.Property(e => e.Lancamento).HasColumnType("date");
            entity.Property(e => e.LocalAdq).HasMaxLength(100);
            entity.Property(e => e.Nome).HasMaxLength(350);
            entity.Property(e => e.Observacoes).HasMaxLength(300);
            entity.Property(e => e.Serial).HasMaxLength(25);

            entity.HasOne(d => d.Estado).WithMany(p => p.PS5s)
                .HasForeignKey(d => d.EstadoID)
                .HasConstraintName("FK__PS5__EstadoID__625A9A57");

            entity.HasOne(d => d.Genero).WithMany(p => p.PS5s)
                .HasForeignKey(d => d.GeneroID)
                .HasConstraintName("FK__PS5__GeneroID__634EBE90");

            entity.HasOne(d => d.Plataforma).WithMany(p => p.PS5s)
                .HasForeignKey(d => d.PlataformaId)
                .HasConstraintName("FK__PS5__PlataformaI__6442E2C9");

            entity.HasOne(d => d.Regiao).WithMany(p => p.PS5s)
                .HasForeignKey(d => d.RegiaoId)
                .HasConstraintName("FK__PS5__RegiaoId__65370702");
        });

        modelBuilder.Entity<Regiao>(entity =>
        {
            entity.HasKey(e => e.RegiaoId).HasName("PK__Regiao__1FC4ACDF5AE377E7");

            entity.ToTable("Regiao");

            entity.Property(e => e.RegiaoNome)
                .HasMaxLength(3)
                .HasColumnName("Regiao");
        });

        modelBuilder.Entity<WiiU>(entity =>
        {
            entity.HasKey(e => e.GameId).HasName("PK__WiiU__2AB897DDB4A061FB");

            entity.ToTable("WiiU");

            entity.Property(e => e.GameId).HasColumnName("GameID");
            entity.Property(e => e.Aquisicao).HasColumnType("datetime");
            entity.Property(e => e.EstadoID).HasColumnName("EstadoID");
            entity.Property(e => e.GeneroId).HasColumnName("GeneroID");
            entity.Property(e => e.Lancamento).HasColumnType("datetime");
            entity.Property(e => e.LocalAdq)
                .HasMaxLength(70)
                .IsUnicode(false);
            entity.Property(e => e.Nome)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Observacoes)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.PlataformaId).HasColumnName("PlataformaID");
            entity.Property(e => e.RegiaoId).HasColumnName("RegiaoID");
            entity.Property(e => e.Serial)
                .HasMaxLength(20)
                .IsUnicode(false);

            entity.HasOne(d => d.Estado).WithMany(p => p.WiiUs)
                .HasForeignKey(d => d.EstadoID)
                .HasConstraintName("FK__WiiU__EstadoID__1E6F845E");

            entity.HasOne(d => d.Genero).WithMany(p => p.WiiUs)
                .HasForeignKey(d => d.GeneroId)
                .HasConstraintName("FK__WiiU__GeneroID__1D7B6025");

            entity.HasOne(d => d.Plataforma).WithMany(p => p.WiiUs)
                .HasForeignKey(d => d.PlataformaId)
                .HasConstraintName("FK__WiiU__Plataforma__1C873BEC");

            entity.HasOne(d => d.Regiao).WithMany(p => p.WiiUs)
                .HasForeignKey(d => d.RegiaoId)
                .HasConstraintName("FK__WiiU__EstadoID__1B9317B3");
        });

        modelBuilder.Entity<Xbox360>(entity =>
        {
            entity.HasKey(e => e.GameId).HasName("PK__Xbox360__2AB897DD9956B12C");

            entity.ToTable("Xbox360");

            entity.Property(e => e.GameId).HasColumnName("GameID");
            entity.Property(e => e.Aquisicao).HasColumnType("date");
            entity.Property(e => e.EstadoID).HasColumnName("EstadoID");
            entity.Property(e => e.GeneroId).HasColumnName("GeneroID");
            entity.Property(e => e.Lancamento).HasColumnType("date");
            entity.Property(e => e.LocalAdq).HasMaxLength(100);
            entity.Property(e => e.Nome).HasMaxLength(350);
            entity.Property(e => e.Observacoes).HasMaxLength(300);
            entity.Property(e => e.Serial).HasMaxLength(25);

            entity.HasOne(d => d.Estado).WithMany(p => p.Xbox360s)
                .HasForeignKey(d => d.EstadoID)
                .HasConstraintName("FK__Xbox360__EstadoI__756D6ECB");

            entity.HasOne(d => d.Genero).WithMany(p => p.Xbox360s)
                .HasForeignKey(d => d.GeneroId)
                .HasConstraintName("FK__Xbox360__GeneroI__76619304");

            entity.HasOne(d => d.Plataforma).WithMany(p => p.Xbox360s)
                .HasForeignKey(d => d.PlataformaId)
                .HasConstraintName("FK__Xbox360__Platafo__7755B73D");

            entity.HasOne(d => d.Regiao).WithMany(p => p.Xbox360s)
                .HasForeignKey(d => d.RegiaoId)
                .HasConstraintName("FK__Xbox360__RegiaoI__7849DB76");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
