-- install other plugins : https://github.com/williamboman/mason-lspconfig.nvim/tree/main/lua/mason-lspconfig/server_configurations/pylsp

local function getenv()
	local pyenv_prefix = os.getenv("PYENV_VIRTUAL_ENV")
	local path = "python3"
	local function isempty(s)
		return s == nil or s == ""
	end
	if not isempty(pyenv_prefix) then
		path = pyenv_prefix .. "/bin/"
	end
	return path
end
return function(options)
	require("lspconfig").pylsp.setup({
		on_attach = function(client)
			options.on_attach(client)
			client.server_capabilities.documentFormattingProvider = false
		end,
		capabilities = options.capabilities,
		cmd = { "pylsp", "-v" },
		cmd_env = {
			-- VIRTUAL_ENV = getenv(),
			-- PATH = getenv() .. ":" .. vim.env.PATH,
		},
		settings = {
			pylsp = {
				-- pip install python-lsp-black pyls-flake8 pyls-mypy pylsp-rope pyls-isort
				configurationSources = { "flake8", "pylsp_mypy" },
				plugins = {
					-- https://github.com/emanspeaks/pyls-flake8/
					-- load setup.cfg, tox.ini, .flake8
					pycodestyle = { enabled = true, maxLineLength = 128 },
					pydocstyle = { enabled = true },
					mccabe = { enabled = true },
					pyflakes = { enabled = true },
					pylsp_mypy = { enabled = false, report_progress = true },
					flake8 = {
						enabled = false,
						maxLineLength = 128, --[[ ignore = {} ]]
					},
					pylint = { enabled = true, executable = getenv() .. "pylint" },
					black = { enabled = false, fast = true },
					yapf = { enabled = false },
					autopep8 = { enabled = false },
				},
			},
		},
	})
end
