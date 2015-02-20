AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

/*=======================================================================
 _______                                  _   _     _  ____ -Tomcat& Magic    
|__   __|                           /\   | \ | |   | |/ __ \           
   | | ___  __ _ _ __ ___     _ __ /  \  |  \| | __| | |  | |_ __ ___  
   | |/ _ \/ _` | '_ ` _ \   | '__/ /\ \ | . ` |/ _` | |  | | '_ ` _ \ 
   | |  __/ (_| | | | | | |  | | / ____ \| |\  | (_| | |__| | | | | | |
   |_|\___|\__,_|_| |_| |_|  |_|/_/    \_\_| \_|\__,_|\____/|_| |_| |_|
=========================================================================*/

function ENT:Initialize(ent)

	self.Entity:SetModel("models/rupee/rupee_yello.mdl");
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	
		local phys = self.Entity:GetPhysicsObject()
		if (phys:IsValid()) then
			phys:Wake()
			phys:SetMass(10000)
		end
	end

function ENT:SpawnFunction(pl, tr)
	if (!tr.HitWorld) then return end;
	local e = ents.Create("yellow_rupee");
	e:SetPos(tr.HitPos + Vector(0, 0, 50));
	e:Spawn();
	e:Activate();
	return e;
end

	
function SetValue(ent)
	if self.Rupee and self.Rupee:IsValid() then
	self.Entity:SetValue( 1 )
end
end

function ENT:Touch( hitEnt )
	if(hitEnt:IsValid() and hitEnt:IsPlayer()) then
 	hitEnt:AddRupees( 10 )
	self.Entity:Remove()
end
end

function AddToRupeeCounter()
	self.CurrentRupees=1+self.CurrentRupees
end
