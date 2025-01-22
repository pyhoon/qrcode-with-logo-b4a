B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9.85
@EndOfDesignText@
#Region Shared Files
#CustomBuildAction: folders ready, %WINDIR%\System32\Robocopy.exe,"..\..\Shared Files" "..\Files"
'Ctrl + click to sync files: ide://run?file=%WINDIR%\System32\Robocopy.exe&args=..\..\Shared+Files&args=..\Files&FilesSync=True
#End Region

'Ctrl + click to export as zip: ide://run?File=%B4X%\Zipper.jar&Args=Example2.zip

Sub Class_Globals
	Private Root As B4XView
	Private xui As XUI
	Private QRLogo As QRCodeWithLogo
End Sub

Public Sub Initialize
'	B4XPages.GetManager.LogEvents = True
End Sub

Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("MainPage")
	QRLogo.ShowLogo = True
	QRLogo.LogoAlpha = 210
	QRLogo.SelectedLogo = QRLogo.OCTOCAT
	QRLogo.CustomLogo = xui.LoadBitmapResize(File.DirAssets, "duck.png", 200dip, 200dip, True)
	QRLogo.Create("https://ul.waze.com/ul?venue_id=66650143.666566970.7021126&overview=yes")
End Sub