local top = VBox:new{expandH = true, fitModeH = Control.FitMode.shrinkCenter}
local root = HBox:new({theme = require "defaultTheme"})
	:addChild(VBox:new({expandV = true, fitModeV = Control.FitMode.shrinkCenter})
		:addChild(top)
)

local function toggle(self)
	if self.style == "secondary" then
		self.style = "primary"
	else
		self.style = "secondary"
	end
end

for _ = 1, 16 do
	local box = HBox:new()
	for _ = 1, 16 do
		box:addChild(Button:new{cminW = 0, cminH = 0, style = "secondary", text = "  ", onPress = toggle})
	end
	top:addChild(box)
end

return root
