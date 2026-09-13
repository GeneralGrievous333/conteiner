# BUILD 
FROM mcr.microsoft.com/dotnet/sdk:10.0-noble AS build
WORKDIR /app


COPY ["conteiner/conteiner.csproj", "conteiner/"]
RUN dotnet restore "conteiner/conteiner.csproj"

COPY . .

RUN dotnet publish "conteiner/conteiner.csproj" \
    -c Release \
    -o /app/publish \
    --no-restore \
    /p:UseAppHost=false

# RUNTIME
FROM mcr.microsoft.com/dotnet/runtime:10.0-noble AS runtime
WORKDIR /app

RUN adduser --disabled-password --gecos "" appuser \
    && chown -R appuser /app
USER appuser

COPY --from=build --chown=appuser /app/publish .

ENV DOTNET_RUNNING_IN_CONTAINER=true

ENTRYPOINT ["dotnet", "conteiner.dll"]