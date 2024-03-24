local map_cmd = require("keymap.bind").map_cmd
local map_cu = require("keymap.bind").map_cu
local map_cr = require("keymap.bind").map_cr
local map_callback = require("keymap.bind").map_callback

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

	["n|tk"] = map_cr("tabprevious"):with_noremap():with_silent():with_desc("tab: Move to previous tab"),
	["n|tj"] = map_cr("tabnext"):with_noremap():with_silent():with_desc("tab: Move to next tab"),

	["n|<leader>ccq"] = map_callback(function()
			local input = vim.fn.input("Quick Chat: ")
			if input ~= "" then
				require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
			end
		end)
		:with_noremap()
		:with_desc("tools: CopilotChat - Quick Chat"),
	["v|<leader>cce"] = map_cmd("<Cmd>CopilotChatExplainCN<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("tools: CopilotChat - Explain select code with CN"),
}
