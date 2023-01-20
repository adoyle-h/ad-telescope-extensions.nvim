local M = {}

function M.setup(opts)
	opts = vim.tbl_extend('keep', opts, { enable = 'all' })

	local maker = require('telescope-extension-maker')

	local enable = opts.enable
	if enable == 'all' then
		enable = {
			-- LuaFormatter off
			'changes', 'colors', 'env', 'floaterm', 'message', 'packpath', 'query', 'rtp',
			'scriptnames', 'windows', 'time', 'zk',
			'lsp_document_symbols_filter', 'lsp_workspace_symbols_filter', 'lsp_dynamic_workspace_symbols_filter',
			-- LuaFormatter on
		}
	end

	for _, name in pairs(enable) do
		local extProps = opts[name] or {}
		local ext = require('ad-telescope-extensions.exts.' .. name)(extProps.opts or {})
		ext.name = extProps.alias or name
		maker.register(ext)
	end
end

return M
