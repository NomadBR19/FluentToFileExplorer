# fluentToExplorer

What is it ?
/ It's basically a .ps1 script that create RegisterKeys to set the Fluent Terminal by default.

How to ?
/ Open the .ps1 and replace the $fluentPath by your Fluent Terminal .exe path. It sould look like this : "C:\Users\"username"\AppData\Local\Microsoft\WindowsApps\53621FSApps.FluentTerminal_87x1pks76srcp\flute.exe"
/ Simply execute the .ps1 with powershell.

Try to run the .ps1 in admin if it dosn't work.

Who create Fluent Terminal ?
/ Find the Fluent Terminal project here : https://github.com/felixse/FluentTerminal

Features 
/ Open Fluent Terminal when :
- opening the CMD with Win + R
- executing "cmd" in your file explorer's path
- right clicking anywhere in your file explorer -> "Open Fluent Terminal here"
- Just delete the RegisterKeys to set the CMD by default