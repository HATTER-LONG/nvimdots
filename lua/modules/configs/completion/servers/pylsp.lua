return function(options)
	require("lspconfig").pylsp.setup({
		settings = {
			pylsp = {
				plugins = {
					configurationSources = { "flake8", "mypy", "pycodestyle" },
					mypy = { enabled = false },
					pyflakes = { enabled = true },
					pycodestyle = {
						ignore = { "W391" },
						maxLineLength = 100,
					},
				},
			},
		},
	})
end
