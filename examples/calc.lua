local label = Label:new{fitModeH = Control.FitMode.fill, text = "", alignX = 1, alignY = 0.5, style = "output", expandH = true}
local reg = 0
local op = Label:new{text = " ", alignY = 0.5, alignX = 0.5, style = "output", cminW = 40}
local shouldClear = false

local function changeSign()
	if shouldClear then
		shouldClear = false
		label.text = ""
	end
	if label.text:sub(1, 1) == "-" then
		label.text = label.text:sub(2, -1)
	else
		label.text = "-" .. label.text
	end
end

local function addInput(self)
	if shouldClear then
		shouldClear = false
		label.text = ""
	end
	label.text = label.text..self.text
end

local function addOp(self)
	reg = tonumber(label.text)
	if not reg then
		label.text = "Err:invld"
	else
		op.text = self.text
	end
	shouldClear = true
end

local function del()
	label.text = label.text:sub(1, -2)
end

local function evaluate()
	if op.text == " " then return end
	local v = tonumber(label.text)
	if not v then
		label.text = "Err:invld"
		shouldClear = true
		return
	end
	if     op.text == "+" then
		reg = reg + v
	elseif op.text == "-" then
		reg = reg - v
	elseif op.text == "×" then
		reg = reg * v
	elseif op.text == "÷" then
		reg = reg / v
	elseif op.text == "^" then
		reg = reg ^ v
	end
	label.text = tostring(reg)
	op.text = "="
	shouldClear = true
end

local root = VBox:new({
	theme = require "defaultTheme"
})
	:addChild(HBox:new()
		:addChild(op)
		:addChild(label)
	)
	:addChild(HBox:new({expandV = true})
		:addChild(Button:new{expandH = true, text = "CE", cminW = 40, cminH = 40, onPress = function () label.text = "" end})
		:addChild(Button:new{expandH = true, text = "±", cminW = 40, cminH = 40, onPress = changeSign})
		:addChild(Button:new{expandH = true, text = "^", cminW = 40, cminH = 40, onPress = addOp})
		:addChild(Button:new{expandH = true, text = "÷", cminW = 40, cminH = 40, onPress = addOp})
	)
	:addChild(HBox:new({expandV = true})
		:addChild(Button:new{expandH = true, text = "7", cminW = 40, cminH = 40, style = "secondary", onPress = addInput})
		:addChild(Button:new{expandH = true, text = "8", cminW = 40, cminH = 40, style = "secondary", onPress = addInput})
		:addChild(Button:new{expandH = true, text = "9", cminW = 40, cminH = 40, style = "secondary", onPress = addInput})
		:addChild(Button:new{expandH = true, text = "×", cminW = 40, cminH = 40, onPress = addOp})
	)
	:addChild(HBox:new({expandV = true})
		:addChild(Button:new{expandH = true, text = "4", cminW = 40, cminH = 40, style = "secondary", onPress = addInput})
		:addChild(Button:new{expandH = true, text = "5", cminW = 40, cminH = 40, style = "secondary", onPress = addInput})
		:addChild(Button:new{expandH = true, text = "6", cminW = 40, cminH = 40, style = "secondary", onPress = addInput})
		:addChild(Button:new{expandH = true, text = "-", cminW = 40, cminH = 40, onPress = addOp})
	)
	:addChild(HBox:new({expandV = true})
		:addChild(Button:new{expandH = true, text = "1", cminW = 40, cminH = 40, style = "secondary", onPress = addInput})
		:addChild(Button:new{expandH = true, text = "2", cminW = 40, cminH = 40, style = "secondary", onPress = addInput})
		:addChild(Button:new{expandH = true, text = "3", cminW = 40, cminH = 40, style = "secondary", onPress = addInput})
		:addChild(Button:new{expandH = true, text = "+", cminW = 40, cminH = 40, onPress = addOp})
	)
	:addChild(HBox:new({expandV = true})
		:addChild(Button:new{expandH = true, text = "0", cminW = 40, cminH = 40, style = "secondary", onPress = addInput})
		:addChild(Button:new{expandH = true, text = ".", cminW = 40, cminH = 40, style = "secondary", onPress = addInput})
		:addChild(Button:new{expandH = true, text = "<]", cminW = 40, cminH = 40, style = "secondary", onPress = del})
		:addChild(Button:new{expandH = true, text = "=", cminW = 40, cminH = 40, onPress = evaluate})
	)

return root

