/*=======================================================================
 _______                                  _   _     _  ____   -Magic      
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/

function saytoall( message )

	for k, v in pairs(player.GetAll()) do
	
		v:ChatPrint( message )
		
	end
	
end


function HandleLevel( ply )

local Experience = ply:GetEXP() 
local current_lvl = ply:GetLVL()
local stlvl = ply:SetLVL( amount )
local plyn = ply:Nick()
local plys = ply:SteamID()

     if ( Experience <= 0 ) then
		     ply:SetLVL( current_lvl + 1)
             saytoall( plyn..", No data was found for you - You have been set to Level 1" )
		
		     elseif ( Experience >= 5 and Experience <= 9 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 2!" )
			 
			 elseif ( Experience >= 10 and Experience <= 19 ) then
			 ply:SetLVL( current_lvl + 1 )
			 saytoall( plyn.." is now Level 3!" )
			 
		     elseif ( Experience >= 20 and Experience <= 39 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 4!" )
			 
			 elseif ( Experience >= 40 and Experience <= 79 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 5!" )
			 
			 elseif ( Experience >= 80 and Experience <= 159 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 6!" )
			 
			 elseif ( Experience >= 160 and Experience <= 319 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 7!" )
			 
			 elseif ( Experience >= 320 and Experience <= 639 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 8!" )
			 
			 elseif ( Experience >= 640 and Experience <= 1279 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 9!" )
			 
			 elseif ( Experience >= 1280 and Experience <= 2559 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 10!!" )
			 
			 elseif ( Experience >= 2560 and Experience <= 5119 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 11!" )
			 
			 elseif ( Experience >= 5120 and Experience <= 10239 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 12!" )
			 
			 elseif ( Experience >= 10240 and Experience <= 20479 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 13!" )
			 
			 elseif ( Experience >= 20480 and Experience <= 40959 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 14!" )
			 
			 elseif ( Experience >= 40960 and Experience <= 81919 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 15!" )
			 
			 elseif ( Experience >= 81920 and Experience <= 163837 ) then
			 ply:SetLVL( current_lvl + 1 )
		     saytoall( plyn.." is now Level 16!" )
			   
			 else saytoall( "There was an error processing "..plyn.."'s request, Please contact a programmer./n  Error code:[ZL-LVL-E1-NR/Wx"..plys.."]" ) 
			  
		end
		
end

concommand.Add("zl_handle_level", HandleLevel)
usermessage.Hook( "handlethelevel", HandleLevel)