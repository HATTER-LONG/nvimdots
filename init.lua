-- 导出所有 keymap
-- :redir! > vim_keys.txt
-- :silent verbose map
-- :redir END

if not vim.g.vscode then
	require("core")
end

-- vim.defer_fn(function()
-- 	local stats = vim.api.nvim_list_uis()[1]
-- 	local width = stats.width
-- 	local height = stats.height
-- 	local winWidth = math.ceil(width * 0.8)
-- 	local winHeight = math.ceil(height * 0.8)

-- 	local buf = vim.api.nvim_create_buf(false, true)
-- 	local winConfig = {
-- 		relative = "editor",
-- 		width = winWidth,
-- 		height = winHeight,
-- 		col = math.ceil((width - winWidth) / 2),
-- 		row = math.ceil((height - winHeight) / 2) - 1,
-- 		border = "rounded",
-- 	}
-- 	local winid = vim.api.nvim_open_win(buf, true, winConfig)
-- 	print("keymap setting")
-- 	vim.keymap.set("n", "<C-c>q", function()
-- 		vim.api.nvim_win_close(winid, true)
-- 	end, { buffer = buf, nowait = true })
-- 	print("keymap setting")
-- end, 1000)
