# Alias
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name grep -Value findstr

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Proxy
function proxy {
    if ($args[0] -eq "on") {
        $ENV:HTTP_PROXY = "http://127.0.0.1:7890"
        $ENV:HTTPS_PROXY = "http://127.0.0.1:7890"
        Write-Host "Proxy Enabled!" -ForegroundColor Green
    }
    if ($args[0] -eq "off") {
        $ENV:HTTP_PROXY = $NULL
        $ENV:HTTPS_PROXY = $NULL
        Write-Host "Proxy Disabled!" -ForegroundColor Yellow
    }
}

# Environment Variables
$Env:CC = "gcc"
