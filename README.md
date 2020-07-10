# arcdps_check
Made this for my guild and decided to throw it on github for their review and usage.

Compares the md5 of the installed d3d9.ll against the one posted in https://www.deltaconnected.com/arcdps/x64/d3d9.dll.md5sum, and downloads the updated version if they differ.

Download the arcdps_check.ps1 file somewhere convenient.

Once downloaded, right click it and select Run With Powershell.

If you don't have arcdps installed, this will install it.

If you'd like to have this as a scheduled task, check out https://social.technet.microsoft.com/wiki/contents/articles/38580.windows-task-scheduler-configure-to-run-a-powershell-script.aspx

Lines 2-10 in the script can be removed if you know the $myFile variable is correct.