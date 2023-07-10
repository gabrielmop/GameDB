using GameDB.DataContext;
using GameDB.Repository.Consoles;
using GameDB.Repository.Interface.Consoles;
using GameDB.Repository.Interface.Structure;
using GameDB.Repository.Structure;
using GameDB.Services.Consoles;
using GameDB.Services.Interfaces.Console;
using GameDB.Services.Interfaces.Consoles;
using GameDB.Services.Interfaces.Struture;
using GameDB.Services.Structure;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers().AddNewtonsoftJson();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddTransient<GameDBContext, GameDBContext>();
builder.Services.AddTransient<IGeneroRepository, GeneroRepository>();
builder.Services.AddTransient<IPlataformaRepository, PlataformaRepository>();
builder.Services.AddTransient<IregiaoRepository, RegiaoRepository>();
builder.Services.AddTransient<IPs3Repository, Ps3Repository>();
builder.Services.AddTransient<IPS3Service, Ps3Serivce>();
builder.Services.AddTransient<IPS4Repository, PS4Repository>();
builder.Services.AddTransient<IPS4Service, PS4Service>();
builder.Services.AddTransient<IlogRepository, LogRepository>();
builder.Services.AddTransient<IlogService, LogService>();
builder.Services.AddTransient<IN3DSRepository, N3DSRepository>();
builder.Services.AddTransient<IN3DSService, N3DSService>();
builder.Services.AddTransient<IEstadoRepository, EstadoRepository>();
builder.Services.AddTransient<IEstadoServices, EstadoService>();

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
