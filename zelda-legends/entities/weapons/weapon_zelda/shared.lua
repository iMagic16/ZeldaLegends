if (SERVER) then
	AddCSLuaFile("shared.lua")
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= true
	SWEP.AutoSwitchFrom		= false

end

if (CLIENT) then
	SWEP.PrintName			= "Master Sword"
	SWEP.DrawAmmo			= false
	SWEP.DrawCrosshair		= true
	SWEP.ViewModelFOV		= 70
	SWEP.ViewModelFlip		= true
	SWEP.CSMuzzleFlashes	= false
end



SWEP.Author		    = "Team rANdOm"
SWEP.Contact		= "www.randomgs.com"
SWEP.Purpose		= "Do powerful Magic attacks on your enemies, Zelda-style."
SWEP.Instructions	= "Primary Fire: Fireball(10mp)\nSecondary Fire: Iceball(10mp)\nReload: PowerBlast(100mp)"


SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/v_zeldahand.mdl"
SWEP.WorldModel			= "models/weapons/zeldahand.mdl"

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
	Reload (Spin attack)
---------------------------------------------------------*/
SWEP.Spinning = 0
function SWEP:Reload()
         if self.ReloadRate == 0 then return end
         if SERVER then self.Owner:EmitSound(Sound("player_snd/zelda/"..tostring(math.random(1,2))..".wav")) end

         self.ReloadRate = 0

         timer.Simple(1,self.ReloadReset,self)
         timer.Simple(4,self.ReloadReset2,self)
         
         self.Spinning = 1
         
         if SERVER then 
         
         self.EffectTable = {}
         
         for i = 1,20 do
             local firetrail = ents.Create("env_smoketrail")
             table.insert(self.EffectTable,firetrail)
         end
         
         for _,ent in pairs(self.EffectTable) do
             ent:SetPos(self.Owner:GetPos() + Vector(math.random(0,150),math.random(0,150),35))
             ent:SetParent(self.Owner)
             ent:SetKeyValue("spawnrate","500")
             ent:SetKeyValue("lifetime","0.7")
             ent:SetKeyValue("startcolor","255 130 0")
             ent:SetKeyValue("endcolor","220 100 0")
             ent:SetKeyValue("emittime","2")
             ent:SetKeyValue("startsize","20")
             ent:SetKeyValue("endsize","1")
             ent:SetKeyValue("spawnradius","10")
             ent:Spawn()
         end
         end

end

function SWEP:ReloadReset()
         self.Spinning = 0
           if SERVER then
            for _,ent in pairs(self.EffectTable) do
             ent:Remove()
            end
           end
end

function SWEP:ReloadReset2()
         self.ReloadRate = 1
end

/*---------------------------------------------------------
         Think (Jump attack stuff)
---------------------------------------------------------*/
function SWEP:JumpReset()
         self.JumpRefire = true
end

function SWEP:Think()
          
          /*---------------------------------------------------------
                     Iceball think
         ---------------------------------------------------------*/
         if SERVER then
         self.plasmatablePreCheck = ents.FindByClass("env_citadel_energy_core")
         
         self.plasmatable = {}
         
         for _,core in pairs(self.plasmatablePreCheck) do
             if core:GetKeyValues()["globalname"] == self.Owner:Name().."rifleshot" then
                table.insert(self.plasmatable,core)
             end
         end


         if self.plasmatable != nil then
            for _,plasmashot in pairs(self.plasmatable) do
                
                local trace = {}
                trace.start = plasmashot:GetPos()
                trace.endpos = plasmashot:GetPos() + (plasmashot:GetForward() * 30)
                trace.filter = {plasmashot,self.Owner}
                
                local tr = util.TraceLine(trace)

                if !tr.Hit then
                   plasmashot:SetPos(plasmashot:GetPos() + (plasmashot:GetForward() * 20))
                else


                   for _,pl in pairs(player.GetAll()) do
                       umsg.Start("GayRayFixMsg",pl)
                       umsg.Vector(plasmashot:GetPos())
                       umsg.End()
                   end
                   

                   
                   local dmg = 50
                   local radius = 50

                   util.BlastDamage(self.Weapon,self.Owner,plasmashot:GetPos(),radius,dmg)
                   plasmashot:EmitSound(Sound("ambient/levels/labs/electric_explosion1.wav"))

                   plasmashot:Fire("kill","",0)


                end
            end
         end
         end
end

function GayRayEffectFix(um)
         local effectdata = EffectData()
         effectdata:SetOrigin( um:ReadVector() )
         util.Effect( "swep_plasmashot", effectdata )
end

usermessage.Hook("GayRayFixMsg",GayRayEffectFix)

/*---------------------------------------------------------
	PrimaryAttack (Attack attack ^^)
---------------------------------------------------------*/
function SWEP:PrimaryAttack()
         
         self.Weapon:SetNextPrimaryFire(CurTime() + 0.3)
         if SERVER then self.Owner:EmitSound(Sound("npc/vort/claw_swing"..tostring(math.random(1,2))..".wav")) end
         if SERVER then self.Owner:EmitSound(Sound("Zsword/oot-AdultLink_Sword"..tostring(math.random(1,3))..".wav")) end

         local ang = self.Owner:GetAimVector()
	 local spos = self.Owner:GetShootPos()

	 local trace = {}
	 trace.start = spos
	 trace.endpos = spos + (ang * 150)
	 trace.filter = self.Owner
	
	 local tr = util.TraceLine(trace)
	 
	 if tr.HitNonWorld then
	    local bullet = {}
	    bullet.Num=5
	    bullet.Src = self.Owner:GetShootPos()
	    bullet.Dir= self.Owner:GetAimVector()
	    bullet.Spread = Vector(0.2,0.2,0.2)
	    bullet.Tracer = 0
	    bullet.Force = 3
	    bullet.Damage = 3
	    self.Owner:FireBullets(bullet)
	    self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)

         elseif tr.HitWorld then
            self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
         elseif !tr.Hit then
            self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
          if SERVER then
            if self.Owner:Health() >= 90 then

            self.plasma = ents.Create("env_citadel_energy_core")
            self.plasma:SetKeyValue("scale","2")
            self.plasma:SetKeyValue("spawnflags","3")
            self.plasma:SetKeyValue("globalname",self.Owner:Name().."rifleshot")
            self.plasma:SetPos(self.Owner:GetShootPos())
            self.plasma:SetAngles(self.Owner:GetAngles())
            self.plasma:Spawn()

            table.insert(self.plasmatable,self.plasma)
            end
          end
         end
         

end

/*---------------------------------------------------------
	SecondaryAttack (Jump attack)
---------------------------------------------------------*/
SWEP.InAirDmg = 0
function SWEP:SecondaryAttack()
         if SERVER then self.Owner:EmitSound(Sound("Zsword/oot-AdultLink_Sword"..tostring(math.random(2,3))..".wav")) end
         if SERVER then self.Owner:EmitSound(Sound("player/suit_sprint.wav")) end
         
         self.Weapon:SetNextSecondaryFire(CurTime() + 100)
         self.Weapon:SetNextPrimaryFire(CurTime() + 100)

    
         
         if SERVER then self.Owner:SetVelocity(self.Owner:GetForward() * 200 + Vector(0,0,200)) end
         
         timer.Simple(0.2,self.SecondaryAttackDelay,self)
end

function SWEP:SecondaryAttackDelay()
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


