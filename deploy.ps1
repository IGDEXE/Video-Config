# Configuracoes
$pastaDownloads = "$env:userprofile\Downloads"
$tipoArquivo = "mp4"
$termo = "yt1s.com -"
$pastaDestino = "$env:userprofile\OneDrive\Videos"

# Pega todos os nomes de arquivo
$nomes = Get-ChildItem -Path "$pastaDownloads" -Name -Include "*.$tipoArquivo"

# Para cada um dos arquivos, faz:
foreach ($nome in $nomes) {
    try {
        # Remove uma parte do nome
        $nomeAtualizado = $nome.replace("$termo",'')
        # Renomeia o arquivo
        Rename-Item -Path "$pastaDownloads/$nome" -NewName "$pastaDownloads/$nomeAtualizado" -Force
        # Move para a pasta correta
        Move-Item -Path "$pastaDownloads/$nome" -Destination "$pastaDestino/$nome" -Force
    }
    catch {
        $ErrorMessage = $_.Exception.Message
        Write-Host "Erro ao configurar o item: $nome"
        Write-Host $_.Exception.Message
    }
}