HYDRODYNAMIC_SPETULA = HYDRODYNAMIC_SPETULA or {}
HYDRODYNAMIC_SPETULA.CVARS = HYDRODYNAMIC_SPETULA.CVARS or {}

local hydrodynamic_spetula_rotor_sound_volume = CreateConVar("ttt_hydrodynamic_spetula_rotor_sound_volume", "1", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local hydrodynamic_spetula_whoosh_sound_volume = CreateConVar("ttt_hydrodynamic_spetula_whoosh_sound_volume", "1", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local hydrodynamic_spetula_fuel_drain_per_second = CreateConVar("ttt_hydrodynamic_spetula_fuel_drain_per_second", "150", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local hydrodynamic_spetula_fuel_gain_per_second = CreateConVar("ttt_hydrodynamic_spetula_fuel_gain_per_second", "30", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local hydrodynamic_spetula_rounds_per_second = CreateConVar("ttt_hydrodynamic_spetula_rounds_per_second", "3.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local hydrodynamic_spetula_rotor_strength = CreateConVar("ttt_hydrodynamic_spetula_rotor_strength", "15", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local hydrodynamic_spetula_burger_damage = CreateConVar("ttt_hydrodynamic_spetula_burger_damage", "1", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local hydrodynamic_spetula_burger_target_resulting_speed = CreateConVar("ttt_hydrodynamic_spetula_burger_target_resulting_speed", "0.5", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})

HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_rotor_sound_volume = hydrodynamic_spetula_rotor_sound_volume:GetFloat()
HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_whoosh_sound_volume = hydrodynamic_spetula_whoosh_sound_volume:GetFloat()
HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_fuel_drain_per_second = hydrodynamic_spetula_fuel_drain_per_second:GetInt()
HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_fuel_gain_per_second = hydrodynamic_spetula_fuel_gain_per_second:GetInt()
HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_rounds_per_second = hydrodynamic_spetula_rounds_per_second:GetFloat()
HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_rotor_strength = hydrodynamic_spetula_rotor_strength:GetInt()
HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_burger_damage = hydrodynamic_spetula_burger_damage:GetInt()
HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_burger_target_resulting_speed = hydrodynamic_spetula_burger_target_resulting_speed:GetFloat()

if SERVER then

  cvars.AddChangeCallback("ttt_hydrodynamic_spetula_rotor_sound_volume", function(name, old, new)
    HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_rotor_sound_volume = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_hydrodynamic_spetula_whoosh_sound_volume", function(name, old, new)
    HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_whoosh_sound_volume = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_hydrodynamic_spetula_fuel_drain_per_second", function(name, old, new)
    HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_fuel_drain_per_second = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_hydrodynamic_spetula_fuel_gain_per_second", function(name, old, new)
    HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_fuel_gain_per_second = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_hydrodynamic_spetula_rounds_per_second", function(name, old, new)
    HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_rounds_per_second = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_hydrodynamic_spetula_rotor_strength", function(name, old, new)
    HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_rotor_strength = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_hydrodynamic_spetula_burger_damage", function(name, old, new)
    HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_burger_damage = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_hydrodynamic_spetula_burger_target_resulting_speed", function(name, old, new)
    HYDRODYNAMIC_SPETULA.CVARS.hydrodynamic_spetula_burger_target_resulting_speed = tonumber(new)
  end, nil)
end
