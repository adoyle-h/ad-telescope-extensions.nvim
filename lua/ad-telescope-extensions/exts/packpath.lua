return function(opts)
	return {
		desc = 'List packpath',
		command = function()
			return vim.split(vim.o.packpath, ',')
		end,
	}
end
