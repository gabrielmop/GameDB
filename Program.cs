using GameDB.DataContext;
using GameDB.Repository.Consoles;
using GameDB.Repository.Interface.Consoles;
using GameDB.Repository.Interface.Structure;
using GameDB.Repository.Structure;
using GameDB.Services.Interface.Structure;
using GameDB.Services.Consoles;
using GameDB.Services.Interfaces.Consoles;
using GameDB.Services.Interfaces.Struture;
using GameDB.Services.Structure;
using GameDB.Services.Interfaces.IStruture;
using Microsoft.OpenApi.Models;
using GameDB.Models.Consoles;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddControllersWithViews();
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
    {
    // Adiciona múltiplas definições (versões ou esquemas)
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Version = "v1",
        Title = "Consoles",
        Description = "Controllers Dos Consoles"
    });

    c.SwaggerDoc("v2", new OpenApiInfo
    {
        Version = "v2",
        Title = "Structure",
        Description = "Controllers das Structures"
    });

        // Configuração para filtrar por versão
        c.DocInclusionPredicate((version, apiDescription) =>
        {
            var groupName = apiDescription.GroupName;
            return groupName != null && groupName == version;
        });
    });



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
builder.Services.AddTransient<IPublicanteRepository, PublicanteRepository>();
builder.Services.AddTransient<IPublicanteService, PublicanteService>();
builder.Services.AddTransient<IDesenvolvedoraRepository, DesenvolvedoraRepository>();
builder.Services.AddTransient<IDesenvolvedoraService, DesenvolvedoraService>();
builder.Services.AddTransient<IDigital_IndexRepository, Digital_IndexRepository>();
builder.Services.AddTransient<IDigital_IndexService, Digital_IndexService>();

//Construtor dos Consoles

builder.Services.AddTransient<IPS3Repository, PS3Repository>();
builder.Services.AddTransient<IPS3Service, PS3Service>();
builder.Services.AddTransient<IPS4Repository, PS4Repository>();
builder.Services.AddTransient<IPS4Service, PS4Service>();
builder.Services.AddTransient<IJogosDigitaisRepository, JogosDigitaisRepository>();
builder.Services.AddTransient<IJogosDigitaisService, JogosDigitaisService>();






var app = builder.Build();


if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Consoles");
        c.SwaggerEndpoint("/swagger/v2/swagger.json", "Structure");
    });
}

app.UseHttpsRedirection();



app.UseAuthorization();

app.MapControllers();

app.Run();
