require "control"

class ("VBox", {

	sortChildren = function (self)
		self.minH = 0
		self.minV = 0
		local stretchTotal = 0
		local stretchSpace = 0
		for _, c in ipairs(self.children) do
			self.minH = self.minH + c.minH
			self.minW = math.max(self.minW, c.minW)
			if c.expandV then
				stretchTotal = stretchTotal + c.stretchRatio
				if stretchSpace <= 0 then
					stretchSpace = stretchSpace +
						self._rect.bottom - self._rect.top
				end
			else
				stretchSpace = stretchSpace - c.minH
			end
		end
		local y = 0
		for _, c in ipairs(self.children) do
			local h
			if c.expandV then
				h = stretchSpace / stretchTotal * c.stretchRatio
			else
				h = c.minH
			end
			c._rect = {
				left = self._rect.left,
				right = self._rect.right,
				top = self._rect.top + y,
				bottom = self._rect.top + y + h,
			}
			y = y + h
		end
	end;

	update = function (self)
		self:sortChildren()
	end;

	_draw = function (self)
		self:draw()
		for _, v in ipairs(self.children) do
			v:_draw()
		end
	end;
})
:extend(Control)

class ("HBox", {
	name = "HBox";

	spacing = 4;

	sortChildren = function (self)
		self.minH = 0
		self.minV = 0
		local stretchTotal = 0
		local stretchSpace = 0
		for _, c in ipairs(self.children) do
			self.minW = self.minW + c.minW + self.spacing
			self.minH = math.max(self.minH, c.minH)
			if c.expandH then
				stretchTotal = stretchTotal + c.stretchRatio
				if stretchSpace <= 0 then
					stretchSpace = stretchSpace +
						self._rect.right - self._rect.left
				end
			else
				stretchSpace = stretchSpace - c.minW - self.spacing
			end
		end
		local x = 0
		for _, c in ipairs(self.children) do
			local w
			if c.expandH then
				w = stretchSpace / stretchTotal * c.stretchRatio
			else
				w = c.minW
			end
			c:fitInRect(
				self._rect.left + x,
				self._rect.left + x + w,
				self._rect.top,
				self._rect.bottom
			)
			x = x + w + self.spacing
		end
	end;

	update = function (self)
		self:sortChildren()
	end;

	_draw = function (self)
		self:draw()
		for _, v in ipairs(self.children) do
			v:_draw()
		end
	end;
})
:extend(Control)

