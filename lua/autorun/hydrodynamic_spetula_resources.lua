if SERVER then
    resource.AddFile("materials/VGUI/ttt/weapon_hydrodynamic_spetula.png")

    resource.AddFile("materials/hydrodynamic_spetula/hydrodynamic_spetula_mats/texture.vmt")
    resource.AddFile("materials/hydrodynamic_spetula/burger_mats/texture.vmt")

    resource.AddFile("sound/whoosh.ogg")
    resource.AddFile("sound/rotor.wav")

    resource.AddFile("models/c_hydrodynamic_spetula/c_hydrodynamic_spetula.dx80.vtx")
    resource.AddFile("models/c_hydrodynamic_spetula/c_hydrodynamic_spetula.dx90.vtx")
    resource.AddFile("models/c_hydrodynamic_spetula/c_hydrodynamic_spetula.mdl")
    resource.AddFile("models/c_hydrodynamic_spetula/c_hydrodynamic_spetula.sw.vtx")
    resource.AddFile("models/c_hydrodynamic_spetula/c_hydrodynamic_spetula.vvd")

    resource.AddFile("models/w_hydrodynamic_spetula/w_hydrodynamic_spetula.dx80.vtx")
    resource.AddFile("models/w_hydrodynamic_spetula/w_hydrodynamic_spetula.dx90.vtx")
    resource.AddFile("models/w_hydrodynamic_spetula/w_hydrodynamic_spetula.mdl")
    resource.AddFile("models/w_hydrodynamic_spetula/w_hydrodynamic_spetula.sw.vtx")
    resource.AddFile("models/w_hydrodynamic_spetula/w_hydrodynamic_spetula.vvd")

    resource.AddFile("models/w_burger/w_burger.dx80.vtx")
    resource.AddFile("models/w_burger/w_burger.dx90.vtx")
    resource.AddFile("models/w_burger/w_burger.mdl")
    resource.AddFile("models/w_burger/w_burger.sw.vtx")
    resource.AddFile("models/w_burger/w_burger.vvd")

    util.PrecacheModel("models/w_burger/w_burger.mdl")
end