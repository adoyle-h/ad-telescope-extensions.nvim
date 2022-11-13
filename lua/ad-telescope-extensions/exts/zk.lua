return function(opts)
	opts = vim.tbl_deep_extend('keep', opts, {
		select = { 'title', 'path', 'absPath' },
		format = function(note)
			return string.format('[%s] %s', note.title, note.path)
		end,
	})

	return {
		desc = 'List zk notes. Depends on [zk-nvim](https://github.com/mickael-menu/zk-nvim)',

		picker = { previewer = 'cat' },

		command = function(callback)
			local zkUtil = require('zk.util')
			local notebookPath = zkUtil.resolve_notebook_path(0)
			local format = opts.format

			require('zk.api').list(notebookPath, { --
				select = opts.select,
			}, function(err, notes)
				if err then return callback(err) end

				local items = vim.tbl_map(function(note)
					return { text = format(note), entry = { path = note.absPath } }
				end, notes)

				callback(nil, items)
			end)
		end,
	}
end
