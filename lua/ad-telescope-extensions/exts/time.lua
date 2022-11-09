return function(opts)
	return {
		desc = 'Show current date and time',

		command = function()
			return { os.date(), '' .. os.time() }
		end,
	}
end
