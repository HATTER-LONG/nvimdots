local map_cmd = require("keymap.bind").map_cmd
local map_cu = require("keymap.bind").map_cu
return {
	["n|L"] = map_cmd("$"):with_noremap():with_desc("edit: Jump end of line"),
	["n|H"] = map_cmd("^"):with_noremap():with_desc("edit: Jump begin of line"),

	["v|L"] = map_cmd("$"):with_noremap():with_desc("edit: Jump end of line"),
	["v|H"] = map_cmd("^"):with_noremap():with_desc("edit: Jump begin of line"),
	["v|p"] = map_cmd("pgvy"):with_desc("edit: paste not replace"),

	["i|<C-j>"] = map_cmd("<Right>"):with_noremap():with_desc("edit: Move cursor to left"),
	["i|<C-k>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: Move cursor to right"),

	["n|<C-x>s"] = map_cu("SudaWrite"):with_silent():with_noremap():with_desc("editn: Save file using sudo"),
}
