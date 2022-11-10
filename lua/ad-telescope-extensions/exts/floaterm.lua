local fn = vim.fn

return function(opts)
	opts = vim.tbl_deep_extend('keep', opts, {
		onSubmit = function(item)
			local buf = item.buf
			if fn.bufwinid(buf) == -1 then
				fn['floaterm#terminal#open_existing'](buf)
			else
				fn['floaterm#window#hide'](buf)
			end
		end,
	})

	return {
		desc = [[
			List [floaterm](https://github.com/voldikss/vim-floaterm). Press `<CR>` to toggle terminal window.
			Item Format: `[<bufnr>:<floaterm-name>]: <buf-name>`
		]],

		command = function()
			local bufs = fn['floaterm#buflist#gather']()

			return vim.tbl_map(function(buf)
				local termName = fn['floaterm#config#get'](buf, 'name', '')
				local bufName = vim.api.nvim_buf_get_name(buf)
				local text
				if #termName > 0 then
					text = string.format('[%s:%s] %s', buf, termName, bufName)
				else
					text = string.format('[%s] %s', buf, bufName)
				end
				return { text = text, buf = buf, termName = termName }
			end, bufs)
		end,

		onSubmit = opts.onSubmit,
	}
end
