
# Import the dll as a module (https://github.com/frgnca/AudioDeviceCmdlets)
$executingScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$scriptPath = Join-Path $executingScriptDirectory "AudioDeviceCmdlets.dll"
Import-Module $scriptPath

# ID's of devices, manually set from Get-AudioDevice -List
$headsetId = "{0.0.0.00000000}.{23fa13ad-9a76-4650-984a-cfd303ad1d1d}"
$speakersId = "{0.0.0.00000000}.{62570bac-8404-4f40-941d-b6d9278dc923}"
# Get current device (-Playback gets default)
$currentDevice = Get-AudioDevice -Playback

if($currentDevice.ID -eq $headsetId) {
    Set-AudioDevice -ID $speakersId
} else {
    Set-AudioDevice -ID $headsetId 
}





