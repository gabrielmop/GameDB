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

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers().AddNewtonsoftJson();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//Construtor das Structure
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
builder.Services.AddTransient<IXbox360Repository, Xbox360Repository>();
builder.Services.AddTransient<IXbox360Service, Xbox360Serivce>();
builder.Services.AddTransient<IN3DSRepository, N3DSRepository>();
builder.Services.AddTransient<IN3DSService, N3DSService>();
builder.Services.AddTransient<IPs2Repository, Ps2Repository>();
builder.Services.AddTransient<IPS2Service, Ps2Serivce>();
builder.Services.AddTransient<IPs3Repository, Ps3Repository>();
builder.Services.AddTransient<IPS3Service, Ps3Serivce>();
builder.Services.AddTransient<IPS4Repository, PS4Repository>();
builder.Services.AddTransient<IPS4Service, PS4Service>();
builder.Services.AddTransient<IPS5Repository, PS5Repository>();
builder.Services.AddTransient<IPS5Service, PS5Service>();




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
