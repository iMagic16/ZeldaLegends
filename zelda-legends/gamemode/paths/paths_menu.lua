/*=======================================================================
 _______                                  _   _     _  ____   -Tomcat & Magic     
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/


function ZeldaTransform()
	RunConsoleCommand("zl_zelda_transform");
	Transm:SetVisible(false)
end

function LinkTransform()
	RunConsoleCommand("zl_link_transform");
	Transm:SetVisible(false)
end

function NaviTransform()
	RunConsoleCommand("zl_navi_transform");
	Transm:SetVisible(false)
end

function DaMenUU()

local ZeldaButton
local LinkButton
//local Transm
local NaviButton

local Link = 'vgui/link'
local Zelda = 'vgui/zelda'
local Navi = 'vgui/navi'

Transm = vgui.Create('DFrame')
Transm:SetSize(309, 167)
Transm:Center()
Transm:SetTitle('Please select your path')
Transm:SetSizable( false )
Transm:SetBackgroundBlur( true )
Transm:SetDeleteOnClose( false )
Transm:MakePopup()

LinkButton = vgui.Create('DImageButton')
LinkButton:SetParent(Transm)
LinkButton:SetSize(75, 75)
LinkButton:SetPos(209, 58)
LinkButton:SetImage(Link)
LinkButton.DoClick = LinkTransform
LinkButton.DoRightClick = LinkTransform

ZeldaButton = vgui.Create('DImageButton')
ZeldaButton:SetParent(Transm)
ZeldaButton:SetSize(75, 75)
ZeldaButton:SetPos(34, 58)
ZeldaButton:SetImage(Zelda)
ZeldaButton.DoClick = ZeldaTransform 
ZeldaButton.DoRightClick = ZeldaTransform

NaviButton = vgui.Create('DImageButton')
NaviButton:SetParent(Transm)
NaviButton:Center()
NaviButton:SetSize(75, 75)
NaviButton:SetPos(120, 58)
NaviButton:SetImage(Navi)
NaviButton.DoClick = NaviTransform 
NaviButton.DoRightClick = NaviTransform

end


local function PathMenuDerma()
 
local ZeldaButton
local LinkButton
//local Transm
local NaviButton

local Link = 'vgui/link'
local Zelda = 'vgui/zelda'
local Navi = 'vgui/navi'

Transm = vgui.Create('DFrame')
Transm:SetSize(280, 150)
Transm:Center()
Transm:SetTitle('Please select your path.')
Transm:SetSizable( false )
Transm:SetBackgroundBlur( true )
Transm:SetDeleteOnClose( false )
Transm:MakePopup()

LinkButton = vgui.Create('DImageButton')
LinkButton:SetParent(Transm)
LinkButton:SetSize(75, 75)
LinkButton:SetPos(199, 40)
LinkButton:SetImage(Link)
LinkButton.DoClick = LinkTransform
LinkButton.DoRightClick = LinkTransform

ZeldaButton = vgui.Create('DImageButton')
ZeldaButton:SetParent(Transm)
ZeldaButton:SetSize(75, 75)
ZeldaButton:SetPos(24, 40)
ZeldaButton:SetImage(Zelda)
ZeldaButton.DoClick = ZeldaTransform 
ZeldaButton.DoRightClick = ZeldaTransform

NaviButton = vgui.Create('DImageButton')
NaviButton:SetParent(Transm)
NaviButton:Center()
NaviButton:SetSize(75, 75)
NaviButton:SetPos(110, 40)
NaviButton:SetImage(Navi)
NaviButton.DoClick = NaviTransform 
NaviButton.DoRightClick = NaviTransform

end

concommand.Add( "zl_team_menu", DaMenUU)
usermessage.Hook( "pathmenu", PathMenuDerma)



