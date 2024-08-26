local add = MiniDeps.add

add('L3MON4D3/LuaSnip')

local ls = require("luasnip")

ls.config.set_config {
	history = true,
	-- updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
}

-- Create s(trigger, nodes)
local s = ls.s

-- Format fmt(fmt_string, ...nodes)
local fmt = require('luasnip.extras.fmt').fmt

-- Insert i(position, default_text)
local i = ls.insert_node

ls.add_snippets("all", {
	s(
		"agpl", fmt([[
		// License: AGPL-3.0-only
		// (c) 2024 Dakota Walsh <kota@nilsu.org>
		]], {})
	),
})

ls.add_snippets("go", {
	s(
		"ir",
		fmt([[
		if err != nil {{
			return {}
		}}
		]], { i(1) })
	),
	s(
		"wr",
		fmt(
			[[{} http.ResponseWriter, {} *http.Request]],
			{ i(1, "w"), i(2, "r") }
		)
	),
	s(
		"tf",
		fmt([[
		func Test{}(t *testing.T) {{
			type test struct {{
				{}
			}}

			tests := []test{{
				{}
			}}

			for _, tc := range tests {{
				{}
			}}
		}}
		]], { i(1), i(2), i(3), i(4) })
	),
	s(
		"fp",
		fmt([[fmt.Println({})]], { i(1) })
	),
	s(
		"ff",
		fmt([[fmt.Printf({})]], { i(1) })
	),
	s(
		"fv",
		fmt([[fmt.Printf("%+v\n", {})]], { i(1) })
	),
	s(
		"lp",
		fmt([[log.Println({})]], { i(1) })
	),
	s(
		"lf",
		fmt([[log.Printf({})]], { i(1) })
	),
	s(
		"lv",
		fmt([[log.Printf("%+v\n", {})]], { i(1) })
	),
	s(
		"tp",
		fmt([[t.Log({})]], { i(1) })
	),
	s(
		"tf",
		fmt([[t.Logf({})]], { i(1) })
	),
	s(
		"tv",
		fmt([[log.Printf("%+v\n", {})]], { i(1) })
	),
})

