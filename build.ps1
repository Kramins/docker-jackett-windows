$ErrorActionPreference = "Stop"
. .\build.config.ps1


$imageFullName = ("{0}/{1}:{2}-windowsservercore" -f $env:DOCKER_REPO, $env:DOCKER_IMAGE, $env:DOCKER_APPLICATION_VERSION)
$imageLatestName = ("{0}/{1}:latest" -f $env:DOCKER_REPO, $env:DOCKER_IMAGE)

Write-Host `Building $imageFullName`
docker build --build-arg $env:DOCKER_BUILD_ARGS . -t $imageFullName

Write-Host "Tagging $imageLatestName"
docker tag $imageFullName  $imageLatestName