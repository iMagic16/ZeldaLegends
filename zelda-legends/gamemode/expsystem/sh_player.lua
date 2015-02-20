/*=======================================================================
 _______                                  _   _     _  ____    -Magic        
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/

local meta = FindMetaTable("Player") --Get the meta table of player
 
function meta:AddEXP(amount)
        local current_exp = self:GetEXP()
        self:SetEXP( current_exp + amount )
end
 
function meta:SetEXP(amount)
        self:SetNetworkedInt( "exp", amount )
        self:SaveEXP()
end

function meta:SaveEXP()
        local EXP = self:GetEXP()
        self:SetPData("exp", EXP)
end
 
function meta:SaveEXPTXT()
        file.Write(gmod.GetGamemode().Name .."/Experience_Points/".. string.gsub(self:SteamID(), ":", "_") ..".txt", self:GetRupeesString())
end
 
function meta:TakeEXP(amount)
   self:AddEXP(-amount)
end

 
function meta:GetEXP()
        return self:GetNetworkedInt( "exp" )
end

