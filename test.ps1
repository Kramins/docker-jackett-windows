. .\build.config.ps1

$imageFullName = ("{0}/{1}:{2}-windowsservercore" -f $env:DOCKER_REPO, $env:DOCKER_IMAGE, $env:DOCKER_APPLICATION_VERSION)
Write-Host $imageFullName
docker run -v d:/temp/config/jackett:c:/config -p 9117:9117 --rm -it $imageFullName