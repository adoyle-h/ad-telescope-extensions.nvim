return function(opts)
	opts = vim.tbl_extend('keep', opts, { prompt = ':' })

	return {
		desc = 'Input a vimscript and view the output',

		command = function()
			local input = vim.fn.input(opts.prompt)
			local output = vim.api.nvim_exec(input, true):gmatch('[^\r\n]+')
			return vim.split(output, '\n')
		end,
	}
end
