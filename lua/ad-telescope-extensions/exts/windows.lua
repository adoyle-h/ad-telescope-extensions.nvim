return function(opts)
	opts = vim.tbl_deep_extend('keep', opts, {
		winPrefix = { middle = ' ├─ ', last = ' └─ ' },
		excludeFileTypes = {},
		tab = function(props)
			return 'Tab ' .. props.tab
		end,
	})

	local middlePrefix = opts.winPrefix.middle
	local lastPrefix = opts.winPrefix.last
	local getBuf = vim.api.nvim_win_get_buf
	local getBufName = vim.api.nvim_buf_get_name
	local getBufOpt = vim.api.nvim_buf_get_option
	local getWins = vim.api.nvim_tabpage_list_wins
	local modifyFilepath = vim.fn.fnamemodify

	return {
		desc = 'Show tabpages and windows. Press `<CR>` to goto the tabpage or window you choosed.',

		picker = { previewer = 'cat' },

		command = function()
			local tabs = vim.api.nvim_list_tabpages()
			local items = {}

			for _, tab in pairs(tabs) do
				local wins = {}
				local winItems = {}

				for _, win in pairs(getWins(tab)) do
					local buf = getBuf(win)
					local filepath = getBufName(buf)
					filepath = modifyFilepath(filepath, ':.')

					local ft = getBufOpt(buf, 'ft')
					if vim.tbl_contains(opts.excludeFileTypes, ft) then goto continue end

					wins[#wins + 1] = win

					winItems[#winItems + 1] = {
						text = middlePrefix .. filepath,
						buf = buf,
						tab = tab,
						win = win,
						entry = { path = filepath },
					}

					::continue::
				end

				local lastWinItem = winItems[#winItems]
				lastWinItem.text = lastPrefix .. lastWinItem.entry.path

				items[#items + 1] = {
					text = opts.tab({ tab = tab, wins = wins, tabs = tabs }),
					tab = tab,
					entry = { path = '' },
				}
				for _, item in pairs(winItems) do items[#items + 1] = item end
			end

			return items
		end,

		onSubmit = function(item)
			if item.win then
				vim.fn.win_gotoid(item.win)
			elseif item.tab then
				vim.cmd.tabn(item.tab)
			else
				error('Invalid selection')
			end
		end,
	}
end
