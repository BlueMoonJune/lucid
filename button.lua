require("control")

class ("Button", {
	text = "Button";

	font = love.graphics.getFont();

	alignX = 0.5;
	alignY = 0.5;

	pressed = false;
	onPress = function () end;
	onRelease = function () end;

	_hoverProg = 0;
	_pressProg = 0;

	getLerpedTheme = function (self)
		return math.lerp(math.lerp(self:getThemeValue("normal"), self:getThemeValue("hover"), self._hoverProg), self:getThemeValue("pressed"), self._pressProg)
	end;

	update = function (self, dt)
		local tw, th = self.font:getWidth(self.text), self.font:getHeight()

		self._hoverProg = math.lerp(self._hoverProg,
			self:pointIn(love.mouse.getPosition()) and 1 or 0, 0.1
		)

		self._pressProg = math.lerp(self._pressProg, 0, 0.01)

		local theme = self:getLerpedTheme()

		self.minW = math.max(tw, self.cminW) + theme.padding * 2 + theme.margin * 2
		self.minH = math.max(th, self.cminH) + theme.padding * 2 + theme.margin * 2
	end;

	draw = function (self)
		local tw, th = self.font:getWidth(self.text), self.font:getHeight()

		local theme = self:getLerpedTheme()
		local m, p = theme.margin, theme.padding
		local l, t, r, b = self._rect.left + m, self._rect.top + m, self._rect.right - m, self._rect.bottom - m
		local w, h = r - l, b - t

		love.graphics.setColor(theme.fillColor)
		love.graphics.rectangle("fill", l, t, w, h, theme.corner, theme.corner)
		love.graphics.setColor(theme.textColor)
		love.graphics.print(self.text, math.lerp(l + p, r - p, self.alignX) - tw * self.alignX, math.lerp(t + p, b - p, self.alignY) - th * self.alignY)
	end;

	mousepressed = function (self, x, y, ...)
		print(...)
		self:onPress(x - self._rect.left, y - self._rect.top)
		self._pressProg = 1
	end
})
:extend(Control)
