SWEP.PrintName			= "Hydrodynamic Spetula"
SWEP.Author				= "Atlas"
SWEP.Instructions		= "Right click to fly\nLeft click to shoot some Krabby Patty"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.ClipSize		= 1000
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.Slot				= 1
SWEP.SlotPos			= 2
SWEP.DrawAmmo			= true
SWEP.DrawCrosshair		= true

SWEP.HoldType 	= "pistol"
SWEP.ViewModelFOV = 45
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ViewModel = "models/c_hydrodynamic_spetula/c_hydrodynamic_spetula.mdl"
SWEP.WorldModel = "models/w_hydrodynamic_spetula/w_hydrodynamic_spetula.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true

SWEP.Icon 		= "VGUI/ttt/weapon_hydrodynamic_spetula.png"

SWEP.Base 			= "weapon_tttbase"
SWEP.Kind 			= WEAPON_EQUIP2
SWEP.AutoSpawnable 	= false
SWEP.AmmoEnt 		= "item_ammo_ttt"

SWEP.CanBuy = {ROLE_DETECTIVE}
SWEP.InLoadoutFor 	= nil
SWEP.LimitedStock 	= true
SWEP.AllowDelete 	= false
SWEP.AllowDrop 		= true

if CLIENT then
	SWEP.EquipMenuData = {
		type = "Weapon",
		desc = "Right click to fly\nLeft click to shoot some Krabby Patty"
	};
end
