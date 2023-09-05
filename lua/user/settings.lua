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
return settings
