local map_cmd = require("keymap.bind").map_cmd
local map_cu = require("keymap.bind").map_cu
return {
	["n|<A-h>"] = false,
	["n|<A-j>"] = false,
	["n|<A-k>"] = false,
	["n|<A-l>"] = false,

	["n|L"] = map_cmd("$"):with_noremap():with_desc("edit: Jump end of line"),
	["n|H"] = map_cmd("^"):with_noremap():with_desc("edit: Jump begin of line"),

	["v|L"] = map_cmd("$"):with_noremap():with_desc("edit: Jump end of line"),
	["v|H"] = map_cmd("^"):with_noremap():with_desc("edit: Jump begin of line"),
	["v|p"] = map_cmd("pgvy"):with_desc("edit: paste not replace"),

	["i|<C-j>"] = map_cmd("<Right>"):with_noremap():with_desc("edit: Move cursor to left"),
	["i|<C-k>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: Move cursor to right"),

	["n|<C-x>s"] = map_cu("SudaWrite"):with_silent():with_noremap():with_desc("editn: Save file using sudo"),
	["n|<A-[>"] = map_cu("SmartResizeLeft"):with_silent():with_noremap():with_desc("window: Resize -3 horizontally"),
	["n|<A-{>"] = map_cu("SmartResizeDown"):with_silent():with_noremap():with_desc("window: Resize -3 vertically"),
	["n|<A-}>"] = map_cu("SmartResizeUp"):with_silent():with_noremap():with_desc("window: Resize +3 vertically"),
	["n|<A-]>"] = map_cu("SmartResizeRight"):with_silent():with_noremap():with_desc("window: Resize +3 horizontally"),

	["i|jk"] = map_cmd("<Esc>"):with_noremap():with_silent():with_nowait():with_desc("edit: Exit insert mode"),
}
