using GameDB.DataContext;
using GameDB.Repository;
using GameDB.Repository.Interface;
using GameDB.Services;
using GameDB.Services.Interfaces;

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
builder.Services.AddTransient<IlogService, LogServices>();

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
