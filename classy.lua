local function copy(source, into)
	into = into or {}
	for k, v in pairs(source) do
		into[k] = into[k] or v
	end
	return into
end

local function init(self, initer)
	for k, v in pairs(initer) do
		self[k] = v
	end
	return self
end

local function new(self, ...)
	local ret = {}
	for k, v in pairs(self.fields) do
		if type(v) == "table" then
			v = copy(v)
		end
		ret[k] = v
	end
	setmetatable(ret, self.meta)
	if self.ctor then self.ctor(ret, ...) end
	return ret
end

local function is(self, type)
	return self.type.heirarchy[type]
end

function extend(class, base)
	for k, v in pairs(base) do
		if type(v) == "function" then
			class[k] = class[k] or v
		end
	end
	copy(base.fields, class.fields)
	copy(base.meta, class.meta)
	copy(base.heirarchy, class.heirarchy)
	return class
end

function class(t)
	t.type = t
	local fields, meta = {}, {__index = t}
	for k, v in pairs(t) do
		if k:sub(1, 2) == "__" then
			meta[k] = v
			t[k] = nil
		elseif type(v) ~= "function" then
			fields[k] = v
			t[k] = nil
		end
	end
	t.heirarchy = {[t] = true}
	t.fields = fields
	t.meta = meta
	t.new = new
	t.extend = extend
	t.is = is
	t.init = init
	return t
end
