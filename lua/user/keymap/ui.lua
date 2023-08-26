local map_cr = require("keymap.bind").map_cr
return {
	["n|<A-j>"] = false,
	["n|<A-k>"] = false,
	["n|<A-S-j>"] = false,
	["n|<A-S-k>"] = false,
	["n|<A-1>"] = false,
	["n|<A-2>"] = false,
	["n|<A-3>"] = false,
	["n|<A-4>"] = false,
	["n|<A-5>"] = false,
	["n|<A-6>"] = false,
	["n|<A-7>"] = false,
	["n|<A-8>"] = false,
	["n|<A-9>"] = false,
	["n|[b"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent():with_desc("buffer: Switch to next"),
	["n|]b"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent():with_desc("buffer: Switch to prev"),
	["n|<leader>bb"] = map_cr("BufferLinePick"):with_noremap():with_silent():with_desc("buffer: Select a buffer"),
	["n|<leader>bd"] = map_cr("BufferLinePickClose")
		:with_noremap()
		:with_silent()
		:with_desc("buffer: Close select a buffer"),
	["n|<leader>bo"] = map_cr("BufferLineCloseOthers")
		:with_noremap()
		:with_silent()
		:with_desc("buffer: Close other buffer"),
	["n|<leader>bl"] = map_cr("BufferLineCloseLeft")
		:with_noremap()
		:with_silent()
		:with_desc("buffer: Close left buffer"),
	["n|<leader>br"] = map_cr("BufferLineCloseRight")
		:with_noremap()
		:with_silent()
		:with_desc("buffer: Close right buffer"),
}
