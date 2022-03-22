FROM mcr.microsoft.com/dotnet/sdk:6.0 AS base
ARG UNAME=user
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
WORKDIR /app

FROM base as dev
RUN apt-get update && apt-get install -y \
    mono-devel
USER $UNAME:$UNAME

FROM base as build
USER $UNAME:$UNAME