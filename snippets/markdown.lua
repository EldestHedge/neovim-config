local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function current_date()
	return os.date("%b %d, %Y")
end

return {
	s("frontmatter", {
		t({"---", "title: "}),
		i(1, "Title"),
		t({"", "tags: "}),
		i(2, "Tags"),
		t({"", "date: "}),
		i(3, current_date()),
		t({"", "---", ""}),
		t({"# "}),
		i(0, "Title"),
	})
}
