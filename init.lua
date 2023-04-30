-- 导出所有 keymap
-- :redir! > vim_keys.txt
-- :silent verbose map
-- :redir END
if not vim.g.vscode then
	require("core")
else
	require("core")
end
