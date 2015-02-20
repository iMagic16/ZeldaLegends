/*=======================================================================
 _______                                  _   _     _  ____   -Tomcat & Magic      
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/

//Next to add - TriForce Indicator(Which one you are after) [LINK=POWER ZELDA=WISDOM NAVI=COURAGE]

ShowAmmo = true


        // Get Texture ID's
        local ArmorTex = surface.GetTextureID( "vgui/hud/rupee" )
        local HeartTex = surface.GetTextureID( "vgui/hud/heart" )
		local ExpTex   = surface.GetTextureID( "vgui/hud/exp" )
		local LvlTex   = surface.GetTextureID( "vgui/hud/lvl" )
		local Crg      = surface.GetTextureID( "vgui/hud/courage" )
		local Pwr      = surface.GetTextureID( "vgui/hud/power" )
		local Wsdm     = surface.GetTextureID( "vgui/hud/wisdom" )
        
        // Screen Info
        local Width = ScrW()
        local Height = ScrH()


surface.CreateFont( "Triforce", 35, 200, 0, 0, "Zelda")


function DrawHud()
        if LocalPlayer():GetActiveWeapon() == NULL or LocalPlayer():GetActiveWeapon() == "Camera" then return end  
        
        // Get Numbers
        local Armor = LocalPlayer():Armor()
        local Health = LocalPlayer():Health()
        local Money = tostring(LocalPlayer():GetRupees())
		local Level =  tostring(LocalPlayer():GetLVL())
		local Experience =  tostring(LocalPlayer():GetEXP())
        


        // Ammo Stuff
        local PrimaryAmmo = LocalPlayer():GetActiveWeapon():Clip1()
        local SecondaryAmmo = LocalPlayer():GetActiveWeapon():GetSecondaryAmmoType()
        local AmmoString = tostring(PrimaryAmmo.. " / " .. LocalPlayer():GetAmmoCount(SecondaryAmmo))
        
        if Health < 1 then Health = 0 end       
        if Armor < 1 then Armor = 0 end


        
        local ArmorWidth = (Armor / 100) * 124
        local HealthWidth = (Health / 100) * 124
        
        if ArmorWidth > 124 then ArmorWidth = 124 end
        if HealthWidth > 124 then HealthWidth = 124 end
        
        // HEALTH
        draw.SimpleText( "Health: "..Health, "Zelda", Width*0.06, Height*0.05, Color( 255, 255, 255, 200 ), 1, 1 )
        
        /*if Health < 101 && Health > 81 then
        
        local Health = LocalPlayer():Health()
                surface.SetTexture( HeartTex )
                surface.DrawTexturedRect( 110, Height*0.05, 32, 32 )
                surface.SetDrawColor( 255, 255, 255, 255 )
                else 
                //surface.SetDrawColor( 0, 0, 0, 0 )
                print("nope.avi")
                end*/
                
        // ARMOR
                 draw.SimpleText( "Armor: "..Armor , "Zelda", Width*0.15, Height*0.05, Color( 255, 255, 255, 200 ), 1, 1 )
        
        //Cash
        
                 draw.SimpleText( Money.." Rupees" , "Zelda", 250, Height - 80, Color( 255, 255, 255, 200 ), 1, 1 )
                 surface.SetTexture( ArmorTex )
                 surface.SetDrawColor( 255, 255, 255, 255 )
                 surface.DrawTexturedRect( Width*0.06, Height - 100, 42, 62 )
                
        //EXP
		
		         draw.SimpleText( Experience.." EXP" , "Zelda", 250, Height - 120, Color( 255, 255, 255, 200 ), 1, 1 )
                 surface.SetTexture( ExpTex )
                 surface.SetDrawColor( 255, 255, 255, 255 )
                 surface.DrawTexturedRect( Width*0.06, Height - 150, 42, 62 )
				
		
		//Level
		
		         draw.SimpleText( "Level "..Level , "Zelda", 250, Height - 150, Color( 255, 255, 255, 200 ), 1, 1 )
                 surface.SetTexture( LvlTex )
                 surface.SetDrawColor( 255, 255, 255, 255 )
                 surface.DrawTexturedRect( Width*0.06, Height - 200, 42, 62 )
				 
		//Clock
		         
		         draw.RoundedBox( 0, ScrW()*800, ScrH()*10, 128, 46, Color( 25, 25, 25, 255 ) )
		         draw.RoundedBox( 20, ScrW()*800, ScrH()*10, 128, 46, Color( 125, 125, 125, 125 ) )
		         draw.SimpleText(os.date( "%a, %I:%M:%S %p" ), "Default", ScrW()*0.024, ScrH()*0.02, Color( 255, 104, 86, 255 ),0,0)
	             draw.SimpleText(os.date( "%m/%d/20%y" ), "Default", ScrW()*0.035, ScrH()*0.04, Color( 255, 104, 86, 255 ),0,0)

		
		
        /*if ShowAmmo then


                // AMMO
                draw.RoundedBox( 6, Width - 300, Height - 100, 40, 60, Color( 140, 175, 140, 200 ) )
                draw.RoundedBox( 4, Width - 1800, Height - 100, 36, 56, Color( 25, 35, 27, 200 ) )
                
                draw.SimpleText( AmmoString, "Zelda", Width - 215, Height - 60, Color( 140, 175, 140, 200 ), 1, 1 )
                
        end*/
        
end


hook.Add( "HUDPaint", "DrawHud", DrawHud )




function Hide( Element ) 


        if ( Element == "CHudHealth" ) or ( Element == "CHudBattery" ) then
           
           return false
           
        end
           
        if         ( Element == "CHudAmmo" ) and ShowAmmo or ( Element == "CHudSecondaryAmmo" ) and ShowAmmo then
        
           return false


        end
        
end
hook.Add("HUDShouldDraw", "Hide", Hide) 