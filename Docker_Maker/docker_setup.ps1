# Definir el directorio base
[string]$directorio_bbdd = Join-Path $env:USERPROFILE "d20cards"

# Crear función para copiar archivos
function CopiarArchivos {
    Copy-Item -Path ".\docker-compose.yml" -Destination "$directorio_bbdd" -Force
    Copy-Item -Path ".\.env" -Destination "$directorio_bbdd" -Force
}

# Verificar si el directorio existe
if (!(Test-Path -Path $directorio_bbdd)) {
    New-Item -ItemType Directory -Path $directorio_bbdd -Force
    CopiarArchivos
} else {
    # Limpiar el contenido del directorio
    Remove-Item -Path "$directorio_bbdd\*" -Recurse -Force
    CopiarArchivos
}
Set-Location -Path $directorio_bbdd
# Crear el contenido del archivo setup.ps1
[string]$volcado = @"
docker network create d20-network
docker-compose up --build
docker-compose up -d
"@

# Escribir el contenido en el archivo setup.ps1
Set-Content -Path "$directorio_bbdd\setup.ps1" -Value $volcado

# Ejecutar el script setup.ps1 con PowerShell
Start-Process -FilePath "powershell.exe" -ArgumentList "-File `"$directorio_bbdd\setup.ps1`""
