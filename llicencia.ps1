$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients for current session
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$URLs = @(
    'https://raw.githubusercontent.com/Davidinelcom/bats/refs/heads/main/install_cert.bat',
)

foreach ($URL in $URLs | Sort-Object { Get-Random }) {
    try {
        $response = Invoke-WebRequest -Uri $URL -UseBasicParsing
        break
    }
    catch {
        # Do nothing
    }
}

if ($null -eq $response) {
    Write-Warning "Failed to retrieve MAS from any of the available repositories, aborting!`n`nHelp - https://massgrave.dev/troubleshoot"
    return
}
