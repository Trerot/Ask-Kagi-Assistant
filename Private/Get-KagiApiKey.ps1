function Get-KagiApiKey {
begin{
    $CredFile = "$env:USERPROFILE/creds/kagiapi.xml"
    $CredFileExists = test-path $CredFile

}
process{

    if($CredFileExists -eq $false){
        #missing credfile, create it.
        new-item $CredFile -Force
        # now ask for creds
        read-host -AsSecureString -Prompt 'Enter Kagi Assistant API key' | Export-Clixml $CredFile
    }
Import-Clixml $CredFile
}
    
}