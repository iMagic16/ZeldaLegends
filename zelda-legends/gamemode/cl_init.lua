/*=======================================================================
 _______                                  _   _     _  ____    -Magic        
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/

DeriveGamemode("base"); 

include("shared.lua");
include("levelingsystem/leveling_handler.lua");
include("paths/paths_menu.lua");
include("playerspawn/plyinitspawn.lua");
include("vgui/hud.lua");
//for k, v in pairs(file.FindInLua('zelda-legends/gamemode/vgui/*.lua')) do include('vgui/' .. v); end 

