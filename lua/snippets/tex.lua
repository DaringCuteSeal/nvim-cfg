local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- enumerate
	s("en", {
		t({ "\\begin{enumerate}", "\t\\item " }),
		i(1),
		t({ "", "\\end{enumerate}" }),
	}),

	-- itemize
	s("ul", {
		t({ "\\begin{itemize}", "\t\\item " }),
		i(1),
		t({ "", "\\end{itemize}" }),
	}),

	-- quick item
	s("-", {
		t("\\item "),
	}),
}
