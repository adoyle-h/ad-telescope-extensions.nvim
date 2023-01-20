local consts = require('ad-telescope-extensions.const')

return function(opts)
	return {
		command = function()
			return opts.symbolKinds or consts.symbolKinds
		end,

		onSubmit = function(items)
			local symbols
			if vim.tbl_islist(items) then
				symbols = vim.tbl_map(function(item)
					return item.text
				end, items)
			else
				symbols = { items.text }
			end

			require('telescope.builtin').lsp_workspace_symbols { symbols = symbols }
		end,
	}
end
