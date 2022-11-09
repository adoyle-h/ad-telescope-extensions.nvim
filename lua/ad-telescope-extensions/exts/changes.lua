return function(opts)
	return {
		desc = [[
			Print the change list.  A ">" character indicates the current position.
			Press `<CR>` to move to this line.
		]],

		command = function()
			local items = {}
			for change in vim.api.nvim_exec('changes', true):gmatch('[^\r\n]+') do
				items[#items + 1] = change
			end
			return items
		end,

		onSubmit = function(item)
			local _, _, str = string.find(item.text, '^%s+%d+%s+(%d+)')
			vim.api.nvim_win_set_cursor(0, { tonumber(str), 0 })
		end,
	}
end
