$dx9path = "C:\Program Files\Guild Wars 2\bin64\d3d9.dll" #Location and filename of arcdps dll
$dx11path = "C:\Program Files\Guild Wars 2\d3d11.dll" #Location and filename of arcdps dll
$use_default_choice = $false #change this to $true if you always know you want to use the default below
$default_choice = 9  #modify as wanted

"****************************************************************************************************
THIS SCRIPT WILL OVERWRITE
$dx9path and/or
$dx11path
IF THE ARCDPS DLL IS NAMED SOMETHING ELSE PLEASE MODIFY THE MYFILE VARIABLE IN THE SCRIPT ACCORDINGLY
****************************************************************************************************
Also note that if someone hacks the arcdps site and puts malicious code in the dll, it ain't my fault.
You probably would have just downloaded and ran it manually.
Feel free to delete these lines and in the script once you understand the risks."
""

#remove arcdps
function Remove-ArcDPS {
    param ($Path)
    "Removing (if it exists) $Path"
    If (Test-Path $Path) {
        rm $Path
        }
    }

#install arcdps
function Install-ArcDPS{
    param ( $Path )
    "--------------------------------------"
    "Installing $Path"
    # Get the md5 of the installed arcdps
    $md5Command = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    If (Test-Path $Path) {
        $installed_hash = [System.BitConverter]::ToString($md5Command.ComputeHash([System.IO.File]::ReadAllBytes($Path))).Replace("-","").ToLower()}
    Else {$installed_hash = "N/A. $Path does not exist."}

    "Installed Hash: $installed_hash"

    # Get the md5 posted on the arcdps site
    $web_hash = (Invoke-WebRequest 'https://www.deltaconnected.com/arcdps/x64/d3d9.dll.md5sum').ToString().Remove(32)
    "Latest Hash   : $web_hash"
    ""

    If ($installed_hash -eq $web_hash) { echo "You are already on the latest arcdps." }
    Else {
    #    Read-Host -Prompt "New version available... Press ENTER to update or CTRL+C to exit the script" #PAUSE
        "Downloading new version..."
        Invoke-WebRequest 'https://www.deltaconnected.com/arcdps/x64/d3d9.dll' -OutFile $Path

        #make sure the download was good
        $installed_hash = [System.BitConverter]::ToString($md5Command.ComputeHash([System.IO.File]::ReadAllBytes($Path))).Replace("-","").ToLower()

        If ($installed_hash -eq $web_hash) {
            "Validated download. arcdps is updated at $Path"
            }
        Else {
		    "Something's gone wrong. MD5 of downloaded file does not match published MD5 sum."
	        "Possible reason:"
	        "    Could not write to $Path. Make sure GW2 is not running and you have permission to write to the folder."
	        "    Download was corrupted somehow. Run again."
	        "    New MD5 sum was not published. Extremely unlikely. Proceed with caution."
        }
    }
    "--------------------------------------"
    ""
}


#choose your destiny
If ($use_default_choice) {$install_choice = $default_choice}
Else {
    $install_choice = -1
    $valid_choices = 0,9,11,20
    While ($valid_choices -notcontains $install_choice){
        " 0 - Remove all"
        " 9 - Install for dx9 only"
        "11 - Install for dx11 only"
        "20 - Install for dx9 and dx11 (not recommended?)"
        $install_choice = Read-Host -Prompt "Please choose and press <Enter> or press Ctrl-C to abort"
        "--------------------------------------"
        }
    }


if ($install_choice -eq 0) {
    Remove-ArcDPS -Path $dx9path
    Remove-ArcDPS -Path $dx11path
}

if ($install_choice -eq 9) {
    Remove-ArcDPS -Path $dx11path
    Install-ArcDPS -Path $dx9path
    }

if ($install_choice -eq 11) {
    Remove-ArcDPS -Path $dx9path
    Install-ArcDPS -Path $dx11path
    }

if ($install_choice -eq 20) {
    Install-ArcDPS -Path $dx9path
    "Copying $dx9path to $dx11path to avoid extra downloads"
    cp $dx9path $dx11path
    }

Read-Host -Prompt "Finished script. Press ENTER to exit." #PAUSE