@echo off 
:start
echo 卸载前请关闭杀毒软件，因为该程序调用的部分系统进程，甚至是程序本体，都可能会被误杀
pause
echo 正在做卸载 Microsoft Edge前准备...
cls & taskkill /t /f /im widgets.exe
cls & taskkill /t /f backgroundTaskHost.exe
cls & taskkill /f /t /im msedge.exe
cls & taskkill /f /t /im MicrosoftEdgeUpdate.exe
cd /d "%~dp0"
CLS
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /v NoRemove /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft EdgeWebView" /v NoRemove /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /v NoRemove /t REG_DWORD /d 0 /f
CLS
%b2eincfilepath%/install_wim_tweak.exe /o /l
%b2eincfilepath%/install_wim_tweak.exe /o /c Microsoft-Windows-Internet-Browser-Package /r
%b2eincfilepath%/install_wim_tweak.exe /h /o /l
CLS
echo 已修复小写无法卸载的问题，你可以在这里输入小写字母了！
set "请问你的系统盘是 %SYSTEMDRIVE% 么？=" & echo 对（Y） & echo 错（N）
set /P EdgeFilesDrive=请问你的系统盘是 %SYSTEMDRIVE% 么？:
if "%EdgeFilesDrive%"=="Y" cls & cd %HOMEPATH%\AppData\Local\Microsoft\EdgeWebView\Application\*.0.* & .\msedgewebview2.exe -uninstall -system-level -verbose-logging -force-uninstall & cls & echo 由于Microsoft的限制，所以请进入控制面板卸载WebView（Microsoft Edge WebView2 Runtime） & echo 请卸载后按任意键再继续卸载！请卸载Microsoft Edge WebView2 Runtime后再继续卸载！如果无法卸载（卸载点击无反应），那么直接继续下一步即可 & rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl & @pause & %EdgeFilesDrive% & cd "%EdgeFilesDrive%\Program Files (x86)\Microsoft\EdgeCore\*.0.*\Installer" & .\setup.exe -uninstall -system-level -verbose-logging -force-uninstall & cd "%EdgeFilesDrive%\Program Files (x86)\Microsoft\EdgeWebView\Application\*.0.*" & .\msedgewebview2.exe -uninstall -system-level -verbose-logging -force-uninstall & cd "%EdgeFilesDrive%\Program Files (x86)\Microsoft\Edge\Application\*.0.*\Installer" & .\setup.exe -uninstall -system-level -verbose-logging -force-uninstall & rd /s /q "%EdgeFilesDrive%\Program Files (x86)\Microsoft" & rd /s /q "%EdgeFilesDrive%\Users\Admin\AppData\Local\Microsoft\Edge" & rd /s /q "%EdgeFilesDrive%\ProgramData\Microsoft\EdgeUpdate" & takeown /f %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeBCHost.exe & takeown /f %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeCP.exe & takeown /f %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeDevTools.exe & takeown /f %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeSH.exe & takeown /f "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-100_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-100.png" & takeown /f "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_x64__8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-200.png" & takeown /f "%EdgeFilesDrive%\Program Files\WindowsApps\Clipchamp.Clipchamp_2.2.8.0_neutral__yxz26nhyzhsrt\Runtimes\MicrosoftEdgeWebview2Setup.exe" & takeown /f "%EdgeFilesDrive%\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" & takeown /f "%EdgeFilesDrive%\Program Files\WindowsApps\MicrosoftWindows.Client.WebExperience_421.20070.195.0_x64__cw5n1h2txyewy\Dashboard\WebView2Loader.dll" & takeown /f "%EdgeFilesDrive%\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" & cacls %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeBCHost.exe /p everyone:f /e & cacls %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeCP.exe /p everyone:f /e & cacls %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeDevTools.exe /p everyone:f /e & cacls %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeSH.exe /p everyone:f /e & cacls "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-100_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-100.png" /p everyone:f /e & cacls "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_x64__8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-200.png" /p everyone:f /e & cacls "%EdgeFilesDrive%\Program Files\WindowsApps\Clipchamp.Clipchamp_2.2.8.0_neutral__yxz26nhyzhsrt\Runtimes\MicrosoftEdgeWebview2Setup.exe" /p everyone:f /e & cacls "%EdgeFilesDrive%\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" /p everyone:f /e & cacls "%EdgeFilesDrive%\Program Files\WindowsApps\MicrosoftWindows.Client.WebExperience_421.20070.195.0_x64__cw5n1h2txyewy\Dashboard\WebView2Loader.dll"  /p everyone:f /e & cacls "%EdgeFilesDrive%\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png"  /p everyone:f /e & del %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeBCHost.exe & del %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeCP.exe & del %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeDevTools.exe & del %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeSH.exe & del "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-100_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-100.png" & del "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_x64__8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-200.png" & del "%EdgeFilesDrive%\Program Files\WindowsApps\Clipchamp.Clipchamp_2.2.8.0_neutral__yxz26nhyzhsrt\Runtimes\MicrosoftEdgeWebview2Setup.exe" & del "%EdgeFilesDrive%\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" & del "%EdgeFilesDrive%\Program Files\WindowsApps\MicrosoftWindows.Client.WebExperience_421.20070.195.0_x64__cw5n1h2txyewy\Dashboard\WebView2Loader.dll" & del "%EdgeFilesDrive%\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" & rd /s /q "%EdgeFilesDrive%\Users\Administrator\AppData\Local\Microsoft\Internet Explorer\Indexed DB\EDGE" rd /s /q "%EdgeFilesDrive%\Program Files (x86)\Microsoft\EdgeWebView" & rd /s /q "%EdgeFilesDrive%\Administrator\Desktop\EdgeUpdate 1" & rd /s /q "%EdgeFilesDrive%\Internet 临时文件\IE\3MXLTGBM" & rd /s /q "%EdgeFilesDrive%\Program Files (x86)\Microsoft" & del "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.LanguageExperiencePackzh-CN_22621.9.50.0_neutral__8wekyb3d8bbwe\windows\System32\Dism\zh-CN\c15cf26162248a030c229312f4f7709c\EdgeProvider.dll.mui" & rd /s /q "%EdgeFilesDrive%\Program Files (x86)\Microsoft" & rd /s /q "%EdgeFilesDrive%\Program Files\Microsoft" & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\Edge & taskkill /im MicrosoftEdgeUpdate.exe /f & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\EdgeUpdate & cd %HOMEPATH%\AppData\Local\Microsoft\EdgeCore\*.0.*\Installer & .\setup.exe -uninstall -system-level -verbose-logging -force-uninstall & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\EdgeCore & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\EdgeWebView & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\EdgeUpdate & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\Edge & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\EdgeCore
if "%EdgeFilesDrive%"=="y" cls & cd %HOMEPATH%\AppData\Local\Microsoft\EdgeWebView\Application\*.0.* & .\msedgewebview2.exe -uninstall -system-level -verbose-logging -force-uninstall & cls & echo 由于Microsoft的限制，所以请进入控制面板卸载WebView（Microsoft Edge WebView2 Runtime） & echo 请卸载后按任意键再继续卸载！请卸载Microsoft Edge WebView2 Runtime后再继续卸载！如果无法卸载（卸载点击无反应），那么直接继续下一步即可 & rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl & @pause & %EdgeFilesDrive% & cd "%EdgeFilesDrive%\Program Files (x86)\Microsoft\EdgeCore\*.0.*\Installer" & .\setup.exe -uninstall -system-level -verbose-logging -force-uninstall & cd "%EdgeFilesDrive%\Program Files (x86)\Microsoft\EdgeWebView\Application\*.0.*" & .\msedgewebview2.exe -uninstall -system-level -verbose-logging -force-uninstall & cd "%EdgeFilesDrive%\Program Files (x86)\Microsoft\Edge\Application\*.0.*\Installer" & .\setup.exe -uninstall -system-level -verbose-logging -force-uninstall & rd /s /q "%EdgeFilesDrive%\Program Files (x86)\Microsoft" & rd /s /q "%EdgeFilesDrive%\Users\Admin\AppData\Local\Microsoft\Edge" & rd /s /q "%EdgeFilesDrive%\ProgramData\Microsoft\EdgeUpdate" & takeown /f %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeBCHost.exe & takeown /f %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeCP.exe & takeown /f %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeDevTools.exe & takeown /f %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeSH.exe & takeown /f "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-100_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-100.png" & takeown /f "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_x64__8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-200.png" & takeown /f "%EdgeFilesDrive%\Program Files\WindowsApps\Clipchamp.Clipchamp_2.2.8.0_neutral__yxz26nhyzhsrt\Runtimes\MicrosoftEdgeWebview2Setup.exe" & takeown /f "%EdgeFilesDrive%\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" & takeown /f "%EdgeFilesDrive%\Program Files\WindowsApps\MicrosoftWindows.Client.WebExperience_421.20070.195.0_x64__cw5n1h2txyewy\Dashboard\WebView2Loader.dll" & takeown /f "%EdgeFilesDrive%\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" & cacls %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeBCHost.exe /p everyone:f /e & cacls %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeCP.exe /p everyone:f /e & cacls %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeDevTools.exe /p everyone:f /e & cacls %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeSH.exe /p everyone:f /e & cacls "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-100_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-100.png" /p everyone:f /e & cacls "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_x64__8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-200.png" /p everyone:f /e & cacls "%EdgeFilesDrive%\Program Files\WindowsApps\Clipchamp.Clipchamp_2.2.8.0_neutral__yxz26nhyzhsrt\Runtimes\MicrosoftEdgeWebview2Setup.exe" /p everyone:f /e & cacls "%EdgeFilesDrive%\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" /p everyone:f /e & cacls "%EdgeFilesDrive%\Program Files\WindowsApps\MicrosoftWindows.Client.WebExperience_421.20070.195.0_x64__cw5n1h2txyewy\Dashboard\WebView2Loader.dll"  /p everyone:f /e & cacls "%EdgeFilesDrive%\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png"  /p everyone:f /e & del %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeBCHost.exe & del %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeCP.exe & del %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeDevTools.exe & del %EdgeFilesDrive%\Windows\System32\MicrosoftEdgeSH.exe & del "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-100_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-100.png" & del "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_x64__8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-200.png" & del "%EdgeFilesDrive%\Program Files\WindowsApps\Clipchamp.Clipchamp_2.2.8.0_neutral__yxz26nhyzhsrt\Runtimes\MicrosoftEdgeWebview2Setup.exe" & del "%EdgeFilesDrive%\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" & del "%EdgeFilesDrive%\Program Files\WindowsApps\MicrosoftWindows.Client.WebExperience_421.20070.195.0_x64__cw5n1h2txyewy\Dashboard\WebView2Loader.dll" & del "%EdgeFilesDrive%\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" & rd /s /q "%EdgeFilesDrive%\Users\Administrator\AppData\Local\Microsoft\Internet Explorer\Indexed DB\EDGE" rd /s /q "%EdgeFilesDrive%\Program Files (x86)\Microsoft\EdgeWebView" & rd /s /q "%EdgeFilesDrive%\Administrator\Desktop\EdgeUpdate 1" & rd /s /q "%EdgeFilesDrive%\Internet 临时文件\IE\3MXLTGBM" & rd /s /q "%EdgeFilesDrive%\Program Files (x86)\Microsoft" & del "%EdgeFilesDrive%\Program Files\WindowsApps\Microsoft.LanguageExperiencePackzh-CN_22621.9.50.0_neutral__8wekyb3d8bbwe\windows\System32\Dism\zh-CN\c15cf26162248a030c229312f4f7709c\EdgeProvider.dll.mui" & rd /s /q "%EdgeFilesDrive%\Program Files (x86)\Microsoft" & rd /s /q "%EdgeFilesDrive%\Program Files\Microsoft" & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\Edge & taskkill /im MicrosoftEdgeUpdate.exe /f & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\EdgeUpdate & cd %HOMEPATH%\AppData\Local\Microsoft\EdgeCore\*.0.*\Installer & .\setup.exe -uninstall -system-level -verbose-logging -force-uninstall & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\EdgeCore & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\EdgeWebView & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\EdgeUpdate & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\Edge & rd /s /q %HOMEPATH%\AppData\Local\Microsoft\EdgeCore
cls
echo C盘（C） & echo D盘（D） & echo E盘（E） & echo F盘（F） & echo G盘（G） & echo H盘（H） & echo I盘（I） & echo J盘（J） & echo K盘（K） & echo L盘（L） & echo M盘（M） & echo N盘（N） & echo O盘（O） & echo P盘（P） & echo Q盘（Q） & echo R盘（R） & echo S盘（S） & echo T盘（T） & echo U盘（U） & echo V盘（V） & echo W盘（W） & echo X盘（X） & echo Y盘（Y） & echo Z盘（Z） & echo 如果前面卸载过了，这里请直接回车 & echo （如果你的系统是Windows10的话，卸载速度会比较慢，没有提示卸载完成请不要关闭程序！）   
set /P pf=请输入Edge的所在的磁盘:
if "%pf%"=="" (
cls
) else cd %pf%:\AppData\Local\Microsoft\EdgeWebView\Application\*.0.* & .\msedgewebview2.exe -uninstall -system-level -verbose-logging -force-uninstall & echo 由于Microsoft的限制，所以请进入控制面板卸载WebView（Microsoft Edge WebView2 Runtime） & echo 请卸载后按任意键再继续卸载！请卸载Microsoft Edge WebView2 Runtime后再继续卸载！如果无法卸载（卸载点击无反应），那么直接继续下一步即可 & rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl & @pause & C: & cd "%pf%:\Program Files (x86)\Microsoft\EdgeCore\*.0.*\Installer" & .\setup.exe -uninstall -system-level -verbose-logging -force-uninstall & cd "%pf%:\Program Files (x86)\Microsoft\EdgeWebView\Application\*.0.*" & .\msedgewebview2.exe -uninstall -system-level -verbose-logging -force-uninstall & cd "%pf%:\Program Files (x86)\Microsoft\Edge\Application\*.0.*\Installer" & .\setup.exe -uninstall -system-level -verbose-logging -force-uninstall & rd /s /q "%pf%:\Program Files (x86)\Microsoft" & rd /s /q "%pf%:\Users\Admin\AppData\Local\Microsoft\Edge" & rd /s /q "%pf%:\ProgramData\Microsoft\EdgeUpdate" & takeown /f %pf%:\Windows\System32\MicrosoftEdgeBCHost.exe & takeown /f %pf%:\Windows\System32\MicrosoftEdgeCP.exe & takeown /f %pf%:\Windows\System32\MicrosoftEdgeDevTools.exe & takeown /f %pf%:\Windows\System32\MicrosoftEdgeSH.exe & takeown /f "%pf%:\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-100_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-100.png" & takeown /f "%pf%:\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_x64__8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-200.png" & takeown /f "%pf%:\Program Files\WindowsApps\Clipchamp.Clipchamp_2.2.8.0_neutral__yxz26nhyzhsrt\Runtimes\MicrosoftEdgeWebview2Setup.exe" & takeown /f "%pf%:\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" & takeown /f "%pf%:\Program Files\WindowsApps\MicrosoftWindows.Client.WebExperience_421.20070.195.0_x64__cw5n1h2txyewy\Dashboard\WebView2Loader.dll" & takeown /f "%pf%:\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" & cacls %pf%:\Windows\System32\MicrosoftEdgeBCHost.exe /p everyone:f /e & cacls %pf%:\Windows\System32\MicrosoftEdgeCP.exe /p everyone:f /e & cacls %pf%:\Windows\System32\MicrosoftEdgeDevTools.exe /p everyone:f /e & cacls %pf%:\Windows\System32\MicrosoftEdgeSH.exe /p everyone:f /e & cacls "%pf%:\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-100_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-100.png" /p everyone:f /e & cacls "%pf%:\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_x64__8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-200.png" /p everyone:f /e & cacls "%pf%:\Program Files\WindowsApps\Clipchamp.Clipchamp_2.2.8.0_neutral__yxz26nhyzhsrt\Runtimes\MicrosoftEdgeWebview2Setup.exe" /p everyone:f /e & cacls "%pf%:\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" /p everyone:f /e & cacls "%pf%:\Program Files\WindowsApps\MicrosoftWindows.Client.WebExperience_421.20070.195.0_x64__cw5n1h2txyewy\Dashboard\WebView2Loader.dll"  /p everyone:f /e & cacls "%pf%:\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png"  /p everyone:f /e & del %pf%:\Windows\System32\MicrosoftEdgeBCHost.exe & del %pf%:\Windows\System32\MicrosoftEdgeCP.exe & del %pf%:\Windows\System32\MicrosoftEdgeDevTools.exe & del %pf%:\Windows\System32\MicrosoftEdgeSH.exe & del "%pf%:\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-100_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-100.png" & del "%pf%:\Program Files\WindowsApps\Microsoft.WindowsFeedbackHub_1.2201.61.0_x64__8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-200.png" & del "%pf%:\Program Files\WindowsApps\Clipchamp.Clipchamp_2.2.8.0_neutral__yxz26nhyzhsrt\Runtimes\MicrosoftEdgeWebview2Setup.exe" & del "%pf%:\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" & del "%pf%:\Program Files\WindowsApps\MicrosoftWindows.Client.WebExperience_421.20070.195.0_x64__cw5n1h2txyewy\Dashboard\WebView2Loader.dll" & del "%pf%:\Program Files\WindowsApps\DeletedAllUserPackages\Microsoft.WindowsFeedbackHub_1.2201.61.0_neutral_split.scale-125_8wekyb3d8bbwe\Assets\Images\EdgeLogo.scale-125.png" & rd /s /q "%pf%:\Users\Administrator\AppData\Local\Microsoft\Internet Explorer\Indexed DB\EDGE" rd /s /q "%pf%:\Program Files (x86)\Microsoft\EdgeWebView" & rd /s /q "%pf%:\Administrator\Desktop\EdgeUpdate 1" & rd /s /q "%pf%:\Internet 临时文件\IE\3MXLTGBM" & rd /s /q "%pf%:\Program Files (x86)\Microsoft" & del "%pf%:\Program Files\WindowsApps\Microsoft.LanguageExperiencePackzh-CN_22621.9.50.0_neutral__8wekyb3d8bbwe\windows\System32\Dism\zh-CN\c15cf26162248a030c229312f4f7709c\EdgeProvider.dll.mui" & rd /s /q "%pf%:\Program Files (x86)\Microsoft" & rd /s /q "%pf%:\Program Files\Microsoft" & rd /s /q %pf%\AppData\Local\Microsoft\Edge & taskkill /im MicrosoftEdgeUpdate.exe /f & rd /s /q %pf%\AppData\Local\Microsoft\EdgeUpdate & cd %pf%\AppData\Local\Microsoft\EdgeCore\*.0.*\Installer & .\setup.exe -uninstall -system-level -verbose-logging -force-uninstall & rd /s /q %pf%\AppData\Local\Microsoft\EdgeCore & rd /s /q %pf%\AppData\Local\Microsoft\EdgeWebView & rd /s /q %pf%\AppData\Local\Microsoft\EdgeUpdate & rd /s /q %pf%\AppData\Local\Microsoft\Edge & rd /s /q %pf%\AppData\Local\Microsoft\EdgeCore
cls & set "现在请打开Edge测试你的Edge是否能够打开：=" & echo 能打开（1）& echo 无法打开/提示文件损坏（2） & echo 试过更改字母，仍然无效（3）
set /P a=现在请打开Edge测试你的Edge是否能够打开：
if "%a%"=="1" cls & echo 请重新卸载 & pause & cls & goto start & exit
if "%a%"=="2" cls & echo 即将开始删除注册表
if "%a%"=="3" cls & set "您可能是MSI版Edge浏览器，需保证网络稳定，并且有≥800MB的系统盘剩余空间以保证所需程序能正常调用（此文件在卸载完Edge后卸完会自动删除）=" & echo 开始卸载（Y） & echo 取消卸载（N） & set /P msi=您可能是MSI版Edge浏览器，需保证网络稳定，并且有≥800MB的系统盘剩余空间以保证所需程序能正常调用（此文件在卸载完Edge后卸完会自动删除）：
if "%msi%"=="Y" cls & echo 正在下载降级包.... & certutil -URLCache -f "https://dlink.host/sharepoint/aHR0cHM6Ly9taW5neHVhbmtlbGFuLW15LnNoYXJlcG9pbnQuY29tLzp1Oi9nL3BlcnNvbmFsL21pbmd4dWFua2VsYW5fbWluZ3h1YW5rZWxhbl9vbm1pY3Jvc29mdF9jb20vRVh2ckVGUUxHdVZGdktYV1lPLU9fYmdCbmxYQzhRajhqbHdhQWpYQXQwZTVlUT9lPW5Mb3R5aQ.msi" "%SystemDrive%\MSi版Edge卸载所需程序.msi" & copy %SystemDrive%\MSi版Edge卸载所需程序.msi %SystemDrive%\MSi版Edge卸载所需程序.txt & msiexec /i %SystemDrive%\MSi版Edge卸载所需程序.msi /l* %SystemDrive%\MSi版Edge卸载所需程序.txt allowdowngrade=1 & echo 降级包安装完成，在控制面板卸载即可（点击删除残留将自动删除，请勿手动删除，否则无法卸载！如果卸载时出错，则需要先修复，再卸载），继续以删除残留 & rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl & @ pause
if "%msi%"=="y" cls & echo 正在下载降级包.... & certutil -URLCache -f "https://dlink.host/sharepoint/aHR0cHM6Ly9taW5neHVhbmtlbGFuLW15LnNoYXJlcG9pbnQuY29tLzp1Oi9nL3BlcnNvbmFsL21pbmd4dWFua2VsYW5fbWluZ3h1YW5rZWxhbl9vbm1pY3Jvc29mdF9jb20vRVh2ckVGUUxHdVZGdktYV1lPLU9fYmdCbmxYQzhRajhqbHdhQWpYQXQwZTVlUT9lPW5Mb3R5aQ.msi" "%SystemDrive%\MSi版Edge卸载所需程序.msi" & copy %SystemDrive%\MSi版Edge卸载所需程序.msi %SystemDrive%\MSi版Edge卸载所需程序.txt & msiexec /i %SystemDrive%\MSi版Edge卸载所需程序.msi /l* %SystemDrive%\MSi版Edge卸载所需程序.txt allowdowngrade=1 & echo 降级包安装完成，在控制面板卸载即可（点击删除残留将自动删除，请勿手动删除，否则无法卸载！如果卸载时出错，则需要先修复，再卸载），继续以删除残留 & rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl & @ pause
reg delete HKEY_CLASSES_ROOT\microsoft-edge-holographic /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.CoreClass /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.CoreClass.1 /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.CoreMachineClass /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.CoreMachineClass.1 /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.CredentialDialogMachine /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.CredentialDialogMachine.1.0 /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.OnDemandCOMClassMachine /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.OnDemandCOMClassMachine.1.0 /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.OnDemandCOMClassMachineFallback /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.OnDemandCOMClassMachineFallback.1.0 /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.OnDemandCOMClassSvc /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.OnDemandCOMClassSvc.1.0 /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.PolicyStatusMachine /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.PolicyStatusMachine.1.0 /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.PolicyStatusMachineFallback /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.PolicyStatusMachineFallback.1.0 /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.PolicyStatusSvc /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.PolicyStatusSvc.1.0 /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.ProcessLauncher /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.ProcessLauncher.1.0 /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.Update3COMClassService /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.Update3COMClassService.1.0 /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.Update3WebMachine /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.Update3WebMachine.1.0 /f
cls
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.Update3WebMachineFallback /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.Update3WebMachineFallback.1.0 /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.Update3WebSvc /f
reg delete HKEY_CLASSES_ROOT\MicrosoftEdgeUpdate.Update3WebSvc.1.0 /f
reg delete HKEY_CURRENT_USER\Software\Classes\microsoft-edge /f
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts /f
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\microsoft-edge /f
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\microsoft-edge-holographic /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts /f
reg delete HKEY_CLASSES_ROOT\microsoft-edge /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\MrtCache\C:%5CWindows%5CSystemApps%5CMicrosoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe%5Cresources.pri" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Mappings\S-1-15-2-1862275542-1254060742-1006630753-971163975-25177346-1977832528-4247160915" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedgedevtoolsclient_8wekyb3d8bbwe" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoftwindows.client.cbs_cw5n1h2txyewy\MicrosoftEdge" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Packages\Microsoft.MicrosoftEdge_44.22621.525.0_neutral__8wekyb3d8bbwe" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PackageRepository\Packages\Microsoft.MicrosoftEdgeDevToolsClient_1000.22621.1.0_neutral_neutral_8wekyb3d8bbwe" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PolicyCache\Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PolicyCache\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\PolicyCache\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\AppID\MicrosoftEdgeUpdate.exe" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{08D832B9-D2FD-481F-98CF-904D00DF63CC}\LocalServer32" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{08D832B9-D2FD-481F-98CF-904D00DF63CC}\ProgID" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{08D832B9-D2FD-481F-98CF-904D00DF63CC}\VersionIndependentProgID" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{08D832B9-D2FD-481F-98CF-904D00DF63CC}" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{2E1DD7EF-C12D-4F8E-8AD8-CF8CC265BAD0}\LocalServer32" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{492E1C30-A1A2-4695-87C8-7A8CAD6F936F}" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{5F6A18BB-6231-424B-8242-19E5BB94F8ED}" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{77857D02-7A25-4B67-9266-3E122A8F39E4}" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{8F09CD6C-5964-4573-82E3-EBFF7702865B}" /f
cls
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{9F3F5F5D-721A-4B19-9B5D-69F664C1A591}" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{A6B716CB-028B-404D-B72C-50E153DD68DA}" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{B5977F34-9264-4AC3-9B31-1224827FF6E8}" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{CECDDD22-2E72-4832-9606-A9B0E5E344B2}" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{D1E8B1A6-32CE-443C-8E2E-EBA90C481353}" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{E421557C-0628-43FB-BF2B-7C9F8A4D067C}" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{EA92A799-267E-4DF5-A6ED-6A7E0684BB8A}" /f
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{FF419FF9-90BE-4D9F-B410-A789F90E5A7C}" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost\IndexedDB\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PushNotifications\Backup\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe!App" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\HostActivityManager\CommitHistory\Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe!App" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\HostActivityManager\CommitHistory\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge" /f
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Settings /v HwkbInlinePredictionAlwaysOffList /d WinUAPEntry.exe /f
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Input\Settings /v HwkbAutocorrectionAlwaysOffList /d onenoteim.exe /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Browser /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SecurityManager\CapAuthz\ApplicationsEx\Microsoft.MicrosoftEdgeDevToolsClient_1000.22621.1.0_neutral_neutral_8wekyb3d8bbwe" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\InboxApplications\Microsoft.MicrosoftEdgeDevToolsClient_*.0.*.*_neutral__8wekyb3d8bbwe" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\S-1-5-21-204619062-2157963062-1899829857-1001\Microsoft.MicrosoftEdgeDevToolsClient_10.0.22621.1_neutral__8wekyb3d8bbwe" /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\Capabilities\microphone\Apps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\Capabilities\userAccountInformation\Apps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\Capabilities\webcam\Apps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-e..microsoftedgebchost_31bf3856ad364e35_none_9a0c052dbd2ddbe0" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-edge-angle_31bf3856ad364e35_none_8c95285b8836d727" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-edge-edgecontent_31bf3856ad364e35_none_20e866e90cc4832a" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-edge-microsoftedgecp_31bf3856ad364e35_none_b5753426e9c1e936" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-edge-microsoftedgesh_31bf3856ad364e35_none_b4c03316ea4add8e" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-edge-edgemanager_31bf3856ad364e35_none_b87270ef4cdc2206" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MicrosoftEdgeUpdate.exe" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate" /f
cls
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Config\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\edgeupdatem" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\RestrictedServices\AppIso\FirewallRules" /v {B4FCA054-CAD9-4613-8FCA-C3BEAB1E4921} /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\RestrictedServices\AppIso\FirewallRules" /v {C9F8E6FE-28EB-49F5-92C2-BDD2FA8A7D1B} /f
reg delete "HKEY_USERS\S-1-5-21-204619062-2157963062-1899829857-1001\Software\Classes\Local Settings\MrtCache\C:%5CWindows%5CSystemApps%5CMicrosoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe%5Cresources.pri" /f
reg delete "HKEY_USERS\S-1-5-21-204619062-2157963062-1899829857-1001\Software\DownloadManager\IDMBI\MicrosoftEdgeCP" /f
reg delete "HKEY_USERS\S-1-5-21-204619062-2157963062-1899829857-1001\Software\DownloadManager\IDMBI\msedge" /f
reg delete "HKEY_USERS\S-1-5-21-204619062-2157963062-1899829857-1001\Software\Microsoft\UserData\UninstallTimes" /v Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe /f
reg delete "HKEY_USERS\S-1-5-21-204619062-2157963062-1899829857-1001\Software\Microsoft\UserData\UninstallTimes" /v Microsoft.MicrosoftEdge_8wekyb3d8bbwe /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Edge /f
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge /f
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\EdgeUpdate /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\EdgeDebugActivation" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\EdgeIntegration" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /v "%pf%:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge Update" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft EdgeWebView" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /f
del %SystemDrive%\MSi版Edge卸载所需程序.msi /q & del %SystemDrive%\MSi版Edge卸载所需程序.msi /q
del "%pf%:\Program Files (x86)\Microsoft" /q
del %SystemDrive%\MSi版Edge卸载所需程序.txt
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge /f
reg delete HKEY_CLASSES_ROOT\.pdf\OpenWithProgids /f
reg delete HKEY_CLASSES_ROOT\.html\OpenWithProgids /f
reg delete HKEY_CLASSES_ROOT\.htm\OpenWithProgids /f
reg delete HKCR\.htm /v MSEdgeHTM /f
reg delete HKCR\.html /v MSEdgeHTM /f
reg delete HKCR\.pdf /v MSEdgeHTM /f
reg delete HKCR\.shtml /v MSEdgeHTM /f
reg delete HKCR\.svg /v MSEdgeHTM /f
reg delete HKCR\.webp /v MSEdgeHTM /f
reg delete HKCR\.xht /v MSEdgeHTM /f
reg delete HKCR\.xhtml /v MSEdgeHTM /f
cd %SYSTEMDRIVE% & rd /s /q "%EdgeFilesDrive%\Program Files (x86)\Microsoft"
del %SYSTEMDRIVE%\MSi版Edge卸载所需程序.txt
cls & @echo 下载Windows11/10的修复工具，此方法可以更完整的修复，缺点是打开64位需要手动右键【32位系统不影响】（1） & echo （资源来自小鱼儿论坛-https://www.yrxitong.com/h-nd-963.html） & echo 我需要Windows10及以下Windows的IE修复工具（只支持修复图标，但是双击打开默认64位）（2） & echo 不需要（3）
set /P xiufu=Edge已卸载完成，防止您没有备用浏览器，请问您是否需要下载IE修复工具（原帖在这：https://www.yrxitong.com/h-nd-963.html: 
if "%xiufu%"=="1" certutil -URLCache -f "https://download.s21i.faiusr.com/17110378/0/0/ABUIABBLGAAg5vHYoQYozLCA0wc" "%SystemDrive%\Users\Public\Desktop\Windows一键恢复IE11工具2.0.exe" 
if "%xiufu%"=="2" certutil -URLCache -f "https://dlink.host/sharepoint/aHR0cHM6Ly9taW5neHVhbmtlbGFuLW15LnNoYXJlcG9pbnQuY29tLzp1Oi9nL3BlcnNvbmFsL21pbmd4dWFua2VsYW5fbWluZ3h1YW5rZWxhbl9vbm1pY3Jvc29mdF9jb20vRVVOWmU5OC1UbDlMcEh6TEZVcldEQ0lCWmdwNXRLTUhfTUR1YTM4S1B0d2IxUT9lPWRSNEdHeQ.inf" "%SystemDrive%\Users\Public\Desktop\Windows一键恢复IE桌面图标.inf"
if "%xiufu%"=="3" pause
cls & echo 开启【如果你以前关闭了该功能，选择此项将重新开启Windows搜索的Web功能，此功能需要安装Microsoft Edge才能使用（Y）】& echo 关闭（N）
set /P Windows10SearchEdgeWeb=请问你是否要关闭Windows10/11左下角搜索功能中的网页功能（推荐关闭，此更改重启/注销后生效）: 
if "%Windows10SearchEdgeWeb%"=="Y" cls & reg delete "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /f
if "%Windows10SearchEdgeWeb%"=="y" cls & reg delete "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /f
if "%Windows10SearchEdgeWeb%"=="N" cls & reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /f /v DisableSearchBoxSuggestions /t REG_DWORD /d 1
if "%Windows10SearchEdgeWeb%"=="n" cls & reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /f /v DisableSearchBoxSuggestions /t REG_DWORD /d 1
@ cls 1.1.1版更新内容：1.新增了3个残留文件删除指令 & cls 1.1.2版更新内容：1.新删除残留文件1个 & cls cls 1.1.4版更新内容：1.新增35条注册表删除命令 & cls 1.1.5版更新内容：1.新增1条残留文件删除命令 & cls 1.2.0版更新内容：1.支持选择你的系统盘了 & cls 1.2.1版更新内容：1.添加了近50条残留注册表删除命令 & cls 1.2.1.1版更新内容：1.无任何实质性更新，仅将文件打包成了exe方便使用 & cls 1.2.1.2版更新内容：1.无任何实质性更新，添加了警示语句 & cls 1.2.1.3版更新内容：无任何实质性更新，添加了下载新版本选项、是否重启选项 & cls 版本：1.3，更新内容：新增了几十条删除命令
@ color 2 & echo 当前版本：2.7.3.0（64位系统版）更新内容：修复了小写无法卸载，添加了Windows搜索网页功能的开启与关闭，修复了上一个版本更新后仍存在残留的打开方式的问题，添加了Windows10及以下IE图标修复，支持自动识别当前磁盘的盘符 & cls
echo 当前版本：2.7.4.0（64位系统版）更新内容：修复了Microsoft Edge无法卸载的BUG，修改了Microsoft Edge WebView2 Runtime部分的提示框，修改了最开始选择硬盘界面的选择逻辑，减小了程序体积，并将“回车”问题修正了，修复了Internet Explorer修复工具下载错误的问题，修复了Windows Search无法关闭的问题，修改了部分显示文字， & CLS
echo 如果释放了一个名为“Packages.txt”的文件，在卸载完edge后删除即可 & cls
echo 当前版本：2.7.5.0（64位系统版）更新内容：修复了Internet Explorer、Microsoft Edge降级包无法下载的问题
pause & cls
echo 下载链接：https://www.123pan.com/s/N6W9-a9wnh
echo Github仓库：https://www.github.com/mingxuankelan/Edge-Killer
pause & cls
systeminfo|findstr /C:"OS 名称" >%tmp%\tmp.txt
for /f "tokens=2* delims=[]" %%i in ('ver') do set v=%%i
for /f "tokens=2* delims= " %%i in ("%v%") do echo Microsoft Edge 已卸载， 请重启您的 Windows %%i 设备......
del /q %tmp%\tmp.txt
pause & cls
set "是否立即重启：=" & echo 是（Y）& echo 否（N）
set /P cq=是否立即重启：
if "%cq%"=="Y" shutdown -r -t 5 & echo 正在重启......
if "%cq%"=="N" echo 别忘了要重启啊！
pause