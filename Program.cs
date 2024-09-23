using GameDB.DataContext;
using GameDB.Repository.Consoles;
using GameDB.Repository.Interface.Consoles;
using GameDB.Repository.Interface.Structure;
using GameDB.Repository.Structure;
using GameDB.Services.Interface.Structure;
using GameDB.Services.Consoles;
using GameDB.Services.Interfaces.Console;
using GameDB.Services.Interfaces.Consoles;
using GameDB.Services.Interfaces.Struture;
using GameDB.Services.Structure;
using GameDB.Services.Interfaces.IStruture;
using Microsoft.AspNetCore.JsonPatch;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllersWithViews();
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//Construtor das Structures
builder.Services.AddTransient<GameDBContext, GameDBContext>();
builder.Services.AddTransient<IGeneroRepository, GeneroRepository>();
builder.Services.AddTransient<IGeneroService, GeneroService>();
builder.Services.AddTransient<IPlataformaRepository, PlataformaRepository>();
builder.Services.AddTransient<IPlataformaService, PlataformaService>();
builder.Services.AddTransient<IregiaoRepository, RegiaoRepository>();
builder.Services.AddTransient<IRegiaoService, RegiaoService>();
builder.Services.AddTransient<IlogRepository, LogRepository>();
builder.Services.AddTransient<IlogService, LogService>();
builder.Services.AddTransient<IEstadoRepository, EstadoRepository>();
builder.Services.AddTransient<IEstadoServices, EstadoService>();

//Construtor dos Consoles

builder.Services.AddTransient<IPs3Repository, Ps3Repository>();
builder.Services.AddTransient<IPS3Service, Ps3Serivce>();




var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();



app.UseAuthorization();

app.MapControllers();

app.Run();
