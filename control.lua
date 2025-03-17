
class ("Control", {
	--Callbacks
	update = function (self, dt) end;
	draw = function (self) end;
	mousepressed = function (self, x, y, ...) end;

	theme = nil;
	style = nil;

	minW = 0;
	minH = 0;

	anchors = {
		left = 0;
		right = 1;
		top = 0;
		bottom = 1;
	};

	offsets = {
		left = 0;
		right = 0;
		top = 0;
		bottom = 0;
	};

	_rect = {
		left = 0;
		right = 0;
		top = 0;
		bottom = 0;
	};

	expandH = false;
	expandV = false;
	stretchRatio = 1;

	parent = nil;
	children = {};

	getThemeValue = function (self, value, style, object)
		object = object or self.name
		return self.theme and self.theme:getValue(object, value, style or self.style) or self.parent and self.parent:getThemeValue(value, style or self.style, object)
	end;

	pointIn = function (self, x, y)
		local s = self._rect;
		return s.left <= x and x <= s.right
			and s.top <= y and y <= s.bottom
	end;

	fitInRect = function (self, l, r, t, b)
		self._rect.left, self._rect.right = self.fitModeH(l, r, self.minW)
		self._rect.top, self._rect.bottom = self.fitModeV(t, b, self.minH)
	end;

	_mousepressed = function (self, x, y, ...)
		for i = #self.children, 1, -1 do
			local c = self.children[i]
			if c:pointIn(x, y) then
				if c:_mousepressed(x, y, ...) then
					return true
				end
			end
		end
		return self:mousepressed(x, y, ...)
	end;

	_update = function (self, dt)
		for _, v in ipairs(self.children) do
			v:_update(dt)
		end
		self:update(dt)
	end;

	_draw = function (self)
		self:draw()
		for _, v in ipairs(self.children) do
			v:_calcRect()
			v:_draw()
		end
	end;

	_calcRect = function (self)
		local s = self._rect
		local p = self.parent._rect
		local a = self.anchors
		local o = self.offsets

		s.left = math.lerp(p.left, p.right, a.left) + o.left
		s.right = math.lerp(p.left, p.right, a.right) + o.right
		s.top = math.lerp(p.top, p.bottom, a.top) + o.top
		s.bottom = math.lerp(p.top, p.bottom, a.bottom) + o.bottom
	end;

	addChild = function(self, child)
		table.insert(self.children, child)
		child.parent = self
		return self
	end;

	__tostring = function (self) return self.name end;
})

Control.FitMode = {
	shrinkStart = function (s, e, min)
		return s, math.min(s + min, e)
	end;
	shrinkCenter = function (s, e, min)
		return (s + e - min) / 2, (s + e + min) / 2
	end;
	shrinkEnd = function (s, e, min)
		return math.max(s, e - min), e
	end;
	fill = function (s, e, _)
		return s, e
	end;
}

Control.fields.fitModeH = Control.FitMode.fill
Control.fields.fitModeV = Control.FitMode.fill
