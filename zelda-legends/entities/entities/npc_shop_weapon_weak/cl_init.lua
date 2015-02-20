include('shared.lua') -- At this point the contents of shared.lua are ran on the client only.

function NPCShopMenu()

	-- Small derma panel just for the example.
	local pShop = vgui.Create('DFrame')
	pShop:SetSize(500, 500)
	pShop:SetPos(ScrW()*0.5, ScrH()*0.5)
	pShop:SetTitle('Weaponry Shop')
	pShop:SetSizable( false )
	pShop:SetDeleteOnClose( false )
	pShop:SetBackgroundBlur( true )
	pShop:MakePopup()

	-- We can also do anything else the client can do, like using the chat!
	chat.AddText( Color( 255,255,128 ), "Merchant", Color( 255,255,255 ) , ": Welcome to my weapon shop, how can I help?" )
	
end

usermessage.Hook("ShopNPCUsed", NPCShopMenu) --Hook to messages from the server so we know when to display the menu.