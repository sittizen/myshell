local function split_path(path)
	local parts = {}
	for part in string.gmatch(path, "[^/]+") do
		table.insert(parts, part)
	end
	return parts
end

local function join_path(parts, stop_at)
	local joined = ""
	for i = 1, stop_at do
		joined = joined .. "/" .. parts[i]
	end
	return joined
end

local function contains_venv(path)
	local full_path = path .. "/.venv"
	local cmd = string.format('test -d "%s" && echo "yes" || echo "no"', full_path)
	local handle = io.popen(cmd)
	if handle ~= nil then
		local result = handle:read("*l")
		handle:close()
		return result == "yes"
	else
		return nil
	end
end

local function find_venv(path)
	local parts = split_path(path)
	for i = #parts, 1, -1 do
		local current_path = join_path(parts, i)
		if contains_venv(current_path) then
			return current_path
		end
	end
	return nil
end

return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		".venv",
		"pyproject.toml",
	},
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				typeCheckingMode = "standard",
				diagnosticMode = "workspace",
			},
		},
	},
	config = function() end,
	on_attach = function(client, _)
		local venv_path = find_venv(vim.api.nvim_buf_get_name(0))
		if venv_path == nil then
			vim.print("Seems you are not in a virtualenv subdir")
		else
			client.settings.python = vim.tbl_deep_extend(
				"force",
				client.settings.python or {},
				{ pythonPath = venv_path .. "/.venv/bin/python" }
			)
			client.settings.python.analysis = vim.tbl_deep_extend("force", client.settings.python.analysis or {}, {
				extraPaths = {
					venv_path .. "/.venv/lib/python3.10/site-packages/",
					venv_path .. "/.venv/lib/python3.14/site-packages/",
				},
			})
		end
	end,
	log_level = vim.lsp.protocol.MessageType.Error,
}
