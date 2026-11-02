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
    switch ($args[0]) {
        "on" {
            $ENV:HTTP_PROXY  = "http://127.0.0.1:7890"
            $ENV:HTTPS_PROXY = "http://127.0.0.1:7890"
            Write-Host "Proxy Enabled!" -ForegroundColor Green
        }
        "off" {
            $ENV:HTTP_PROXY  = $null
            $ENV:HTTPS_PROXY = $null
            Write-Host "Proxy Disabled!" -ForegroundColor Yellow
        }
        "status" {
            $http  = $ENV:HTTP_PROXY
            $https = $ENV:HTTPS_PROXY

            if ([string]::IsNullOrWhiteSpace($http) -and [string]::IsNullOrWhiteSpace($https)) {
                Write-Host "Proxy Status: OFF" -ForegroundColor Yellow
            }
            else {
                Write-Host "Proxy Status: ON" -ForegroundColor Green
                Write-Host "  HTTP_PROXY  = $http"
                Write-Host "  HTTPS_PROXY = $https"
            }
        }
        default {
            Write-Host "Usage: proxy [on|off|status]" -ForegroundColor Cyan
        }
    }
}

# Environment Variables
$ENV:CC = "gcc"
## Yazi: relying on `file` to detect the mime-type of the file.
$ENV:YAZI_FILE_ONE = "D:\\Scoop\\apps\\git\\current\\usr\\bin\\file.exe"
