return function(opts)
	return {
		desc = 'List scriptnames.',
		command = function()
			local output = vim.api.nvim_exec('scriptnames', true)
			return vim.split(output, '\n')
		end,
	}
end
