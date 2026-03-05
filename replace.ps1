$files = @(
    "c:\Users\akash\Art India\index.html", 
    "c:\Users\akash\Art India\about.html", 
    "c:\Users\akash\Art India\products.html", 
    "c:\Users\akash\Art India\certificates.html", 
    "c:\Users\akash\Art India\contact.html"
)

foreach ($f in $files) {
    if (Test-Path $f) {
        $content = Get-Content $f -Raw
        $content = $content -replace 'https://artindiatex\.com/example/i/thumbs/', 'assets/images/thumbs/'
        $content = $content -replace 'https://artindiatex\.com/example/i/', 'assets/images/'
        $content = $content -replace 'https://artindiatex\.com/images/', 'assets/images/'
        $content = $content -replace 'http://artindiatex\.com/example/i/thumbs/', 'assets/images/thumbs/'
        $content = $content -replace 'http://artindiatex\.com/example/i/', 'assets/images/'
        $content = $content -replace 'http://artindiatex\.com/images/', 'assets/images/'
        Set-Content -Path $f -Value $content
    }
}
Write-Host "Done"
