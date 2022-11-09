local M = {}

function M.setup(opts)
	opts = vim.tbl_extend('keep', opts, { enable = 'all' })

	local maker = require('telescope-extension-maker')

	local enable = opts.enable
	if enable == 'all' then
		enable = {
			-- LuaFormatter off
			'changes', 'colors', 'env', 'message', 'packpath', 'query', 'rtp',
			'scriptnames', 'windows', 'time',
			-- LuaFormatter on
		}
	end

	for _, name in pairs(enable) do
		local ext = require('ad-telescope-extensions.exts.' .. name)(opts[name] or {})
		ext.name = name
		maker.register(ext)
	end
end

return M
