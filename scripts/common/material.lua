--- Sapiens++: material.lua
--- @author SirLich

local mod = {
	loadOrder = 1
}

-- Math
local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3

local function mat(key, color, roughness, metal)
	return {key = key, color = color, roughness = roughness, metal = metal or 0.0}
end

function mod:onload(material)
	mj:insertIndexed(material.types, mat("dodoBody", vec3(0.069978, 0.060378, 0.052107) * 1.1, 1.0))
	mj:insertIndexed(material.types, mat("dodoFace", vec3(0.8, 0.8, 0.8) * 1.1, 1.0))
	mj:insertIndexed(material.types, mat("dodoEye", vec3(0.153551, 0.566716, 0.8) * 1.1, 1.0))
end

return mod