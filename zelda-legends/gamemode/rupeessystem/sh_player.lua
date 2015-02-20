/*=======================================================================
 _______                                  _   _     _  ____    -Tomcat        
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/

local meta = FindMetaTable("Player") --Get the meta table of player
 
function meta:AddRupees(amount)
        local current_rupees = self:GetRupees()
        self:SetRupees( current_rupees + amount )
end
 
function meta:SetRupees(amount)
        self:SetNetworkedInt( "rupees", amount )
        self:SaveRupees()
end
 
function meta:SaveRupees()
        local Rupees = self:GetRupees()
        self:SetPData("rupees", Rupees)
end
 
function meta:SaveRupeesTXT()
        file.Write(gmod.GetGamemode().Name .."/Rupees/".. string.gsub(self:SteamID(), ":", "_") ..".txt", self:GetRupeesString())
end
 
function meta:TakeRupees(amount)
   self:AddRupees(-amount)
end

 
function meta:GetRupees()
        return self:GetNetworkedInt( "rupees" )
end
