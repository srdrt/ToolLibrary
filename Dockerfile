FROM microsoft/dotnet:2.2-sdk-stretch AS build
WORKDIR /src
COPY ["Sample/Sample.csproj", "Sample/"]
RUN dotnet restore "Sample/Sample.csproj"
COPY . .
WORKDIR "/src/Sample"
RUN dotnet build "Sample.csproj" --no-restore -c Debug -o /app

FROM build AS publish
RUN dotnet publish "Sample.csproj" --no-restore --self-contained false -c Debug -o /app

FROM microsoft/dotnet:2.2-aspnetcore-runtime-stretch-slim AS base
WORKDIR /app
COPY --from=publish /app . 

EXPOSE 80

ENV ASPNETCORE_ENVIRONMENT Development
ENV DOTNET_RUNNING_IN_CONTAINER=true
ENV DOTNET_USE_POLLING_FILE_WATCHER=true

RUN mkdir -p /usr/local/share/ca-certificates/ && cp ca.crt /usr/local/share/ca-certificates/kubernetes_ca.crt
RUN chmod 777 /usr/local/share/ca-certificates/kubernetes_ca.crt
RUN update-ca-certificates --fresh

FROM base AS final
WORKDIR /app

ENTRYPOINT ["dotnet","Sample.dll"]
