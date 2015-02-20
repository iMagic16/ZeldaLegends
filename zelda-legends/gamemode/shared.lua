/*=======================================================================
 _______                                  _   _     _  ____    -Magic       
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/

/*------------------------------
            Teams
 ------------------------------*/
 
PATH_SELECTION = 4
LINK = 3
ZELDA = 2
NAVI = 1


team.SetUp(LINK, "Link, Path to Power", Color(0, 255, 0, 255)) 
team.SetUp(ZELDA, "Zelda, Path to Wisdom", Color(0, 255, 255, 255)) 
team.SetUp(NAVI, "Navi, Path to Courage", Color(255, 0, 255, 255))
team.SetUp(PATH_SELECTION, "Player, Choosing their path", Color(0,0,255,255))

local meta = FindMetaTable("Player")

function meta:GetRupees()

        return self:GetNetworkedInt( "rupees" )
		
end

function meta:GetEXP()

        return self:GetNetworkedInt( "exp" )
		
end

function meta:GetLVL()

         return self:GetNetworkedInt( "lvl" )
		 
end

function meta:SetLVL(amount)

        self:SetNetworkedInt( "lvl", amount )
        self:SaveLVL()
end

function meta:SaveLVL()

        local LVL = self:GetLVL()
        self:SetPData("lvl", LVL)
		
end

function meta:SetEXP(amount)

        self:SetNetworkedInt( "exp", amount )
        self:SaveEXP()
		
end

function meta:SaveEXP()

        local EXP = self:GetEXP()
        self:SetPData("exp", EXP)
		
end

/*---------------------------------------------
	This sets info
*/---------------------------------------------


GM.Name 	= "Zelda Legends"
GM.Author 	= "Team rANdOm"
GM.Email 	= "proz6@live.co.uk"
GM.Website 	= "www.randomgs.com"
