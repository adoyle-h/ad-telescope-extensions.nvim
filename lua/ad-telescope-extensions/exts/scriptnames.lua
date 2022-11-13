return function(opts)
	return {
		desc = 'List scriptnames.',

		picker = { previewer = 'cat' },

		command = function()
			local output = vim.api.nvim_exec('scriptnames', true)
			return vim.tbl_map(function(text)
				local _, _, path = string.find(text, '^%s*%d+: (.+)')
				return { text = text, entry = { path = path } }
			end, vim.split(output, '\n'))
		end,
	}
end
