local definitions = {
	-- Example
	bufs = {
		{ "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
	},
	ft = {
		{
			"FileType",
			"c,cpp,cmake",
			"nnoremap <leader>bg :CMakeGenerate<CR>",
		},
		{
			"FileType",
			"c,cpp,cmake",
			"nnoremap <leader>bb :CMakeBuild<CR>",
		},
		{
			"FileType",
			"c,cpp,cmake",
			"nnoremap <leader>bc :CMakeClean<CR>",
		},
		{
			"FileType",
			"c,cpp,cmake",
			"nnoremap <leader>bq :CMakeQuickBuild<CR>",
		},
		{
			"FileType",
			"c,cpp,cmake",
			"nnoremap <leader>br :CMakeRun<CR>",
		},
		{
			"FileType",
			"c,cpp,cmake",
			"nnoremap <leader>bw :CMakeClose<CR>",
		},
	},
}

return definitions
