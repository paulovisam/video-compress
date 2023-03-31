Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
if (!(Get-Command ffmpeg -ErrorAction SilentlyContinue)) {
   if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
       Write-Host "O Chocolatey não está instalado. Instalando Chocolatey..."
       Set-ExecutionPolicy Bypass -Scope Process -Force
       iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
   }
   Write-Host "Instalando FFmpeg..."
   choco install ffmpeg -y
}

$inputFilePath = Read-Host "Digite o caminho do arquivo de entrada: "
$outputFilePath = Read-Host "Digite o caminho do arquivo de saída: "
ffmpeg -i $inputFilePath -vcodec libx265 -crf 28 $outputFilePath
Read-Host -Prompt "Pressione Enter para sair"
