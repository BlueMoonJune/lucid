require "moremath"
require "classy"
require "box"
require "colorrect"

local root = VBox:new()
	:addChild(HBox:new()
		:addChild(ColorRect:new(0, 1, 0):init{
			minW = 100
		})
		:addChild(ColorRect:new(0, 1, 1):init{
			expandH = true;
			minH = 100
		})
		:addChild(ColorRect:new(0, 0, 1):init{
			minW = 100
		})
	)
	:addChild(ColorRect:new(1, 1, 1):init{
		expandV = true;
	})
	:addChild(ColorRect:new(1, 0, 0, 1):init{
		minH = 100
	})

function love.draw()
	root._rect.right, root._rect.bottom
		= love.graphics.getDimensions()
	root:_draw()
end


