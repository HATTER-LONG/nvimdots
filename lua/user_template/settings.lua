-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = false

settings["colorscheme"] = "catppuccin"

settings["format_disabled_dirs"] = {
	"~/format_disabled_dir",
	"/opt",
	"/etc",
	"/usr",
	"/proc",
	"~/workspace/arm",
	"~/workspace/stm32dev/STM32CubeF4",
}

settings["lsp_deps"] = function()
	return {
		"bashls",
		"clangd",
		"jsonls",
		"lua_ls",
		"pylsp",
	}
end
settings["null_ls_deps"] = function()
	return {
		"clang_format",
		"prettier",
		"shfmt",
		"stylua",
		"vint",
	}
end
settings["dap_deps"] = function()
	return {
		"codelldb", -- C-Family
		"python", -- Python (debugpy)
	}
end

settings["disabled_plugins"] = {
	"fatih/vim-go",
	"simrat39/rust-tools.nvim",
	"edluffy/specs.nvim",
	"karb94/neoscroll.nvim",
}

-- Set the options specific to `neovide` here.
-- NOTE: You should remove the `neovide_` prefix (with trailing underscore) from all your entries below.
-- Check the below link for all supported entries:
-- https://neovide.dev/configuration.html
---@type table<string, boolean|number|string>
settings["neovide_config"] = {
	no_idle = true,
	refresh_rate = 120,
	cursor_vfx_mode = "railgun",
	cursor_vfx_opacity = 200.0,
	cursor_antialiasing = true,
	cursor_trail_length = 0.05,
	cursor_animation_length = 0.03,
	cursor_vfx_particle_speed = 20.0,
	cursor_vfx_particle_density = 5.0,
	cursor_vfx_particle_lifetime = 1.2,
}
return settings
