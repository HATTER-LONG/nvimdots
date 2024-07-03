local icons = {}

local data = {
	kind = {
		Break = "󰙧",
		Call = "󰃷",
		Case = "󰬶",
		Class = "󰠱",
		Color = "󰏘",
		Constant = "󰏿",
		Constructor = "",
		Continue = "󰞘",
		Declaration = "󰙠",
		Delete = "󱟁",
		Enum = "",
		EnumMember = "",
		Event = "",
		Field = "󰇽",
		File = "󰈙",
		Folder = "󰉋",
		Fragment = "",
		Function = "󰊕",
		Implementation = "",
		Interface = "",
		Keyword = "󰌋",
		List = "󰅪",
		Loop = "󰑖",
		Method = "󰆧",
		Module = "",
		Namespace = "󰌗",
		Operator = "󰆕",
		Package = "",
		Property = "󰜢",
		Reference = "",
		Regex = "",
		Snippet = "",
		Statement = "󰅩",
		Struct = "",
		Switch = "",
		Text = "󰉿",
		TypeParameter = "󰅲",
		Undefined = "",
		Unit = "",
		Value = "󰎠",
		Variable = "",
		-- ccls-specific icons
		Macro = "",
		Parameter = "",
		StaticMethod = "",
		Terminal = "",
		TypeAlias = "",
	},
	type = {
		Array = "󰅪",
		Boolean = "",
		Null = "󰟢",
		Number = "",
		Object = "󰅩",
		String = "󰉿",
	},
	documents = {
		Default = "",
		File = "",
		Files = "",
		FileFind = "󰈞",
		FileTree = "󰙅",
		Import = "",
		Symlink = "",
		Word = "",
	},
	git = {
		Add = "",
		Branch = "",
		Diff = "",
		Git = "󰊢",
		Ignore = "",
		Mod = "M",
		Mod_alt = "",
		Remove = "",
		Rename = "",
		Repo = "",
		Unmerged = "󰘬",
		Untracked = "󰞋",
		Unstaged = "",
		Staged = "",
		Conflict = "",
	},
	ui = {
		Accepted = "",
		ArrowClosed = ">",
		ArrowOpen = "",
		BigCircle = "",
		BigUnfilledCircle = "",
		BookMark = "󰃃",
		Buffer = "󰓩",
		Bug = "",
		Calendar = "",
		Character = "",
		Check = "󰄳",
		ChevronRight = "",
		Circle = "",
		Close = "󰅖",
		Close_alt = "",
		CloudDownload = "",
		CodeAction = "󰌵",
		Comment = "󰅺",
		Dashboard = "",
		DoubleSeparator = "󰄾",
		Emoji = "󰱫",
		EmptyFolder = "",
		EmptyFolderOpen = "",
		File = "󰈤",
		Fire = "",
		Folder = "",
		FolderOpen = "",
		FolderWithHeart = "󱃪",
		Gear = "",
		History = "󰄉",
		Incoming = "󰏷",
		Indicator = "",
		Keyboard = "",
		Left = "",
		List = "",
		Lock = "󰍁",
		Modified = "✥",
		Modified_alt = "",
		NewFile = "",
		Newspaper = "",
		Note = "󰍨",
		Outgoing = "󰏻",
		Package = "",
		Pencil = "󰏫",
		Perf = "󰅒",
		Play = "",
		Project = "",
		Right = "",
		RootFolderOpened = "",
		Search = "󰍉",
		Separator = "",
		SignIn = "",
		SignOut = "",
		Sort = "",
		Spell = "󰓆",
		Square = "",
		Symlink = "",
		SymlinkFolder = "",
		Tab = "",
		Table = "",
		Telescope = "",
		Window = "",
	},
	diagnostics = {
		Error = "",
		Warning = "",
		Information = "",
		Question = "",
		Hint = "󰌵",
		-- Hollow version
		Error_alt = "󰅚",
		Warning_alt = "󰀪",
		Information_alt = "",
		Question_alt = "",
		Hint_alt = "󰌶",
	},
	misc = {
		Add = "+",
		Added = "",
		Campass = "󰀹",
		Code = "",
		Gavel = "",
		Ghost = "󰊠",
		Glass = "󰂖",
		Lego = "",
		LspAvailable = "󱜙",
		ManUp = "",
		Neovim = "",
		NoActiveLsp = "󱚧",
		PyEnv = "󰢩",
		Squirrel = "",
		Tag = "",
		Tree = "",
		Vbar = "│",
		Vim = "",
		Watch = "",
	},
	cmp = {
		buffer = "󰉿",
		latex_symbols = "",
		luasnip = "󰃐",
		nvim_lsp = "",
		nvim_lua = "",
		orgmode = "",
		path = "",
		spell = "󰓆",
		tmux = "",
		treesitter = "",
		undefined = "",
		-- Add source-specific icons here
		codeium = "",
		Codeium = "",
		copilot = "",
		copilot_alt = "",
		Copilot = "",
		Copilot_alt = "",
		TabNine = "",
		cmp_tabnine = "",
	},
	dap = {
		Breakpoint = "󰝥",
		BreakpointCondition = "󰟃",
		BreakpointRejected = "",
		LogPoint = "",
		Pause = "",
		Play = "",
		RunLast = "↻",
		StepBack = "",
		StepInto = "󰆹",
		StepOut = "󰆸",
		StepOver = "󰆷",
		Stopped = "",
		Terminate = "󰝤",
	},
}

---Get a specific icon set.
---@param category "kind"|"type"|"documents"|"git"|"ui"|"diagnostics"|"misc"|"cmp"|"dap"
---@param add_space? boolean @Add trailing whitespace after the icon.
function icons.get(category, add_space)
	if add_space then
		return setmetatable({}, {
			__index = function(_, key)
				return data[category][key] .. " "
			end,
		})
	else
		return data[category]
	end
end

return icons
