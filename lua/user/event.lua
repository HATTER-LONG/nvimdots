local definitions = {
	-- Example
	bufs = {
		{ "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
	},
	ft = {
		{
			"FileType",
			"c,cpp,cmake",
			"nnoremap <leader>mg :CMakeGenerate<CR>",
		},
		{
			"FileType",
			"c,cpp,cmake",
			"nnoremap <leader>mb :CMakeBuild<CR>",
		},
		{
			"FileType",
			"c,cpp,cmake",
			"nnoremap <leader>mc :CMakeClean<CR>",
		},
		{
			"FileType",
			"c,cpp,cmake",
			"nnoremap <leader>mq :CMakeQuickBuild<CR>",
		},
		{
			"FileType",
			"c,cpp,cmake",
			"nnoremap <leader>mr :CMakeRun<CR>",
		},
		{
			"FileType",
			"c,cpp,cmake",
			"nnoremap <leader>mw :CMakeClose<CR>",
		},
	},
}

return definitions
