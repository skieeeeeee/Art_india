$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}

$urls = @(
    'http://artindiatex.com/example/i/01.jpg',
    'http://artindiatex.com/example/i/02.jpg',
    'http://artindiatex.com/example/i/03.jpg',
    'http://artindiatex.com/images/9000-2008.jpg',
    'http://artindiatex.com/images/newcb1.jpg',
    'http://artindiatex.com/images/bg.gif'
)

New-Item -ItemType Directory -Force -Path "c:\Users\akash\Art India\assets\images" | Out-Null
New-Item -ItemType Directory -Force -Path "c:\Users\akash\Art India\assets\images\thumbs" | Out-Null

foreach ($url in $urls) {
    $filename = Split-Path $url -Leaf
    Write-Host "Downloading $filename..."
    Invoke-WebRequest -Uri $url -OutFile "c:\Users\akash\Art India\assets\images\$filename"
}

for ($i = 1; $i -le 22; $i++) {
    $num = "{0:D2}" -f $i
    $url = "http://artindiatex.com/example/i/thumbs/$num.jpg"
    Write-Host "Downloading thumb $num..."
    try {
        Invoke-WebRequest -Uri $url -OutFile "c:\Users\akash\Art India\assets\images\thumbs\$num.jpg"
    } catch {
        Write-Host "Failed to download $num.jpg"
    }
}
Write-Host "Done!"
