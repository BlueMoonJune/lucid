require "theme"

return Theme:new{
	Button = {
		primary = {
			normal = {
				fillColor = {0.4, 0.2, 1.0},
				textColor = {1.0, 1.0, 1.0},
				padding = 8,
				margin = 4,
				corner = 8,
			},
			hover = {
				fillColor = {0.5, 0.4, 1.0},
				textColor = {1.0, 1.0, 1.0},
				padding = 12,
				margin = 0,
				corner = 8,
			},
			pressed = {
				fillColor = {0.7, 0.6, 1.0},
				textColor = {1.0, 1.0, 1.0},
				padding = 12,
				margin = 0,
				corner = 16,
			},
		},
		secondary = {
			normal = {
				fillColor = {0.2, 0.2, 0.2},
				textColor = {1.0, 1.0, 1.0},
				padding = 8,
				margin = 4,
				corner = 8,
			},
			hover = {
				fillColor = {0.3, 0.3, 0.3},
				textColor = {1.0, 1.0, 1.0},
				padding = 12,
				margin = 0,
				corner = 8,
			},
			pressed = {
				fillColor = {0.5, 0.5, 0.5},
				textColor = {1.0, 1.0, 1.0},
				padding = 12,
				margin = 0,
				corner = 16,
			},
		},
	},
	Label = {
		primary = {
			normal = {
				textColor = {1.0, 1.0, 1.0},
				fillColor = {0, 0, 0, 0},
				padding = 0,
				margin = 0,
				corner = 0,
			},
		},
		output = {
			normal = {
				textColor = {1.0, 1.0, 1.0},
				fillColor = {0.1, 0.1, 0.1},
				padding = 8,
				margin = 4,
				corner = 0,
			},
		},
	},
	HBox = {
		primary = {
			spacing = 0
		}
	},
	VBox = {
		primary = {
			spacing = 0
		}
	},
}
