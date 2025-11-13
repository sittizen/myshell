local M = {}

M.render_markdown_allowed_dirs = {
	"~/workspace/pycc",
}

function M.is_in_render_md_allowed_dir()
	local bufname = vim.api.nvim_buf_get_name(0)
	if bufname == "" then
		return false
	end

	-- Expand the buffer path to absolute path
	local expanded_bufname = vim.fn.expand(bufname)

	-- Check if the buffer path starts with any of the allowed directories
	for _, dir in ipairs(M.render_markdown_allowed_dirs) do
		local expanded_dir = vim.fn.expand(dir)
		if expanded_bufname:find(expanded_dir, 1, true) == 1 then
			return true
		end
	end

	return false
end

return M
