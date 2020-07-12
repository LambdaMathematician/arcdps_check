# arcdps_check
Made this for my guild and decided to throw it on github for their review and usage. Uses default paths and file names to work out of the box for most users.

Compares the md5 of the installed d3d9.ll against the one posted in https://www.deltaconnected.com/arcdps/x64/d3d9.dll.md5sum, and downloads the updated version if they differ. If you don't have arcdps installed, this will install it.

1. Click on the green Code button above to the right and select Download ZIP.
2. Open the zip file, go under arcdps_check-master, and place the arcdps_check.ps1 file somewhere convenient like your desktop.
3. To run the script, right click on arcdps_check.ps1 and select Run With Powershell.
4. Repeat Step 3. whenever you want to make sure you are running the latest arcdps.
5. (Optional) If you'd like to have this as a scheduled task, remove the lines tagged with #PAUSE and check out https://social.technet.microsoft.com/wiki/contents/articles/38580.windows-task-scheduler-configure-to-run-a-powershell-script.aspx

Lines 2-10 in the script can be removed if you know the $myFile variable is correct.
