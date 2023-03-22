include("shared.lua")

local WorldModel = ClientsideModel(SWEP.WorldModel)
WorldModel:SetSkin(1)
WorldModel:SetNoDraw(true)

function SWEP:DrawWorldModel()
	local _Owner = self:GetOwner()

		if (IsValid(_Owner)) then
			-- Specify a good position
			local offsetVec = Vector(2, -1, -8)
			local offsetAng = Angle(180, 0, 2)

			local boneid = _Owner:LookupBone("ValveBiped.Bip01_R_Hand") -- Right Hand
			if !boneid then return end

			local matrix = _Owner:GetBoneMatrix(boneid)
			if !matrix then return end

			local newPos, newAng = LocalToWorld(offsetVec, offsetAng, matrix:GetTranslation(), matrix:GetAngles())

			WorldModel:SetPos(newPos)
			WorldModel:SetAngles(newAng)

			WorldModel:SetupBones()
		else
			WorldModel:SetPos(self:GetPos())
			WorldModel:SetAngles(self:GetAngles())
		end

		WorldModel:DrawModel()
end

function SWEP:PrimaryAttack()

end