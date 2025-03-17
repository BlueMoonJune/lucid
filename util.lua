function indexWithPath(t, path)
	for k in path:gmatch("[^.]+") do
		if not t then return end
		t = t[k]
	end
	return t
end
