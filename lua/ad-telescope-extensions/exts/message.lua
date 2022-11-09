return function(opts)
	return {
		command = 'List messages',
		picker = { --
			sorting_strategy = 'ascending',
			default_selection_index = -1,
		},
	}
end
