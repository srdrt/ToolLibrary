FROM microsoft/dotnet:2.2-sdk-stretch AS build
WORKDIR /src
COPY ["Sample/Sample.csproj", "Sample/"]
RUN dotnet restore "Sample/Sample.csproj"
COPY . .
WORKDIR "/src/Sample"
RUN dotnet build "Sample.csproj" -c Debug -o /app

FROM build AS publish
RUN dotnet publish "Sample.csproj" --no-restore --self-contained false -c Debug -o /app

FROM microsoft/dotnet:2.2-aspnetcore-runtime-stretch-slim AS base
WORKDIR /app
COPY --from=publish /app . 

EXPOSE 80
EXPOSE 443

ENV DOTNET_RUNNING_IN_CONTAINER=true
ENV DOTNET_USE_POLLING_FILE_WATCHER=true
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_URLS="https://+;http://+"
ENV ASPNETCORE_HTTPS_PORT=443

FROM base AS final
WORKDIR /app

ENTRYPOINT ["dotnet","Sample.dll"]
