#
# Node snapshot setup file
# https://github.com/turboapps/turbome/tree/master/node
#
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0

$content = (Invoke-WebRequest -URI "https://nodejs.org/en/download/").Content
$content -match "https://nodejs.org/dist/v(?<version>\d+.\d+.\d+)/node-v\k<version>-x86.msi" | Out-Null
if (-not $Matches) {
    Write-Error "Failed to find Node version"
    exit 1
}

$tag = $Matches['version']
Write-Host "Node version $tag"
"node/node:$tag" | Set-Content "image.txt"

(New-Object System.Net.WebClient).DownloadFile("https://nodejs.org/dist/v$tag/node-v$tag-x86.msi", "install.msi")

