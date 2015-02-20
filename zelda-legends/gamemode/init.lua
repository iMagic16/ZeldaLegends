/*=======================================================================
 _______                                  _   _     _  ____-Magic & Tomcat       
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/

DeriveGamemode("base"); 

AddCSLuaFile("cl_init.lua");  //CSide
AddCSLuaFile("shared.lua"); 
AddCSLuaFile("rupeessystem/sh_player.lua");
AddCSLuaFile("expsystem/sh_player.lua");
AddCSLuaFile("levelingsystem/sh_player.lua");
AddCSLuaFile("levelingsystem/leveling_handler.lua");
AddCSLuaFile("playerspawn/plyinitspawn.lua");
AddCSLuaFile("paths/paths_menu.lua");
AddCSLuaFile("commonfunctions/commonfunctions.lua");
AddCSLuaFile("vgui/hud.lua");

include("commonfunctions/commonfunctions.lua"); //SSide
include("shared.lua"); 
include("chatcmd/chat_commands.lua"); 
include("paths/paths.lua");
include("rupeessystem/init.lua");

/*Group adding
for k, v in pairs(file.FindInLua('zelda-legends/gamemode/vgui/*.lua')) do AddCSLuaFile('vgui/' .. v); end //Let it do the work for us
for k, v in pairs(file.FindInLua('zelda-legends/gamemode/rupeessystem/*.lua')) do include('rupeessystem/' .. v); end //Let it do the work for us
for k, v in pairs(file.FindInLua('zelda-legends/gamemode/expsystem/*.lua')) do include('expsystem/' .. v); end
for k, v in pairs(file.FindInLua('zelda-legends/gamemodes/levelingsystem/*.lua')) do include('levelingsystem/' .. v); end
*/

/*
local function ProcessFolder ( Location )

	for k, v in pairs(file.Find(Location .. '*')) do
	
		if file.IsDir(Location .. v) then
		
			ProcessFolder(Location .. v .. '/')
			
		end
		
	end
	
end

ProcessFolder('../gamemodes/zelda-legends/content/models/');
ProcessFolder('../gamemodes/zelda-legends/content/materials/');
ProcessFolder('../gamemodes/zelda-legends/content/sound/');
ProcessFolder('../gamemodes/zelda-legends/content/resource/');
*/
function GM:PlayerInitialSpawn() 
end
	
function GM:PlayerSpawn(ply) 
	 
	         ply:SetTeam( PATH_SELECTION )
	         ply:StripWeapons()
	        // ply:SetModel( "models/players/choosing_path.mdl" )
	         ply:SetWalkSpeed( 1 )
	         ply:SetRunSpeed( 1 )
	         ply:SetHealth( 100 )
	         ply:SetJumpPower( 0 )
			 
			     umsg.Start( "pathmenu", ply );
	             umsg.End();
	 
	 end