require("control")

class ("Button", {
	name = "Button";

	text = "Button";

	font = love.graphics.getFont();

	alignX = 0.5;
	alignY = 0.5;
	padding = 8;

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

		self.minW = tw + theme.padding
		self.minH = th + theme.padding
	end;

	draw = function (self)
		local tw, th = self.font:getWidth(self.text), self.font:getHeight()
		local l, t, r, b = self._rect.left, self._rect.top, self._rect.right, self._rect.bottom
		local w, h = r - l, b - t

		local theme = self:getLerpedTheme()

		love.graphics.setColor(theme.fillColor)
		love.graphics.rectangle("fill", l, t, w, h, theme.corner, theme.corner)
		love.graphics.setColor(theme.textColor)
		love.graphics.print(self.text, math.lerp(l, r, self.alignX) - tw * self.alignX, math.lerp(t, b, self.alignY) - th * self.alignY)
	end;

	mousepressed = function (self, x, y, ...)
		self._pressProg = 1
	end
})
:extend(Control)
