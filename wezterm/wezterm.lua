local wezterm = require("wezterm")
local act = wezterm.action
return {
	-- appearance
	-- font = wezterm.font("Victor Mono", { weight = "Medium" }),
	font = wezterm.font("JetBrains Mono"),
	font_size = 14.5,
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "Catppuccin Macchiato",

	-- no scrollbar
	enable_scroll_bar = false,
	scrollback_lines = 0,

	-- custom selection (helps with selection when running tmux splits)
	selection_word_boundary = " \t\n{[}]()\"'|│",

	-- no padding
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- key bindings
	disable_default_key_bindings = true,
	keys = {
		{ mods = "CMD", key = "f", action = act.Search({ CaseSensitiveString = "" }) },
		{ mods = "CMD", key = "v", action = act.PasteFrom("Clipboard") },
		{ mods = "CMD", key = "c", action = act.CopyTo("Clipboard") },
		{ mods = "CMD", key = "=", action = act.IncreaseFontSize },
		{ mods = "CMD", key = "-", action = act.DecreaseFontSize },
		{ mods = "CMD", key = "0", action = act.ResetFontSize },
		{ mods = "CMD", key = "n", action = act.SpawnWindow },
	},
}
