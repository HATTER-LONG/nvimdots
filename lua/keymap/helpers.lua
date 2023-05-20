_G._command_panel = function()
	require("telescope.builtin").keymaps({
		lhs_filter = function(lhs)
			return not string.find(lhs, "Þ")
		end,
		layout_config = {
			width = 0.6,
			height = 0.6,
			prompt_position = "top",
		},
	})
end

local _gitui = nil
_G._toggle_gitui = function()
	if vim.fn.executable("gitui") == 1 then
		if not _gitui then
			_gitui = require("toggleterm.terminal").Terminal:new({
				cmd = "gitui",
				direction = "float",
				close_on_exit = true,
				hidden = true,
			})
		end
		_gitui:toggle()
	else
		vim.notify("Command [gitui] not found!", vim.log.levels.ERROR, { title = "toggleterm.nvim" })
	end
end
