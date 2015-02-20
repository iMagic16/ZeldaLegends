/*=======================================================================
 _______                                  _   _     _  ____    -Magic        
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/
   
ChatCommands = {}

function AddCom(name, func)

     Com = {}
     Com.Name = name
     Com.Func = func
	 
         table.insert(ChatCommands, Com)
		 
end

AddCom("/wallet", function(ply) 

     ply:ConCommand( "zl_get_rupee" )
	 
end)

	 
	 
hook.Add("PlayerSay", "CComandHook", function(ply, text)

for k,v in pairs(ChatCommands) do

	if(string.lower(string.sub(text, 1, string.len(v.Name))) == string.lower(v.Name)) then
	
	v.Func(ply)
	
	end
	
   end
   
end)

function PATH(name, func)

     Com = {}
     Com.Name = name
     Com.Func = func
	 
         table.insert(ChatCommands, Com)
		 
end

AddCom("/path", function(ply) 

ply:ConCommand( "zl_team_menu" ) 
   
end)


AddCom("/hax ", function(ply) 

     local current_exp = ply:GetEXP()
	 
     ply:SetEXP( current_exp + 1000 )

end)
