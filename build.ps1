param (
    [switch]$run
)

Write-Host "Сборка начата"

# Очистка папок перед сборкой
if (Test-Path -Path build) {
    Remove-Item -Recurse -Force build
}

if (Test-Path -Path bin) {
    Remove-Item -Recurse -Force bin
}

# Сборка
meson setup build/ --prefix $PWD/bin
meson compile -C build/
meson install -C build/

Write-Host "Сборка завершена"

# Запуск gestalt.exe, если передан соответствующий аргумент
if ($run) {
    $gestaltPath = Join-Path -Path build -ChildPath "gestalt.exe"
    if (Test-Path -Path $gestaltPath) {
        & $gestaltPath
        Write-Host "Запуск gestalt.exe завершен"
    } else {
        Write-Host "Файл gestalt.exe не найден в папке build"
    }
}
