using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using GameDB.Models;
using static GameDB.Models.N3DS;

namespace GameDB.DataContext
{
    public partial class GameDBContext : DbContext
    {
        public GameDBContext()
        {
        }

        public GameDBContext(DbContextOptions<GameDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Genero> Generos { get; set; } = null!;
        public virtual DbSet<Plataforma> Plataformas { get; set; } = null!;
        public virtual DbSet<Ps3> Ps3s { get; set; } = null!;
        public virtual DbSet<Ps3Lista> Ps3l { get; set; } = null!;
        public virtual DbSet<Ps4> Ps4s { get; set; } = null!;
        public virtual DbSet<Ps4Lista> Ps4l { get; set; } = null!;
        public virtual DbSet<Regiao> Regioes { get; set; } = null!;
        public virtual DbSet<Logs> Logs { get; set; } = null!;
        public virtual DbSet<N3DS> N3Ds { get; set; } = null!;
        public virtual DbSet<N3DSLista> N3DSl { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=Moop_PC;Initial Catalog=GameDB;Integrated Security=true")
                .UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Genero>(entity =>
            {
                entity.ToTable("Genero");

                entity.Property(e => e.GeneroId).HasColumnName("GeneroID");

                entity.Property(e => e.GeneroNome)
                    .HasMaxLength(50)
                    .HasColumnName("Genero");
            });

            modelBuilder.Entity<Plataforma>(entity =>
            {
                entity.ToTable("Plataforma");

                entity.Property(e => e.Console).HasMaxLength(50);

                entity.Property(e => e.Marca).HasMaxLength(50);
            });

            modelBuilder.Entity<Ps3>(entity =>
            {
                entity.HasKey(e => e.GameId)
                    .HasName("PK__PS3__2AB897DD8C4F0C78");

                entity.ToTable("PS3");

                entity.Property(e => e.GameId).HasColumnName("GameID");

                entity.Property(e => e.Aquisicao).HasColumnType("datetime");

                entity.Property(e => e.GeneroId).HasColumnName("GeneroID");

                entity.Property(e => e.Lancamento).HasColumnType("datetime");

                entity.Property(e => e.LocalAdq).HasMaxLength(100);

                entity.Property(e => e.Nome).HasMaxLength(350);

                entity.Property(e => e.Observacoes).HasMaxLength(300);

                entity.Property(e => e.Serial).HasMaxLength(15);           

                
            });

            modelBuilder.Entity<Ps4>(entity =>
            {
                entity.HasKey(e => e.GameId)
                    .HasName("PK__PS4__2AB897DD8467B9CF");

                entity.ToTable("PS4");

                entity.Property(e => e.GameId).HasColumnName("GameID");

                entity.Property(e => e.Aquisicao).HasColumnType("datetime");

                entity.Property(e => e.GeneroId).HasColumnName("GeneroID");

                entity.Property(e => e.Lancamento).HasColumnType("datetime");

                entity.Property(e => e.LocalAdq).HasMaxLength(100);

                entity.Property(e => e.Nome).HasMaxLength(350);

                entity.Property(e => e.Observacoes).HasMaxLength(300);

                entity.Property(e => e.Ps4pro).HasColumnName("PS4Pro");

                entity.Property(e => e.Serial).HasMaxLength(15);

            

         
            });

            modelBuilder.Entity<Regiao>(entity =>
            {
                entity.ToTable("Regiao");

                entity.Property(e => e.RegiaoNome)
                    .HasMaxLength(3)
                    .HasColumnName("Regiao");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
