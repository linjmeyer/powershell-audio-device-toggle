
# Import the dll as a module (https://github.com/frgnca/AudioDeviceCmdlets)
$executingScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$scriptPath = Join-Path $executingScriptDirectory "AudioDeviceCmdlets.dll"
Import-Module $scriptPath

# ID's of devices, manually set from Get-AudioDevice -List
$headsetId = "{0.0.0.00000000}.{2fcd7156-328a-41ba-acf3-af2fc42544f3}"
$speakersId = "{0.0.0.00000000}.{9e87ac79-80a6-4f81-9db8-cf619002cefc}"
# Get current device (-Playback gets default)
$currentDevice = Get-AudioDevice -Playback
# Set new device to whatever isn't the default currently
Set-AudioDevice -ID $( If ($currentDevice.ID -eq $headsetId) {$speakersId} else {$headsetId} )