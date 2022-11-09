return function(opts)
	return {
		desc = 'List color names and RGB values.',

		command = function()
			local items = {}

			for key, value in pairs(vim.api.nvim_get_color_map()) do
				table.insert(items, {
					text = string.format('%s = %s', key, value),
					entry = { ordinal = key .. '=' .. value },
				})
			end

			return items
		end,
	}
end
