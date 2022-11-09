return function(opts)
	return {
		desc = 'List messages',
		command = 'messages',
		picker = { --
			sorting_strategy = 'ascending',
			default_selection_index = -1,
		},
	}
end
