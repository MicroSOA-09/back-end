FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:7.0 as build
WORKDIR /src
COPY . .
WORKDIR /src/src
RUN dotnet restore Explorer.API/Explorer.API.csproj
RUN dotnet build Explorer.API/Explorer.API.csproj -c Release

FROM build as publish
RUN dotnet publish Explorer.API/Explorer.API.csproj -c Release -o /app/publish

ENV ASPNETCORE_URLS=http://+:80
FROM base AS final
COPY --from=publish /app .
WORKDIR /app/publish
ENTRYPOINT ["dotnet", "Explorer.API.dll"]


# STAGE ZA MIGRACIJU BAZE KOJU GAĐAMO KROZ MIGRATION-COMPOSE

# Following stages require to be run in network where database is running
# and currently BuildKit does not support running container during build
# in a custom network: https://github.com/moby/moby/issues/40379.
# Workaround is to build image and run the container from that image
# in desired network.

FROM build AS migration-base
ENV PATH="$PATH:/root/.dotnet/tools"
RUN dotnet tool install --global dotnet-ef --version 7.*

FROM migration-base AS execute-migration

ENV STARTUP_PROJECT=Explorer.API
ENV MIGRATION=Init
ENV DATABASE_SCHEMA=""
ENV DATABASE_HOST=""
ENV DATABASE_PASSWORD=""
ENV DATABASE_USERNAME=""

ENV STAKEHOLDERS_TARGET_PROJECT=Modules/Stakeholders/Explorer.Stakeholders.Infrastructure
ENV TOURS_TARGET_PROJECT=Modules/Tours/Explorer.Tours.Infrastructure
ENV BLOG_TARGET_PROJECT=Modules/Blog/Explorer.Blog.Infrastructure
ENV ENCOUNTERS_TARGET_PROJECT=Modules/Encounters/Explorer.Encounters.Infrastructure
ENV PAYMENTS_TARGET_PROJECT=Modules/Payments/Explorer.Payments.Infrastructure

CMD PATH="$PATH:/root/.dotnet/tools" && \
    dotnet ef migrations add "${MIGRATION}" \
        --context StakeholdersContext \
        --project "${STAKEHOLDERS_TARGET_PROJECT}" \
        --startup-project "${STARTUP_PROJECT}" && \
    dotnet ef database update \
        --context StakeholdersContext \
        --project "${STAKEHOLDERS_TARGET_PROJECT}" \
        --startup-project "${STARTUP_PROJECT}" && \
    dotnet ef migrations add "${MIGRATION}" \
        --context ToursContext \
        --project "${TOURS_TARGET_PROJECT}" \
        --startup-project "${STARTUP_PROJECT}" && \
    dotnet ef database update \
        --context ToursContext \
        --project "${TOURS_TARGET_PROJECT}" \
        --startup-project "${STARTUP_PROJECT}" && \
    dotnet ef migrations add "${MIGRATION}" \
        --context BlogContext \
        --project "${BLOG_TARGET_PROJECT}" \
        --startup-project "${STARTUP_PROJECT}" && \
    dotnet ef database update \
        --context BlogContext \
        --project "${BLOG_TARGET_PROJECT}" \
        --startup-project "${STARTUP_PROJECT}" && \
    dotnet ef migrations add "${MIGRATION}" \
        --context EncountersContext \
        --project "${ENCOUNTERS_TARGET_PROJECT}" \
        --startup-project "${STARTUP_PROJECT}" && \
    dotnet ef database update \
        --context EncountersContext \
        --project "${ENCOUNTERS_TARGET_PROJECT}" \
        --startup-project "${STARTUP_PROJECT}" && \
    dotnet ef migrations add "${MIGRATION}" \
        --context PaymentsContext \
        --project "${PAYMENTS_TARGET_PROJECT}" \
        --startup-project "${STARTUP_PROJECT}" && \
    dotnet ef database update \
        --context PaymentsContext \
        --project "${PAYMENTS_TARGET_PROJECT}" \
        --startup-project "${STARTUP_PROJECT}"