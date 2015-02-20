/*=======================================================================
 _______                                  _   _     _  ____      -Magic      
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/

//EXPSYS by Magic

EXP_STARTAMOUNT = 0
 
function FirstSpawn( ply )

        local exp = ply:GetPData("exp")
 
        if exp == nil then
		
                ply:SetPData("exp", EXP_STARTAMOUNT)
				
                ply:SetEXP( EXP_STARTAMOUNT )
				
        else
		
        ply:SetEXP( exp )
		
        end
 
end

hook.Add( "PlayerInitialSpawn", "playerInitialSpawn", FirstSpawn )
 
 
function PrintEXP( ply )

        ply:ChatPrint( "You have "..ply:GetEXP().." Experience Points" )	
		
end
 
function fPlayerDisconnect( ply )

        print("Player "..ply:Name().." ("..ply:SteamID()..") Disconnected, Experience Points saved to SQLLite and TXT")
		
        ply:SaveEXP()
        ply:SaveEXPTXT()
end
 
concommand.Add("zl_print_exp", PrintEXP)