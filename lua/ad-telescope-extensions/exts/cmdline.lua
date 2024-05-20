return function(opts)
	return {
		desc = 'List commands and builtin ex-commands',

		commandReturnEntryNotItem = true,

		command = function()
			local make_entry = require 'telescope.make_entry'
			local make_entry_func = make_entry.gen_from_commands {}

			local entries = {}

			-- Commands that excluded builtin commands
			local command_iter = vim.api.nvim_get_commands {}
			for _, cmd in pairs(command_iter) do
				table.insert(entries, make_entry_func(cmd))
			end

			-- All commands
			local all_cmds = vim.fn.getcompletion('', 'command')
			for _, cmd in pairs(all_cmds) do
				-- Only filter ex commands whose name is in lower case
				if cmd:sub(1, 1):match('[a-z]') then
					table.insert(entries, make_entry_func({ name = cmd, definition = '', bang = false, nargs = '*' }))
				end
			end

			-- Commands defined in buffer
			local buf_command_iter = vim.api.nvim_buf_get_commands(0, {})
			buf_command_iter[true] = nil -- remove the redundant entry
			for _, cmd in pairs(buf_command_iter) do
				table.insert(entries, make_entry_func(cmd))
			end

			return entries
		end,

		remap = function(map, ctx, prompt_bufnr)
			ctx.actions.select_default:replace(function()
				ctx.actions.close(prompt_bufnr)

				local selection = ctx.action_state.get_selected_entry()
				if selection == nil then
					vim.notify('ad-telescope-extensions.cmdline: Nothing currently selected', vim.log.level.WARN)
					return
				end

				local val = selection.value
				local cmd = string.format([[:%s ]], val.name)

				if val.nargs == "0" then
					local cr = vim.api.nvim_replace_termcodes("<cr>", true, false, true)
					cmd = cmd .. cr
				end
				vim.cmd [[stopinsert]]
				vim.api.nvim_feedkeys(cmd, "nt", false)
			end)
		end
	}
end
