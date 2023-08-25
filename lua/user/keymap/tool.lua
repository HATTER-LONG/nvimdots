local map_cmd = require("keymap.bind").map_cmd
local map_cu = require("keymap.bind").map_cu
local map_cr = require("keymap.bind").map_cr

return {

	["n|<leader>te"] = map_cr([[execute v:count . "ToggleTerm direction=float"]])
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),

	["t|<C-q>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle float"),

	["n|<leader>o"] = map_cu("Telescope lsp_document_symbols")
		:with_noremap()
		:with_silent()
		:with_desc("find: document symbols"),
	["n|<leader>as"] = map_cu("Telescope lsp_dynamic_workspace_symbols")
		:with_noremap()
		:with_silent()
		:with_desc("find: all workspace symbols"),

	["n|<leader>e"] = map_cr("NvimTreeToggle"):with_noremap():with_silent():with_desc("filetree: Toggle"),

	["t|<C-x>q"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
	["t|jk"] = false,
}
