/*=======================================================================
 _______                                  _   _     _  ____    -Magic        
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/


function IIInitSpawn( ply )
/*
if( ply:Health() <= 20) then

     surface.PlaySound( Sound( "other/lowhealth.wav" ))
	 
	 ply:ConCommand( "zl_lowhp" )
	 
         elseif ( ply:Health() >= 21 ) then
	 
	     ply:ConCommand( "zl_lowhp" )
	    // ply:ConCommand( "stopsounds" )
		 surface.StopSound()
	 
     end
	 */
	 saytoall( ply:Name().."("..ply:SteamID()..") has finished joining the server." )
	 
end


//concommand.Add( "zl_lowhp", InitSpawn );
usermessage.Hook( "initspawn", IIInitSpawn);