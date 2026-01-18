# PowerShell script to download AWS icons from SimpleIcons CDN
$basePath = "src\dist\img\aws"
$icons = @(
    @{name="lambda"; url="https://cdn.simpleicons.org/awslambda/FF9900"},
    @{name="api-gateway"; url="https://cdn.simpleicons.org/amazonapigateway/FF4F8B"},
    @{name="dynamodb"; url="https://cdn.simpleicons.org/amazondynamodb/4053D6"},
    @{name="s3"; url="https://cdn.simpleicons.org/amazons3/569A31"},
    @{name="cognito"; url="https://cdn.simpleicons.org/amazoncognito/DD344C"},
    @{name="cloudwatch"; url="https://cdn.simpleicons.org/amazoncloudwatch/FF4F8B"},
    @{name="eventbridge"; url="https://cdn.simpleicons.org/amazoneventbridge/FF4F8B"}
)

foreach ($icon in $icons) {
    $outputFile = Join-Path $basePath "$($icon.name).svg"
    Write-Host "Downloading $($icon.name) to $outputFile..."
    try {
        Invoke-WebRequest -Uri $icon.url -OutFile $outputFile -ErrorAction Stop
        Write-Host "✓ Successfully downloaded $($icon.name)" -ForegroundColor Green
    }
    catch {
        Write-Host "✗ Failed to download $($icon.name): $_" -ForegroundColor Red
    }
}

Write-Host "`nDone!" -ForegroundColor Cyan
