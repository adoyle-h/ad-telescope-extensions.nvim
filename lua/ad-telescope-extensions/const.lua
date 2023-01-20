local M = {}

M.symbolKinds = {
	-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#symbolKind
	-- LuaFormatter off
	'File', 'Module', 'Namespace', 'Package', 'Class', 'Method', 'Property', 'Field',
	'Constructor', 'Enum', 'Interface', 'Function', 'Variable', 'Constant', 'String',
	'Number', 'Boolean', 'Array', 'Object', 'Key', 'Null', 'EnumMember', 'Struct', 'Event',
	'Operator', 'TypeParameter',
	-- LuaFormatter on
}

return M
