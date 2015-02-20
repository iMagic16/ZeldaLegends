if (SERVER) then
	AddCSLuaFile("shared.lua")
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false

end

if (CLIENT) then
	SWEP.PrintName			= "Navi's Annoyance"
	SWEP.DrawAmmo			= false
	SWEP.DrawCrosshair		= true
	SWEP.ViewModelFOV		= 80
	SWEP.ViewModelFlip		= true
	SWEP.CSMuzzleFlashes	= false
end

/*=======================================================================
 _______                                  _   _     _  ____            
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/


SWEP.Author		    = "Team rANdOm"
SWEP.Contact		= "www.randomgs.com"
SWEP.Purpose		= "Annoy everyone."
SWEP.Instructions	= "Primary Fire: Hey!, Hello?\nSecondary Fire: Watch out!, Listen!"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= ""
SWEP.WorldModel			= ""

util.PrecacheModel(SWEP.ViewModel)
util.PrecacheModel(SWEP.WorldModel)

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.ReloadRate = 1
SWEP.JumpRefire = false
/*---------------------------------------------------------
	Initialize
---------------------------------------------------------*/
function SWEP:Initialize()
end




/*---------------------------------------------------------
         Think (Jump attack stuff)
---------------------------------------------------------*/
function SWEP:JumpReset()
         self.JumpRefire = true
end

function SWEP:Think()

         //Jump think
         if self.InAirDmg == 1 then
            local trace = {}
	    trace.start = self.Owner:GetPos()
	    trace.endpos = self.Owner:GetPos() + (self.Owner:GetUp() * -10)
	    trace.filter = self.Owner
	
	    local tr2 = util.TraceLine(trace)

	
	    
	    if tr2.Hit then
	       self.InAirDmg = 0
	       self.JumpRefire = false
               self.Weapon:SetNextSecondaryFire(CurTime() + 0.3)
               self.Weapon:SetNextPrimaryFire(CurTime() + 0.3)

	       if SERVER then self.Owner:EmitSound(Sound("navi/bump.wav")) end
            else
             local ang = self.Owner:GetAimVector()
	     local spos = self.Owner:GetShootPos()

	     local trace = {}
	     trace.start = spos
	     trace.endpos = spos + (ang * 150)
	     trace.filter = self.Owner
	
	     local tr = util.TraceLine(trace)
	 
	     if tr.HitNonWorld and self.JumpRefire == true then
	        self.JumpRefire = false

                local bullet = {}
                bullet.Num=1
                bullet.Src = self.Owner:GetShootPos()
	        bullet.Dir= self.Owner:GetAimVector()
	        bullet.Spread = Vector(0.1,0.1,0.1)
	        bullet.Tracer = 0
	        bullet.Force = 1
	        bullet.Damage = 1
	        self.Owner:FireBullets(bullet)
	        self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
	        
	        timer.Simple(0.3,self.JumpReset,self)
	        
                if SERVER then self.Owner:EmitSound(Sound("navi/annoy_a"..tostring(math.random(1,4))..".wav")) end
                if SERVER then self.Owner:EmitSound(Sound("navi/annoy_a"..tostring(math.random(1,4))..".wav")) end
				
             end
            end
           end
		   end
           
/*---------------------------------------------------------
	SecondaryAttack (BiteAttack)
---------------------------------------------------------*/
function SWEP:SecondaryAttack()
         
         self.Weapon:SetNextSecondaryFire(CurTime() + 0.3)
         if SERVER then self.Owner:EmitSound(Sound("navi/annoy_b"..tostring(math.random(1,6))..".wav")) end

		 
         local ang = self.Owner:GetAimVector()
	 local spos = self.Owner:GetShootPos()

	 local trace = {}
	 trace.start = spos
	 trace.endpos = spos + (ang * 150)
	 trace.filter = self.Owner
	
	 local tr = util.TraceLine(trace)
	 
	 if tr.HitNonWorld then
	    local bullet = {}
	    bullet.Num=1
	    bullet.Src = self.Owner:GetShootPos()
	    bullet.Dir= self.Owner:GetAimVector()
	    bullet.Spread = Vector(0.1,0.1,0.1)
	    bullet.Tracer = 0
	    bullet.Force = 1
	    bullet.Damage = 1
	    self.Owner:FireBullets(bullet)
	    self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)

         elseif tr.HitWorld then
            self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
         elseif !tr.Hit then
            self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
			end

         

end

/*---------------------------------------------------------
	PrimaryAttack (JumpAttack)
---------------------------------------------------------*/
SWEP.InAirDmg = 1
function SWEP:PrimaryAttack()
         if SERVER then self.Owner:EmitSound("navi/annoy_a"..tostring(math.random(1,4))..".wav") end   //lrning to lua tomcat
   
         self.Weapon:SetNextSecondaryFire(CurTime() + 0.3)
         self.Weapon:SetNextPrimaryFire(CurTime() + 0.3)

        
         
         if SERVER then self.Owner:SetVelocity(self.Owner:GetForward() * 100 + Vector(0,0,100)) end
         
         timer.Simple(0.3,self.PrimaryAttackDelay,self)
end

function SWEP:PrimaryAttackDelay()
         self.InAirDmg = 1
         self.JumpRefire = true
end

/*---------------------------------------------------------
	Holster
---------------------------------------------------------*/
function SWEP:Holster()
         return true
end
/*---------------------------------------------------------
	Deploy
---------------------------------------------------------*/
function SWEP:Deploy()
         self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
         return true
end
/*---------------------------------------------------------
	Draw hud
---------------------------------------------------------*/
function SWEP:DrawHUD()
end


