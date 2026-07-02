#Requires -RunAsAdministrator

function Set-ExecutionPolicyBypass {
    param([string]$Path)
    $currentPolicy = Get-ExecutionPolicy -Scope LocalMachine
    if ($currentPolicy -ne "Bypass") {
        Set-ExecutionPolicy Bypass -Scope LocalMachine -Force
    }
    $filePolicy = Get-Content -Path $Path -Raw | Out-String
    if ($filePolicy -match "Set-ExecutionPolicy.*Bypass") {
        return
    }
    $newContent = "Set-ExecutionPolicy Bypass -Scope Process -Force`n" + $filePolicy
    Set-Content -Path $Path -Value $newContent
}

Set-ExecutionPolicyBypass -Path "$PSScriptRoot\bootstrap.ps1"

Write-Host "== Bootstrap do novo projeto =="
$ PROJECT_NAME = Read-Host "Nome do projeto"
$ PROJECT_DESCRIPTION = Read-Host "Descrição curta do projeto"
$ CURRENT_DATE = Get-Date -Format "yyyy-MM-dd"

Write-Host "
Tipo de projeto:"
Write-Host "1) Web/Frontend"
Write-Host "2) Backend/API"
Write-Host "3) Full-stack (Web/Frontend + Backend/API)"
Write-Host "4) Dados/ML"
Write-Host "5) CLI"
Write-Host "6) Genérico (sem extra de stack)"
$ STACK_CHOICE = Read-Host "Escolha [1-6]"

function Copy-StackExtra {
    param([string]$stackDir, [string]$targetName)
    $sourcePath = "stacks/$stackDir/context-extra.md"
    $targetPath = ".ai-context/$targetName"
    if (Test-Path -LiteralPath $sourcePath) {
        Copy-Item -LiteralPath $sourcePath -Destination $targetPath
        Write-Host "Copiado contexto extra de: $stackDir"
    }
}

switch ($STACK_CHOICE) {
    "1" { Copy-StackExtra -stackDir "web-frontend" -targetName "06-stack-extra.md" }
    "2" { Copy-StackExtra -stackDir "backend-api" -targetName "06-stack-extra.md" }
    "3" {
        Copy-StackExtra -stackDir "web-frontend" -targetName "06-stack-extra-frontend.md"
        Copy-StackExtra -stackDir "backend-api" -targetName "06-stack-extra-backend.md"
    }
    "4" { Copy-StackExtra -stackDir "data-ml" -targetName "06-stack-extra.md" }
    "5" { Copy-StackExtra -stackDir "cli" -targetName "06-stack-extra.md" }
    "6" { Write-Host "Sem contexto extra de stack." }
    default { Write-Host "Opção inválida, seguindo sem contexto extra." }
}

Write-Host "
Substituindo placeholders..."
Get-ChildItem -File -Recurse -Filter "*.md" -Exclude "stacks*" | ForEach-Object {
    $filePath = $_.FullName
    $content = Get-Content -LiteralPath $filePath -Raw
    $content = $content -replace "{{PROJECT_NAME}}", $PROJECT_NAME
    $content = $content -replace "{{PROJECT_DESCRIPTION}}", $PROJECT_DESCRIPTION
    $content = $content -replace "{{DATE}}", $CURRENT_DATE
    Set-Content -LiteralPath $filePath -Value $content
}

$ REMOVE_STACKS = Read-Host "Remover a pasta stacks/ (não é mais necessária)? [y/N]"
if ($REMOVE_STACKS -match "^y(es)?$") {
    Remove-Item -LiteralPath "stacks" -Recurse -Force
    Write-Host "Pasta stacks/ removida."
}

$ INIT_GIT = Read-Host "Inicializar um novo repositório git aqui? [y/N]"
if ($INIT_GIT -match "^y(es)?$") {
    Remove-Item -LiteralPath ".git" -Recurse -Force -ErrorAction SilentlyContinue
    git init
    git add .
    git commit -m "chore: bootstrap do projeto $PROJECT_NAME"
    Write-Host "Repositório git inicializado com o primeiro commit."
}

Write-Host "
== Bootstrap concluído =="
Write-Host "Projeto: $PROJECT_NAME"
Write-Host "Descrição: $PROJECT_DESCRIPTION"