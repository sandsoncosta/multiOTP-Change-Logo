# Solicita os paths de I/O
$inputImage = Read-Host "Digite o caminho completo da imagem de entrada"

# Define a chave de registro
$registryPath = "HKCR:\CLSID\{FCEFDFAB-B0A1-4C4D-8B2B-4FF4E0A3D978}"
$registryName = "v1_bitmap_path"
$registryValue = $inputImage

# Garante que a chave existe
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Define o valor
Set-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue

Write-Host "Chave de registro configurada e imagem alterada com sucesso."
