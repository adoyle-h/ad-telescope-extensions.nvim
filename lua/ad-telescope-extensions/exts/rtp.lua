return function(opts)
	return {
		desc = 'List rtp.',
		command = function()
			return vim.split(vim.o.rtp, ',')
		end,
	}
end
