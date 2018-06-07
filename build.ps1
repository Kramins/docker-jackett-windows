$ErrorActionPreference = "Stop"
. .\build.config.ps1

$JACKETT_VERSION = $env:DOCKER_APPLICATION_VERSION

$imageFullName = ("{0}/{1}:{2}-windowsservercore" -f $env:DOCKER_REPO, $env:DOCKER_IMAGE, $env:DOCKER_APPLICATION_VERSION)
$imageLatestName = ("{0}/{1}:latest" -f $env:DOCKER_REPO, $env:DOCKER_IMAGE)

Write-Host `Building $imageFullName`
docker build --build-arg JACKETT_VERSION=$JACKETT_VERSION . -t $imageFullName

Write-Host "Tagging $imageLatestName"
docker tag $imageFullName  $imageLatestName