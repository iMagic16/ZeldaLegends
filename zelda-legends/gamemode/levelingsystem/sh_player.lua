/*=======================================================================
 _______                                  _   _     _  ____    -Magic        
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/

local meta = FindMetaTable("Player") --Get the meta table of player
 
function meta:AddLVL(amount)
        local current_lvl = self:GetLVL()
        self:SetLVL( current_lvl + amount )
end
 
function meta:SetLVL(amount)
        self:SetNetworkedInt( "lvl", amount )
        self:SaveLVL()
end
 
function meta:SaveLVL()
        local LVL = self:GetLVL()
        self:SetPData("lvl", LVL)
end
 
function meta:SaveLVLTXT()
        file.Write(gmod.GetGamemode().Name .."/Level/".. string.gsub(self:SteamID(), ":", "_") ..".txt", self:GetRupeesString())
end
 
function meta:TakeLVL(amount)
   self:AddLVL(-amount)
end

 
function meta:GetLVL()
        return self:GetNetworkedInt( "lvl" )
end
