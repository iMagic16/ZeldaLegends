/*=======================================================================
 _______                                  _   _     _  ____      -Magic      
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/

//LVLSYS by Magic

LVL_STARTLEVEL = 1
 
function FirstSpawn( ply )
        local lvl = ply:GetPData("lvl")
 
        if lvl == nil then
                ply:SetPData("lvl", LVL_STARTLEVEL)
                ply:SetEXP( LVL_STARTLEVEL )
        else
		
        ply:SetLVL( lvl )
		
        end
 
end

hook.Add( "PlayerInitialSpawn", "playerInitialSpawn", FirstSpawn )
 
  
function fPlayerDisconnect( ply )

        print("Player "..ply:Name().." ("..ply:SteamID()..") Disconnected, Level saved to SQLLite and TXT")
		
        ply:SaveLVL()
        ply:SaveLVLTXT()
end
 