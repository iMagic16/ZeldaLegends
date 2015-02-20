if (SERVER) then --the init.lua stuff goes in here
 
 
   AddCSLuaFile ("shared.lua");
 
 
   SWEP.Weight = 5;
   SWEP.AutoSwitchTo = false;
   SWEP.AutoSwitchFrom = false;
 
end
 
if (CLIENT) then --the cl_init.lua stuff goes in here
 
 
   SWEP.PrintName = "Bow";
   SWEP.Slot = 3;
   SWEP.SlotPos = 1;
   SWEP.DrawAmmo = true;
   SWEP.DrawCrosshair = true;
 
end
 
 
SWEP.Author = "Team rANdOm";
SWEP.Contact = "proz6@live.co.uk";
SWEP.Purpose = "Link's Bow";
SWEP.Instructions = "Left click to fire an arrow; right click to fire a fire arrow";
 
SWEP.Spawnable = true;
SWEP.AdminSpawnable = true;
 
SWEP.ViewModel = "models/weapons/v_pistol.mdl";
SWEP.WorldModel = "models/weapons/w_pistol.mdl";
 
SWEP.Primary.ClipSize = 1;
SWEP.Primary.DefaultClip = 1;
SWEP.Primary.Automatic = false;
SWEP.Primary.Ammo = "arrow";
 
SWEP.Secondary.ClipSize = 1;
SWEP.Secondary.DefaultClip = 1;
SWEP.Secondary.Automatic = false;
SWEP.Secondary.Ammo = "firearrow";

 
local ShootSound = Sound ("Metal.SawbladeStick");
 
function SWEP:Reload()
end
 
function SWEP:Think()
end
 
function SWEP:throw_attack (model_file)

	local tr = self.Owner:GetEyeTrace();
 
	self.Weapon:EmitSound (ShootSound);
	self.BaseClass.ShootEffects (self);
 
	if (!SERVER) then return end;
 
	local ent = ents.Create ("prop_physics");
	ent:SetModel (model_file);
 
	ent:SetPos (self.Owner:EyePos() + (self.Owner:GetAimVector() * 16));
	ent:SetAngles (self.Owner:EyeAngles());
	ent:Spawn();
 
	local phys = ent:GetPhysicsObject();
	
	local shot_length = tr.HitPos:Length();
	phys:ApplyForceCenter (self.Owner:GetAimVector():GetNormalized() *  math.pow(shot_length, 10));

end


function SWEP:PrimaryAttack()
	
	self:throw_attack ("models/props/zelda_legends/arrow.mdl");
end
 
function SWEP:SecondaryAttack()
	//self:throw_attack ("models/zelda/arrow2.mdl");
end