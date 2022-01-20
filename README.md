# arcdps_check
Made this for my guild and decided to throw it on github for their review and usage. Uses default paths and file names to work out of the box for most users.

Compares the md5 of the installed d3d9.ll against the one posted in https://www.deltaconnected.com/arcdps/x64/d3d9.dll.md5sum, and downloads the updated version if they differ. If you don't have arcdps installed, this will install it.

1. Click on the green Code button above to the right and select Download ZIP.
2. Open the zip file, go into arcdps_check-master folder
3. Place the arcdps_check.ps1 file somewhere convenient like your desktop (.ps1 may not be visible if file extensions are hidden).
4. If arcdps is named something else or gw2 lives somewhere else (because other addons or other strange configuration), right click on arcdps_check.ps1, edit, and adjust the $dx9path and $dx11path variables accordingly.
5. To run the script, right click on arcdps_check.ps1 and select Run With Powershell. Select the install option when prompted. Wheeeeeeee.
6. Repeat Step 5 whenever you want to make sure you are running the latest arcdps.
7. (Optional) If you know what install option you want every time and just want it to do it without asking questions, edit the file (right click -> edit), change $false in line 3 to $true and make sure the $default_choice is what you want. If you want to go further and make it a scheduled task, check out https://social.technet.microsoft.com/wiki/contents/articles/38580.windows-task-scheduler-configure-to-run-a-powershell-script.aspx
