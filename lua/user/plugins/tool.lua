local tool = {}

tool["keaising/im-select.nvim"] = {
	opt = true,
	event = "BufReadPost",
	config = function()
		local global = require("core.global")
		if global.is_mac then
			require("im_select").setup({
				-- IM will be set to `default_im_select` in `normal` mode
				-- For Windows/WSL, default: "1033", aka: English US Keyboard
				-- For macOS, default: "com.apple.keylayout.ABC", aka: US
				-- For Linux, default:
				--               "keyboard-us" for Fcitx5
				--               "1" for Fcitx
				--               "xkb:us::eng" for ibus
				-- You can use `im-select` or `fcitx5-remote -n` to get the IM's name
				default_im_select = "com.apple.keylayout.ABC",

				-- Can be binary's name or binary's full path,
				-- e.g. 'im-select' or '/usr/local/bin/im-select'
				-- For Windows/WSL, default: "im-select.exe"
				-- For macOS, default: "im-select"
				-- For Linux, default: "fcitx5-remote" or "fcitx-remote" or "ibus"
				default_command = "macism",

				-- Restore the default input method state when the following events are triggered
				set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },

				-- Restore the previous used input method state when the following events
				-- are triggered, if you don't want to restore previous used im in Insert mode,
				-- e.g. deprecated `disable_auto_restore = 1`, just let it empty
				-- as `set_previous_events = {}`
				set_previous_events = { "InsertEnter" },

				-- Show notification about how to install executable binary when binary missed
				keep_quiet_on_no_binary = false,

				-- Async run `default_command` to switch IM or not
				async_switch_im = true,
			})
		elseif vim.fn.executable("fcitx5-remote") == 1 then
			require("im_select").setup({
				-- IM will be set to `default_im_select` in `normal` mode
				-- For Windows/WSL, default: "1033", aka: English US Keyboard
				-- For macOS, default: "com.apple.keylayout.ABC", aka: US
				-- For Linux, default:
				--               "keyboard-us" for Fcitx5
				--               "1" for Fcitx
				--               "xkb:us::eng" for ibus
				-- You can use `im-select` or `fcitx5-remote -n` to get the IM's name
				default_im_select = "com.apple.keylayout.ABC",

				-- Can be binary's name or binary's full path,
				-- e.g. 'im-select' or '/usr/local/bin/im-select'
				-- For Windows/WSL, default: "im-select.exe"
				-- For macOS, default: "im-select"
				-- For Linux, default: "fcitx5-remote" or "fcitx-remote" or "ibus"
				default_command = "fcitx5-remote",

				-- Restore the default input method state when the following events are triggered
				set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },

				-- Restore the previous used input method state when the following events
				-- are triggered, if you don't want to restore previous used im in Insert mode,
				-- e.g. deprecated `disable_auto_restore = 1`, just let it empty
				-- as `set_previous_events = {}`
				set_previous_events = { "InsertEnter" },

				-- Show notification about how to install executable binary when binary missed
				keep_quiet_on_no_binary = false,

				-- Async run `default_command` to switch IM or not
				async_switch_im = true,
			})
		end
	end,
}
tool["Civitasv/cmake-tools.nvim"] = {
	lazy = true,
	config = require("user.configs.tool.cmake-tools"),
	ft = "cpp,c,cmake",
}

tool["folke/noice.nvim"] = {
	-- lazy = true,
	config = require("user.configs.tool.noice"),
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}

local use_copilot = require("core.settings").use_copilot
if use_copilot then
	tool["CopilotC-Nvim/CopilotChat.nvim"] = {
		event = "BufReadPost",
		lazy = true,
		version = "v2.1.1",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		keys = function()
			local select = require("CopilotChat.select")
			local telescope = require("CopilotChat.integrations.telescope")
			local actions = require("CopilotChat.actions")

			return {
				{
					"<leader>ccq",
					function()
						local input = vim.fn.input("Quick Chat: ")
						if input ~= "" then
							require("CopilotChat").ask(input, { selection = select.buffer })
						end
					end,
					desc = "CopilotChat - Quick chat",
				},
				{
					"<leader>ccq",
					function()
						local input = vim.fn.input("Quick Chat: ")
						if input ~= "" then
							require("CopilotChat").ask(input, { selection = select.visual })
						end
					end,
					desc = "CopilotChat - Quick chat",
					mode = "v",
				},
				{
					"<leader>cch",
					function()
						telescope.pick(actions.help_actions(), { selection = select.buffer })
					end,
					desc = "CopilotChat - Help actions",
				},
				{
					"<leader>cch",
					function()
						telescope.pick(actions.help_actions(), { selection = select.visual })
					end,
					desc = "CopilotChat - Help actions",
					mode = "v",
				},
				{
					"<leader>ccp",
					function()
						telescope.pick(actions.prompt_actions(), { selection = select.visual })
					end,
					desc = "CopilotChat - Prompt actions",
				},
				{
					"<leader>ccp",
					function()
						telescope.pick(actions.prompt_actions(), { selection = select.visual })
					end,
					desc = "CopilotChat - Prompt actions",
					mode = "v",
				},
			}
		end,
		config = function()
			require("CopilotChat").setup({
				debug = false, -- Enable debugging
				separator = "🤖🚀🤖🚀🤖🚀🤖🚀🤖🚀🤖",
				context = "buffers",
				-- See Configuration section for rest
				-- default prompts
				prompts = {
					ExplainCN = {
						prompt = "/COPILOT_EXPLAIN Write an explanation for the code above as paragraphs of text answer with chinese.",
					},
				},
			})
		end,
		opts = {
			debug = false, -- Enable debugging
			-- See Configuration section for rest
		},
	}
else
	tool["jackMort/ChatGPT.nvim"] = {
		event = "BufReadPost",
		lazy = true,
		config = function()
			require("chatgpt").setup({
				api_host_cmd = "echo http://localhost:1234",
				api_key_cmd = "echo 'lm-studio'",
				openai_params = {
					model = "Qwen/Qwen1.5-14B-Chat-GGUF/qwen1_5-14b-chat-q5_k_m.gguf",
					frequency_penalty = 0,
					presence_penalty = 0,
					max_tokens = 4096,
					temperature = 0.1,
					top_p = 1,
					n = 1,
					-- stream = true,
				},
				openai_edit_params = {
					model = "Qwen/Qwen1.5-14B-Chat-GGUF/qwen1_5-14b-chat-q5_k_m.gguf",
					frequency_penalty = 0,
					presence_penalty = 0,
					max_tokens = 4096,
					temperature = 0.1,
					top_p = 1,
					n = 1,
					-- stream = true,
				},
				edit_with_instructions = {
					diff = false,
					keymaps = {
						close = "<C-q>",
						accept = "<C-y>",
						toggle_diff = "<C-d>",
						toggle_settings = "<C-o>",
						toggle_help = "<C-h>",
						cycle_windows = "<Tab>",
						use_output_as_input = "<C-i>",
					},
				},
				chat = {
					keymaps = {
						close = "<C-q>",
					},
				},

				actions_paths = { "~/.config/nvim/actions.json" },
			})
		end,
		keys = function()
			return {
				{
					"<leader>ccq",
					"<Cmd>ChatGPT<CR>",
					desc = "LocalChat - Quick chat",
				},
				{
					"<leader>ccq",
					"<Cmd>ChatGPTEditWithInstructions<CR>",
					desc = "LocalChat - Quick chat",
					mode = "v",
				},
				{
					"<leader>cct",
					"<Cmd>ChatGPTRun translateCN<CR>",
					desc = "LocalChat - Translate to CN",
					mode = "v",
				},
			}
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	}

	tool["HATTER-LONG/llm.nvim"] = {
		event = "BufReadPost",
		lazy = true,
		config = function()
			local llm = require("llm")
			llm.setup({
				api_token = nil, -- cf Install paragraph
				model = "second-state/StarCoder2-7B-GGUF/starcoder2-7b-Q5_K_M.gguf", -- the model ID, behavior depends on backend
				backend = "openai", -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
				url = "http://localhost:1234/v1/completions", -- the http url of the backend
				tokens_to_clear = { "<|endoftext|>" }, -- tokens to remove from the model's output
				-- parameters that are added to the request body, values are arbitrary, you can set any field:value pair here it will be passed as is to the backend
				request_body = {
					-- parameters = {
					-- 	max_new_tokens = 60,
					-- 	temperature = 0.05,
					-- 	top_p = 0.95,
					-- },
					stop = {
						"<file_sep>",
						"<fim_prefix>",
						"<fim_suffix>",
						"<fim_middle>",
						"<|endoftext|>",
						"\n\n",
						"/src/",
						"t.",
						"#- coding: utf-8",
						"```",
						"def",
						"class",
					},
				},
				-- set this if the model supports fill in the middle
				fim = {
					enabled = true,
					prefix = "<fim_prefix>",
					middle = "<fim_middle>",
					suffix = "<fim_suffix>",
				},
				tokenizer = {
					repository = "bigcode/starcoder",
				},
				debounce_ms = 150,
				accept_keymap = "<C-l>",
				dismiss_keymap = "<C-\\>",
				tls_skip_verify_insecure = false,
				-- llm-ls configuration, cf llm-ls section
				lsp = {
					bin_path = nil,
					host = nil,
					port = nil,
					version = "0.5.2",
				},
				context_window = 8192, -- max number of tokens for the context window
				enable_suggestions_on_startup = false,
				enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
				stream = true,
			})
		end,
	}
	-- tool["TabbyML/vim-tabby"] = {
	-- 	lazy = false,
	-- 	config = function()
	-- 		vim.g.tabby_keybinding_accept = "<C-l>"
	-- 	end,
	-- }
end
-- tool["postfen/clipboard-image.nvim"] = {
-- 	lazy = true,
-- 	ft = "markdown,txt",
-- 	config = function()
-- 		require("clipboard-image").setup({
-- 			markdown = {
-- 				img_dir = { "PIC" }, -- Use table for nested dir (New feature form PR #20)
-- 				img_dir_txt = "./PIC",
-- 				-- img_handler = function(img) -- New feature from PR #22
-- 				-- 	local script = string.format('./image_compressor.sh "%s"', img.path)
-- 				-- 	os.execute(script)
-- 				-- end,
-- 			},
-- 		})
-- 	end,
-- }

-- tool["richardbizik/nvim-toc"] = {
-- 	lazy = true,
-- 	ft = "markdown,txt",

-- 	config = function()
-- 		require("nvim-toc").setup({})
-- 	end,
-- }

-- tool["hotoo/pangu.vim"] = {
-- 	lazy = true,
-- 	ft = "markdown,txt",
-- 	config = function()
-- 		-- require("pangu").setup({})
-- 	end,
-- }

return tool
