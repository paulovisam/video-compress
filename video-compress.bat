@echo off
title Video Compress
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
if not exist %SystemRoot%\System32\ffmpeg.exe (
    if not exist %SystemRoot%\System32\choco.exe (
        echo O Chocolatey não está instalado. Instalando Chocolatey...
        powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    )
    echo Instalando FFmpeg...
    choco install ffmpeg -y
)
set /p inputFilePath=Digite o caminho do arquivo de entrada:
set /p outputFilePath=Digite o caminho do arquivo de saida:
ffmpeg -i %inputFilePath% -vcodec libx265 -crf 28 %outputFilePath%
echo Compressão Finalizada!
pause