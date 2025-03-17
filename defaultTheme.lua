require "theme"

return Theme:new{
	Button = {
		primary = {
			normal = {
				fillColor = {0.4, 0.2, 1.0},
				textColor = {1.0, 1.0, 1.0},
				padding = 16,
				corner = 16,
			},
			hover = {
				fillColor = {0.5, 0.4, 1.0},
				textColor = {1.0, 1.0, 1.0},
				padding = 32,
				corner = 16,
			},
			pressed = {
				fillColor = {0.7, 0.6, 1.0},
				textColor = {1.0, 1.0, 1.0},
				padding = 32,
				corner = 32,
			},
		}
	}
}
