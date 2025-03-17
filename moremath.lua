local function lerpTable(a, b, t)
	local ret = {}
	for k, v in pairs(a) do
		local u = b[k]
		if not u then
			ret[k] = v
		elseif not v then
			ret[k] = u
		else
			ret[k] = math.lerp(v, u, t)
		end
	end
	return ret
end

function math.lerp(a, b, t)
	if type(a) == "table" and type(b) == "table" then
		return lerpTable(a, b, t)
	end
	return a + (b - a) * t
end
