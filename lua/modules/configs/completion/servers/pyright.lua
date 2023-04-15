return function(options)
	require("lspconfig").pyright.setup({
		capabilities = options.capabilities,
		on_attach = options.on_attach,
		before_init = function(_, config)
			local p
			if vim.env.VIRTUAL_ENV then
				p = require("null-ls.utils").path.join(vim.env.VIRTUAL_ENV, "bin", "python3")
			else
				p = "python3"
			end
			config.settings.python.pythonPath = p
		end,
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					useLibraryCodeForTypes = true,
					disableOrganizeImports = true,
				},
			},
		},
	})
end
