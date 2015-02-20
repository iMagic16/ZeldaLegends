/*=======================================================================
 _______                                  _   _     _  ____      -Tomcat      
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/

//Money System by Tomcat Edited for Zelda

RUPEE_STARTAMOUNT = 10 --Can be changed to your starting amount
 
function FirstSpawn( ply )

        local cash = ply:GetPData("rupees")
 
        if cash == nil then
		
                ply:SetPData("rupees", RUPEE_STARTAMOUNT)
				
                ply:SetRupees( RUPEE_STARTAMOUNT )
				
        else
		
        ply:SetRupees( cash )
		
        end
 
end
hook.Add( "PlayerInitialSpawn", "playerInitialSpawn", FirstSpawn )
 
function PrintRupees( ply )

        ply:ChatPrint("You have " .. ply:GetRupees() .. " Rupee's.")
		
end
 
function fPlayerDisconnect( ply )

        print("Player "..ply:Name().." ("..ply:SteamID()..") Disconnected, Money saved to SQLLite and TXT")
		
        ply:SaveRupees()
        ply:SaveRupeesTXT()
end
 
concommand.Add("zl_get_rupee",PrintRupees)