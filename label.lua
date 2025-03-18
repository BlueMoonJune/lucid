require "control"

class ("Label", {
	font = love.graphics.getFont();

	text = "Label";

	alignX = 0;
	alignY = 0;

	update = function (self, dt)
		local tw, th = self.font:getWidth(self.text), self.font:getHeight()
		for _ in self.text:gmatch("\n") do
			th = th + self.font:getHeight()
		end

		local theme = self:getThemeValue("normal")

		self.minW = math.max(tw, self.cminW) + theme.padding * 2 + theme.margin * 2
		self.minH = math.max(th, self.cminH) + theme.padding * 2 + theme.margin * 2
	end;

	draw = function (self)
		local tw, th = self.font:getWidth(self.text), self.font:getHeight()

		local theme = self:getThemeValue("normal")
		local m = theme.margin
		local l, t, r, b = self._rect.left + m, self._rect.top + m, self._rect.right - m, self._rect.bottom - m
		local w, h = r - l, b - t

		love.graphics.setColor(theme.fillColor)
		love.graphics.rectangle("fill", l, t, w, h, theme.corner, theme.corner)
		love.graphics.setColor(theme.textColor)
		love.graphics.print(self.text, math.lerp(l, r, self.alignX) - tw * self.alignX, math.lerp(t, b, self.alignY) - th * self.alignY)
	end;
})
:extend(Control)
