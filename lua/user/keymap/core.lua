local map_cmd = require("keymap.bind").map_cmd
local map_callback = require("keymap.bind").map_callback
return {
	["n|<A-d>"] = false,
	["i|<A-d>"] = false,
	["t|<A-d>"] = false,

	["n|<C-h>"] = map_callback(function()
			require("smart-splits").move_cursor_left()
		end)
		:with_noremap()
		:with_desc("window: Focus left"),

	["n|<C-l>"] = map_callback(function()
			require("smart-splits").move_cursor_right()
		end)
		:with_noremap()
		:with_desc("window: Focus right"),

	["n|<C-j>"] = map_callback(function()
			require("smart-splits").move_cursor_down()
		end)
		:with_noremap()
		:with_desc("window: Focus down"),

	["n|<C-k>"] = map_callback(function()
			require("smart-splits").move_cursor_up()
		end)
		:with_noremap()
		:with_desc("window: Focus up"),
}
