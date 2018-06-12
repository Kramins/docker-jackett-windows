# escape=`

FROM microsoft/windowsservercore AS build
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ARG JACKETT_VERSION
ENV JACKETT_VERSION ${JACKETT_VERSION}

ADD https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VERSION}/Jackett.Binaries.Windows.zip C:\jackett.zip

RUN Expand-Archive -Path .\jackett.zip -DestinationPath C:\app\

FROM microsoft/windowsservercore AS final

COPY --from=build C:\app\Jackett C:\app

EXPOSE 9117
 
VOLUME [ "C:/config" ]
WORKDIR C:\app

CMD [ "JackettConsole.exe", "--DataFolder C:/config/ --ListenPublic --NoUpdates" ]
