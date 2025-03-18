love.graphics.setFont(love.graphics.newFont("font.ttf", 40))

require "moremath"
require "util"
require "classy"

require "box"
require "colorrect"
require "button"
require "theme"
require "label"

local root = VBox:new{
	theme = require "defaultTheme"
}

local function loadExample(self)
	root = require("examples."..self.text)
	root:_update(dt)
	root:_update(dt)
	root:_update(dt)
	root:_update(dt)
	root:_update(dt)
	love.window.setMode(root.minW, root.minH)
end

for _, v in ipairs(love.filesystem.getDirectoryItems("examples")) do
	root:addChild(Button:new({text = v:sub(1, -5), onPress = loadExample}))
end

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
