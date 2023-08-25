local map_cr = require("keymap.bind").map_cr
return {
	["n|[b"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent():with_desc("buffer: Switch to next"),
	["n|]b"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent():with_desc("buffer: Switch to prev"),
}
