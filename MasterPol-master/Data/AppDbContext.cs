using System;
using System.Collections.Generic;
using MasterPol.Models;
using Microsoft.EntityFrameworkCore;

namespace MasterPol.Data;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<MaterialTypeImport> MaterialTypeImports { get; set; }

    public virtual DbSet<PartnerProductsImport> PartnerProductsImports { get; set; }

    public virtual DbSet<PartnersImport> PartnersImports { get; set; }

    public virtual DbSet<ProductTypeImport> ProductTypeImports { get; set; }

    public virtual DbSet<ProductsImport> ProductsImports { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=HOME-PC\\SQLEXPRESS;Database=MasterPol;Integrated Security=True;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<MaterialTypeImport>(entity =>
        {
            entity.HasKey(e => e.ТипМатериала);

            entity.ToTable("Material_type_import");

            entity.Property(e => e.ТипМатериала)
                .HasMaxLength(50)
                .HasColumnName("Тип_материала");
            entity.Property(e => e.ПроцентБракаМатериала).HasColumnName("Процент_брака_материала");
        });

        modelBuilder.Entity<PartnerProductsImport>(entity =>
        {
            entity.ToTable("Partner_products_import");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.ДатаПродажи).HasColumnName("Дата_продажи");
            entity.Property(e => e.Количество_продукции).HasColumnName("Количество_продукции");
            entity.Property(e => e.Наименование_партнера).HasColumnName("Наименование_партнера");
        });

        modelBuilder.Entity<PartnersImport>(entity =>
        {
            entity.HasKey(e => e.Наименование_партнера);

            entity.ToTable("Partners_import");

            entity.Property(e => e.Наименование_партнера)
                .HasMaxLength(50)
                .HasColumnName("Наименование_партнера");
            entity.Property(e => e.Инн)
                .HasColumnType("numeric(18, 0)")
                .HasColumnName("ИНН");
            entity.Property(e => e.Телефон_партнера).HasColumnName("Телефон_партнера");
            entity.Property(e => e.Тип_партнера).HasColumnName("Тип_партнера");
            entity.Property(e => e.ЭлектроннаяПочтаПартнера).HasColumnName("Электронная_почта_партнера");
            entity.Property(e => e.ЮридическийАдресПартнера).HasColumnName("Юридический_адрес_партнера");
        });

        modelBuilder.Entity<ProductTypeImport>(entity =>
        {
            entity.HasKey(e => e.ТипПродукции).HasName("PK_dbo.Product_type_import");

            entity.ToTable("Product_type_import");

            entity.Property(e => e.ТипПродукции)
                .HasMaxLength(50)
                .HasColumnName("Тип_продукции");
            entity.Property(e => e.КоэффициентТипаПродукции)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("Коэффициент_типа_продукции");
        });

        modelBuilder.Entity<ProductsImport>(entity =>
        {
            entity.HasKey(e => e.Артикул);

            entity.ToTable("Products_import");

            entity.Property(e => e.Артикул).ValueGeneratedNever();
            entity.Property(e => e.МинимальнаяСтоимостьДляПартнера)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("Минимальная_стоимость_для_партнера");
            entity.Property(e => e.НаименованиеПродукции).HasColumnName("Наименование_продукции");
            entity.Property(e => e.ТипПродукции).HasColumnName("Тип_продукции");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
