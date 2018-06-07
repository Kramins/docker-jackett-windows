. .\config.ps1


$imageFullName = "$repo/$($ImageName):$JACKETT_VERSION-windowsservercore"
Write-Host `Building $imageFullName`
docker build --build-arg JACKETT_VERSION=$JACKETT_VERSION . -t $imageFullName
Write-Host "Tagging image as latest"
docker tag $imageFullName  "kramins/$($ImageName):latest"
