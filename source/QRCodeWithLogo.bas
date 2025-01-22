B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.8
@EndOfDesignText@
#DesignerProperty: Key: ShowLogo, DisplayName: Show Logo, FieldType: Boolean, DefaultValue: False, Description: Show or hide a logo
#DesignerProperty: Key: SelectedLogo, DisplayName: Selected Logo, FieldType: String, DefaultValue: B4X, List: B4X|Google|OctoCat|Waze, Description: Use predefined logo
#DesignerProperty: Key: LogoAlpha, DisplayName: Logo Alpha, FieldType: Int, DefaultValue: 255, MinRange: 0, MaxRange: 255, Description: Set apha level for logo

#Event: Click
Sub Class_Globals
	Private mEventName As String 'ignore
	Private mCallBack As Object 'ignore
	Public mBase As B4XView
	Private xui As XUI 'ignore
	Public Tag As Object
	Private QR As QRGenerator
	Private ImvQR As ImageView
	Private BmpQR As B4XBitmap
	Private BmpLogo As B4XBitmap
	Private mShowLogo As Boolean
	Private mSelectedLogo As String
	Private mLogoAlpha As Int
	Public Const B4X 		As String = "B4X"
	Public Const GOOGLE 	As String = "Google"
	Public Const OCTOCAT 	As String = "OctoCat"
	Public Const WAZE 		As String = "Waze"
End Sub

Public Sub Initialize (Callback As Object, EventName As String)
	mEventName = EventName
	mCallBack = Callback
End Sub

'Base type must be Object
Public Sub DesignerCreateView (Base As Object, Lbl As Label, Props As Map)
	mBase = Base
	Tag = mBase.Tag
	mBase.Tag = Me
	mShowLogo = Props.GetDefault("ShowLogo", False)
	mSelectedLogo = Props.GetDefault("SelectedLogo", "B4X")
	mLogoAlpha = Props.GetDefault("LogoAlpha", 255)
	ImvQR.Initialize("")
	mBase.AddView(ImvQR, 0, 0, mBase.Width, mBase.Height)
	QR.Initialize(ImvQR.Width)
	LoadSelectedLogo
End Sub

Private Sub Base_Resize (Width As Double, Height As Double)

End Sub

Private Sub LoadSelectedLogo
	Select mSelectedLogo
		Case "Google"
			BmpLogo = xui.LoadBitmapResize(File.DirAssets, "google.png", mBase.Width, mBase.Height, True)
		Case "OctoCat"
			BmpLogo = xui.LoadBitmapResize(File.DirAssets, "octocat.png", mBase.Width, mBase.Height, True)
		Case "Waze"
			BmpLogo = xui.LoadBitmapResize(File.DirAssets, "waze.png", mBase.Width, mBase.Height, True)
		Case Else
			BmpLogo = xui.LoadBitmapResize(File.DirAssets, "b4x.png", mBase.Width, mBase.Height, True)
	End Select
End Sub

Public Sub setCustomLogo (Image As B4XBitmap)
	BmpLogo = Image
End Sub

Public Sub setLogoAlpha (Alpha As Int)
	mLogoAlpha = Alpha
End Sub

Public Sub setSelectedLogo (Logo As String)
	mSelectedLogo = Logo
	LoadSelectedLogo
End Sub

Public Sub setShowLogo (Show As Boolean)
	mShowLogo = Show
End Sub

Public Sub Create (Text As String)
	BmpQR = QR.Create(Text)
	
	If mShowLogo Then
		ImvQR.Bitmap = QR.AddBitmap(BmpQR, BmpLogo, mLogoAlpha).Resize(ImvQR.Width, ImvQR.Height, True)
	Else
		ImvQR.Bitmap = BmpQR
	End If
End Sub