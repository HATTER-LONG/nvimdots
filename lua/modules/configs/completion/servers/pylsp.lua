-- install other plugins : https://github.com/williamboman/mason-lspconfig.nvim/tree/main/lua/mason-lspconfig/server_configurations/pylsp
return function(options)
	require("lspconfig").pylsp.setup({
		settings = {
			pylsp = {
				configurationSources = { "flake8", "mypy", "isort", "black" },
				plugins = {
					-- https://github.com/emanspeaks/pyls-flake8/
					-- load setup.cfg, tox.ini, .flake8
					pyflakes = { enabled = false },
					flake8 = { enabled = false },
					pylint = { enabled = false },
					pycodestyle = { enabled = false },
					yapf = { enabled = false },
					-- black enabled if python-lsp-black installed
				},
			},
		},
	})
end
