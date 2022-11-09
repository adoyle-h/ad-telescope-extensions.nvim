return function(opts)
	opts = vim.tbl_deep_extend('keep', opts, {
		highlights = { --
			ADTelExt_env_key = { fg = '#C3B11A' },
			ADTelExt_env_equal = { fg = '#707070' },
			ADTelExt_env_val = { fg = 'white' },
		},
	})

	return {
		desc = 'List environment variables',

		highlights = opts.highlights,

		format = { --
			separator = ' ',
			items = { {}, {}, {} },
		},

		command = function()
			local items = {}

			for key, value in pairs(vim.fn.environ()) do
				table.insert(items, {
					text = {
						{ key, 'ADTelExt_env_key' },
						{ '=', 'ADTelExt_env_equal' },
						{ value, 'ADTelExt_env_val' },
					},
					entry = { --
						ordinal = key .. '=' .. value,
					},
					key = key,
					value = value,
				})
			end

			return items
		end,
	}
end
