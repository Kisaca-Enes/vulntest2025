# Servis adı (örnek)
$serviceName = "TestZayifServis"

# Servisin exe dosyasının yolu (registry'den alıyoruz)
$svcPath = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName").ImagePath

Write-Host "Servis exe dosyası: $svcPath"

# Dosya erişim listesini al
$acl = Get-Acl $svcPath

# Everyone grubuna Yazma izni verme kuralı oluştur
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Everyone","Write","Allow")

# Yeni kuralı ACL'ye ekle
$acl.AddAccessRule($rule)

# Güncellenmiş ACL'yi dosyaya uygula
Set-Acl $svcPath $acl

Write-Host "[!] Everyone grubuna servis dosyasına yazma izni verildi!"
