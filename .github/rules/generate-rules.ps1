
# Ruta donde se creará .github/copilot-instructions.md
$rulesFile = ".github/copilot-instructions.md"


# Inicializa o limpia .github/copilot-instructions.md
"" | Out-File $rulesFile



# Obtener todos los archivos .md recursivamente, solo dentro de .github/rules, excepto .github/copilot-instructions.md
$mdFiles = Get-ChildItem -Path .github/rules -Filter *.md -Recurse | Where-Object { $_.FullName -ne (Resolve-Path $rulesFile) } | Sort-Object FullName


foreach ($f in $mdFiles) {
    # Añade el contenido del archivo
    Get-Content $f.FullName | Add-Content $rulesFile

    # Salto de línea extra entre archivos
    Add-Content $rulesFile "`n"
}

Write-Host "Se creó .github/copilot-instructions.md con $($mdFiles.Count) archivos .md."
