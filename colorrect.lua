require "control"

class ("ColorRect", {
	color = {1, 1, 1, 0};
	ctor = function (self, r, g, b, a)
		if r then
			self.color = {r, g, b, a}
		end
	end;
	draw = function (self)
		local s = self._rect
		local col = {love.graphics.getColor()}
		love.graphics.setColor(self.color)
		love.graphics.rectangle("fill", s.left, s.top,
			s.right - s.left, s.bottom - s.top)
		love.graphics.setColor(col)
	end;
})
:extend(Control)
