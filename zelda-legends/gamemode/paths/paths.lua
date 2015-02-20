/*=======================================================================
 _______                                  _   _     _  ____      -Magic        
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
   
=========================================================================*/

function SetSelect (ply)

     ply:SetTeam( NAVI )
	 ply:StripWeapons()
	 ply:SetModel( "models/Humans/Group03/male_07.mdl" )
	 ply:PrintMessage(HUD_PRINTCENTER, "You are now Navi / Courage")
	 ply:SetWalkSpeed( 100 )
	 ply:SetRunSpeed( 350 )
	 ply:SetHealth( 25 )
	 ply:SetJumpPower( 235 )
	 ply:Give( "weapon_navi" )
	 
end 

function SetZelda (ply)

	 ply:SetTeam( ZELDA )
	 ply:StripWeapons() 
  	 ply:Give( "weapon_zelda" )
 	 ply:PrintMessage(HUD_PRINTCENTER, "You are now Princess Zelda / Wisdom") 
	 ply:SetModel( "models/zelda.mdl" ) 
	 ply:SetRunSpeed( 300 ) 
	 ply:SetWalkSpeed( 100 ) 
	 ply:SetJumpPower( 200 )
	 ply:SetHealth( 80 )
	
end

function SetLink (ply) 

	 ply:SetTeam( LINK )
	 ply:StripWeapons()
	 ply:Give( "weapon_mastersword" )
     ply:SetHealth( ply:Health() )	
	 ply:PrintMessage(HUD_PRINTCENTER, "You are now Link / Power")
  	 ply:SetModel( "models/Humans/Group03/male_07.mdl" ) 
	 ply:SetRunSpeed( 250 )
	 ply:SetWalkSpeed( 100 )
	 ply:SetJumpPower( 150 )
	
	end

concommand.Add( "zl_zelda_transform", SetZelda ) 
concommand.Add( "zl_link_transform", SetLink )
concommand.Add( "zl_navi_transform", SetSelect )