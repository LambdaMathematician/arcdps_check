$myFile = "C:\Program Files\Guild Wars 2\bin64\d3d9.dll"
"****************************************************************************************************
THIS SCRIPT WILL OVERWRITE $myFile.
IF THE ARCDPS DLL IS NAMED SOMETHING ELSE PLEASE MODIFY THE MYFILE VARIABLE IN THE SCRIPT ACCORDINGLY
****************************************************************************************************
Also note that if someone hacks the arcdps site and puts malicious code in the dll, it ain't my fault.
You probably would have just downloaded and ran it manually.
Feel free to delete these lines and in the script once you understand the risks."
Pause #Delete this if you want it to just run without interruption at the beginning

# Get the md5 of the installed arcdps
$md5Command = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$installed_hash = [System.BitConverter]::ToString($md5Command.ComputeHash([System.IO.File]::ReadAllBytes($myFile))).Replace("-","").ToLower()
"Installed Hash: $installed_hash"

# Get the md5 posted on the arcdps site
$web_hash = (Invoke-WebRequest 'https://www.deltaconnected.com/arcdps/x64/d3d9.dll.md5sum').ToString().Remove(32)
"Web Hash      : $web_hash"

If ($installed_hash -eq $web_hash) { echo "You are up to date" }
Else {
    echo "You are not up to date... Downloading"
    Invoke-WebRequest 'https://www.deltaconnected.com/arcdps/x64/d3d9.dll' -OutFile $myFile

    #make sure the download was good
    $installed_hash = [System.BitConverter]::ToString($md5Command.ComputeHash([System.IO.File]::ReadAllBytes($myFile))).Replace("-","").ToLower()

    If ($installed_hash -eq $web_hash) {"Validated download. You are now up to date."}
    Else {
		"MD5 of downloaded file does not match published MD5 sum."
	    "Possible reason:"
	    "    Could not write to $myFile. Run again as admin/Grant permission to write to the folder."
	    "    Download was corrupted somehow. Run again."
	    "    New MD5 sum was not published. Extremely unlikely. Proceed with caution."
	    }
    }
Pause