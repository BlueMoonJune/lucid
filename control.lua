Control = class ({
	name = "Control";

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

	expandV = false;
	stretchRatio = 1;

	parent = nil;
	children = {};

	--LÖVE specific
	customDraw = function (self)
		local s = self._rect
		love.graphics.rectangle("line", s.left, s.top,
			s.right - s.left, s.bottom - s.top)
	end;

	_draw = function (self)
		self:customDraw()
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
