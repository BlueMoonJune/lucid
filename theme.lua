

class ("Theme", {
	defaultStyle = "primary";

	getValue = function (self, object, value, style)
		return indexWithPath(self[object][style or self.defaultStyle], value)
	end
})
