love.graphics.setFont(love.graphics.newFont("font.ttf", 40))

require "moremath"
require "util"
require "classy"

require "box"
require "colorrect"
require "button"
require "theme"

local root = VBox:new({
	theme = require "defaultTheme"
})
:addChild(HBox:new()
	:addChild(Button:new{fitModeV = Control.FitMode.shrinkStart})
	:addChild(Button:new{fitModeV = Control.FitMode.shrinkStart})
	:addChild(Button:new{fitModeV = Control.FitMode.shrinkStart, fitModeH = Control.FitMode.shrinkCenter, expandH = true})
	:addChild(Button:new{fitModeV = Control.FitMode.shrinkStart})
	:addChild(Button:new{fitModeV = Control.FitMode.shrinkStart})
)

function love.update(dt)
	root:_update(dt)
end

function love.draw()
	root._rect.right, root._rect.bottom
		= love.graphics.getDimensions()
	root:_draw()
end

function love.mousepressed(x, y, ...)
	root:_mousepressed(x, y, ...)
end


