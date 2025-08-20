local telescope = require("telescope")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

-- Common picker function for MR (mr.vim) integration
local function create_mr_picker(opts, title, list_function)
	pickers
		.new(opts, {
			prompt_title = title,
			finder = finders.new_table({
				results = list_function(),
			}),
			sorter = conf.generic_sorter(opts),
			previewer = conf.file_previewer(opts),
		})
		:find()
end

return telescope.register_extension({
	exports = {
		mru = function(opts)
			create_mr_picker(opts, "MRU", vim.fn["mr#mru#list"])
		end,
		mrr = function(opts)
			create_mr_picker(opts, "MRR", vim.fn["mr#mrr#list"])
		end,
		mrw = function(opts)
			create_mr_picker(opts, "MRW", vim.fn["mr#mrw#list"])
		end,
		mrd = function(opts)
			create_mr_picker(opts, "MRD", vim.fn["mr#mrd#list"])
		end,
	},
})
