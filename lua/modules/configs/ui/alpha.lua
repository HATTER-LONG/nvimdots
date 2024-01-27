return function()
	local alpha = require("alpha")
	require("alpha.term")
	local dashboard = require("alpha.themes.dashboard")
	local vim_path = require("core.global").vim_path
	require("modules.utils").gen_alpha_hl()

	-- dashboard.section.header.val = "  𝕟 𝕖 𝕠 𝕧 𝕚 𝕞  "

	dashboard.section.header.val = {
		[[████████╗██╗  ██╗██╗███████╗    ██╗███████╗    ███████╗██╗███╗   ██╗███████╗]],
		[[╚══██╔══╝██║  ██║██║██╔════╝    ██║██╔════╝    ██╔════╝██║████╗  ██║██╔════╝]],
		[[   ██║   ███████║██║███████╗    ██║███████╗    █████╗  ██║██╔██╗ ██║█████╗  ]],
		[[   ██║   ██╔══██║██║╚════██║    ██║╚════██║    ██╔══╝  ██║██║╚██╗██║██╔══╝  ]],
		[[   ██║   ██║  ██║██║███████║    ██║███████║    ██║     ██║██║ ╚████║███████╗]],
		[[   ╚═╝   ╚═╝  ╚═╝╚═╝╚══════╝    ╚═╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═══╝╚══════╝]],
	}

	dashboard.section.header.opts.hl = "AlphaHeader"

	local function button(sc, txt, leader_txt, keybind, keybind_opts)
		local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

		local opts = {
			position = "center",
			shortcut = sc,
			cursor = 5,
			width = 50,
			align_shortcut = "right",
			hl = "AlphaButtons",
			hl_shortcut = "AlphaShortcut",
		}

		if nil == keybind then
			keybind = sc_after
		end
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_after, keybind, keybind_opts }

		local function on_press()
			-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
			local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
			vim.api.nvim_feedkeys(key, "t", false)
		end

		return {
			type = "button",
			val = txt,
			on_press = on_press,
			opts = opts,
		}
	end

	local leader = " "
	dashboard.section.buttons.val = {
		button("space f c", " Scheme change", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope.builtin").colorscheme()
			end,
		}),
		button("space f r", " File frecency", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope").extensions.frecency.frecency({})
			end,
		}),
		button("space f e", "󰋚 File history", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope.builtin").oldfiles()
			end,
		}),
		button("space f p", " Project find", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope").extensions.projects.projects({})
			end,
		}),
		button("space f f", "󰈞 File find", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope.builtin").find_files()
			end,
		}),
		button("space f w", " Word find", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope.builtin").live_grep()
			end,
		}),
	}
	dashboard.section.buttons.opts.hl = "AlphaButtons"

	local function footer()
		local stats = require("lazy").stats()
		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		return "   Have Fun with neovim"
			.. "  󰀨 v"
			.. vim.version().major
			.. "."
			.. vim.version().minor
			.. "."
			.. vim.version().patch
			.. "  󰂖 "
			.. stats.count
			.. " plugins in "
			.. ms
			.. "ms"
	end

	dashboard.section.footer.val = footer()
	dashboard.section.footer.opts.hl = "AlphaFooter"

	local width = 46
	local height = 25 -- two pixels per vertical space
	dashboard.section.terminal.command = "cat | " .. vim_path .. "/thisisfine.sh"
	dashboard.section.terminal.width = width
	dashboard.section.terminal.height = height
	dashboard.section.terminal.opts.redraw = true

	local head_butt_padding = 2
	local header_padding = 1
	local foot_butt_padding = 1

	dashboard.config.layout = {
		{ type = "padding", val = header_padding },
		dashboard.section.terminal,
		{ type = "padding", val = 3 },
		dashboard.section.header,
		{ type = "padding", val = head_butt_padding },
		dashboard.section.buttons,
		{ type = "padding", val = foot_butt_padding },
		dashboard.section.footer,
	}

	require("modules.utils").load_plugin("alpha", dashboard.opts)

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			dashboard.section.footer.val = footer()
			pcall(vim.cmd.AlphaRedraw)
		end,
	})
end
