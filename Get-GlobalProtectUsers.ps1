function Get-GlobalProtectUsers {
    param (
        [Parameter(Mandatory = $True)]$Firewall,
        [Parameter(Mandatory = $True)]$APIKey
    )
    $URI = "https://$Firewall/api/?type=op&cmd=<show><global-protect-gateway><current-user/></global-protect-gateway></show>"

    $Response = Invoke-RestMethod -Uri $URI -Headers @{'X-PAN-KEY' = $APIKey } -SkipCertificateCheck

    $ActiveUsers = ($Response.response.result.entry)

    return $ActiveUsers

}
