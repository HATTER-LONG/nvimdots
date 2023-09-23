local tool = {}

tool["brglng/vim-im-select"] = {
	opt = true,
	event = "BufReadPost",
	config = function()
		local global = require("core.global")
		if global.is_mac then
			vim.api.nvim_command([[let g:im_select_get_im_cmd = ["macism"] ]])
			vim.api.nvim_command([[let g:im_select_default = "com.apple.keylayout.ABC"]])
			vim.api.nvim_command([[let g:ImSelectSetImCmd = {key -> ['macism', key]}]])
			vim.api.nvim_command([[let g:im_select_enable_focus_events = 0]])
		elseif vim.fn.executable("fcitx5-remote") == 1 then
			-- fcitx5 need a manual config
			vim.api.nvim_cmd({
				[[ let g:im_select_get_im_cmd = ["fcitx5-remote"] ]],
				[[ let g:im_select_default = '1' ]],
				[[ let g:ImSelectSetImCmd = {
			\ key ->
			\ key == 1 ? ['fcitx5-remote', '-c'] :
			\ key == 2 ? ['fcitx5-remote', '-o'] :
			\ key == 0 ? ['fcitx5-remote', '-c'] :
			\ execute("throw 'invalid im key'")
			\ }
			]],
			}, { true, true, true })
		end
	end,
}

tool["Civitasv/cmake-tools.nvim"] = {
	lazy = true,
	config = require("user.configs.tool.cmake-tools"),
	ft = "cpp,c,cmake",
}

tool["postfen/clipboard-image.nvim"] = {
	lazy = true,
	ft = "markdown,txt",
	config = function()
		require("clipboard-image").setup({
			markdown = {
				img_dir = { "PIC" }, -- Use table for nested dir (New feature form PR #20)
				img_dir_txt = "./PIC",
				-- img_handler = function(img) -- New feature from PR #22
				-- 	local script = string.format('./image_compressor.sh "%s"', img.path)
				-- 	os.execute(script)
				-- end,
			},
		})
	end,
}

tool["richardbizik/nvim-toc"] = {
	lazy = true,
	ft = "markdown,txt",

	config = function()
		require("nvim-toc").setup({})
	end,
}

tool["hotoo/pangu.vim"] = {
	lazy = true,
	ft = "markdown,txt",
	config = function()
		-- require("pangu").setup({})
	end,
}

return tool
