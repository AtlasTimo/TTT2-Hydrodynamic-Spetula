AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

local shootSound = Sound("whoosh.ogg")

function SWEP:Initialize()
	self.fuel = 1000
	self:SetClip1(self.fuel)
	self.coolDown = false

	sound.Add({
		name = "rotor",
		channel = CHAN_STATIC,
		volume = HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_rotor_sound_volume,
		level = 80,
		pitch = 100,
		sound = "rotor.wav"
	})

	hook.Add("KeyPress", "Start_Rotor", function(ply, key)
		if (not IsValid(self) or ply:GetActiveWeapon() ~= self) then return end
		if (not IsValid(self:GetOwner()) or ply:GetName() ~= self:GetOwner():GetName()) then return end
		if (key == IN_JUMP and ply:KeyDown(IN_ATTACK) or key == IN_ATTACK and ply:KeyDown(IN_JUMP)) then
			self:SendWeaponAnim(ACT_VM_IDLE_1)
			self.rotorSound:ChangePitch(130, 1)
		elseif (key == IN_ATTACK) then
			self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
		elseif (key == IN_JUMP) then
			self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
			self.rotorSound:ChangePitch(130, 1)
		end
	end)

	hook.Add("KeyRelease", "Back_To_Idle", function(ply, key)
		if (not IsValid(self) or ply:GetActiveWeapon() ~= self) then return end
		if (not IsValid(self:GetOwner()) or ply:GetName() ~= self:GetOwner():GetName()) then return end
		if (key == IN_ATTACK and ply:KeyDown(IN_JUMP)) then
			self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
		elseif (key == IN_JUMP and ply:KeyDown(IN_ATTACK)) then
			self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
			self.rotorSound:ChangePitch(100, 1)
		elseif (key == IN_ATTACK or key == IN_JUMP and not ply:KeyDown(IN_ATTACK) and not ply:KeyDown(IN_JUMP)) then
			self:SendWeaponAnim(ACT_VM_IDLE)
			self.rotorSound:ChangePitch(100, 1)
		end
	end)

	hook.Add("PlayerSwitchWeapon", "SwitchToSpetula", function(ply, old, new)
		if (not IsValid(self)) then return end
		if (not IsValid(self:GetOwner()) or ply:GetName() ~= self:GetOwner():GetName()) then return end
		if (self.rotorSound == nil) then
			self.rotorSound = CreateSound(self:GetOwner(), "rotor")
		end
		if (not ply:Alive()) then
			self.rotorSound:Stop()
			return
		end
		if (new == self and HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_rotor_sound_volume > 0) then
			self.rotorSound:Play()
			self.rotorSound:ChangePitch(30, 0)
			self.rotorSound:ChangePitch(100, 1)
		elseif (old == self) then
			self.rotorSound:ChangePitch(30, 1)
			timer.Simple(1, function()
				self.rotorSound:Stop()
			end)
		end
	end)
end

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + 1 / HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_rounds_per_second)
	if (HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_whoosh_sound_volume > 0) then
		self:GetOwner():EmitSound(shootSound, 100, math.random(90, 110), HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_whoosh_sound_volume)
	end
	self:ShootBurger()
end

function SWEP:Think()

	local ow = self:GetOwner()

	if (self.fuel > 1000 / 10 and self.coolDown) then
		self.coolDown = false
	end

	if (ow:KeyDown(IN_JUMP) and self.fuel > 0 and not self.coolDown) then
		self:ApplyFlyVelocity(ow)
		self.fuel = self.fuel - HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_fuel_drain_per_second / 30
	else
		if (self.fuel < 1000) then
			if (not self.coolDown) then
				self.coolDown = true
			end
			self.fuel = self.fuel + HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_fuel_gain_per_second / 30
		end
	end

	self:SetClip1(self.fuel)

	self:NextThink(CurTime() + 1 / 30)
	return true
end

function SWEP:ApplyFlyVelocity(ow)
	local velvec = HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_rotor_strength * Vector(0, 0, 1)

	if (ow:GetVelocity().z < 250) then
		velvec = 25 * Vector(0, 0, 1)
	end

	if (ow:KeyDown(IN_FORWARD)) then
		velvec = velvec + ow:GetForward() * 2
	end

	if (ow:KeyDown(IN_BACK)) then
		velvec = velvec - ow:GetForward() * 2
	end

	if (ow:KeyDown(IN_LEFT)) then
		velvec = velvec - ow:GetRight() * 2
	end

	if (ow:KeyDown(IN_RIGHT)) then
		velvec = velvec + ow:GetRight() * 2
	end

	ow:SetVelocity(velvec)
end

function SWEP:ShootBurger()
	local burger = ents.Create("ent_burger")
	local ow = self:GetOwner()
	burger:SetPos(ow:EyePos())
	burger:SetOwner(ow)
	burger:Spawn()
	burger:SetWeapon(self)

	local phys = burger:GetPhysicsObject()
	if (not IsValid(phys)) then return end

	local velocity = ow:GetAimVector()
	local angle = Angle(math.random(360), math.random(360), math.random(360))
	phys:SetAngles(angle)
	phys:ApplyForceCenter(velocity * 10 * 100000)
end