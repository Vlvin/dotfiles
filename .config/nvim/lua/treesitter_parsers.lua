local M = {}

---@class Language_parser
---@field name string
---@field opts table

---@type Language_parser[]
M.languages = {
	-- {
	-- 	"python",
	-- 	{
	--      'py',
	-- 		path = "/usr/lib/tree-sitter/python.so",
	-- 	},
	-- },
}

function M.register()
	for _, lang in pairs(M.languages) do
		vim.treesitter.language.add(lang[1], lang[2])
	end
end

return M
