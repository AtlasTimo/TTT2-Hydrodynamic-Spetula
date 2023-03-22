CLGAMEMODESUBMENU.base = "base_gamemodesubmenu"
CLGAMEMODESUBMENU.title = "submenu_addons_hydrodynamic_spetula_title"

function CLGAMEMODESUBMENU:Populate(parent)
	local form = vgui.CreateTTT2Form(parent, "help_hydrodynamic_spetula_general")

	form:MakeSlider({
		label = "label_hydrodynamic_spetula_fuel_drain_per_second",
		serverConvar = "ttt_hydrodynamic_spetula_fuel_drain_per_second",
		min = 10,
		max = 500,
		decimal = 0
	})

	form:MakeSlider({
		label = "label_hydrodynamic_spetula_fuel_gain_per_second",
		serverConvar = "ttt_hydrodynamic_spetula_fuel_gain_per_second",
		min = 10,
		max = 500,
		decimal = 0
	})

	form:MakeSlider({
		label = "label_hydrodynamic_spetula_rounds_per_second",
		serverConvar = "ttt_hydrodynamic_spetula_rounds_per_second",
		min = 0.5,
		max = 15,
		decimal = 1
	})

	form:MakeSlider({
		label = "label_hydrodynamic_spetula_rotor_strength",
		serverConvar = "ttt_hydrodynamic_spetula_rotor_strength",
		min = 10,
		max = 25,
		decimal = 0
	})

	form:MakeSlider({
		label = "label_hydrodynamic_spetula_burger_damage",
		serverConvar = "ttt_hydrodynamic_spetula_burger_damage",
		min = 1,
		max = 100,
		decimal = 0
	})

	form:MakeSlider({
		label = "label_hydrodynamic_spetula_burger_target_resulting_speed",
		serverConvar = "ttt_hydrodynamic_spetula_burger_target_resulting_speed",
		min = 0,
		max = 1,
		decimal = 2
	})

	local form2 = vgui.CreateTTT2Form(parent, "help_hydrodynamic_spetula_sound")

	form2:MakeSlider({
		label = "label_hydrodynamic_spetula_rotor_sound_volume",
		serverConvar = "ttt_hydrodynamic_spetula_rotor_sound_volume",
		min = 0,
		max = 1,
		decimal = 2
	})

	form2:MakeSlider({
		label = "label_hydrodynamic_spetula_whoosh_sound_volume",
		serverConvar = "ttt_hydrodynamic_spetula_whoosh_sound_volume",
		min = 0,
		max = 1,
		decimal = 2
	})
end
