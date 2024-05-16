vim.api.nvim_create_user_command('RlPreview', 'lua preview_markdown()', {})
local libuv = vim.loop

local M = {}

-- Default configuration
local defaults = {
    timeout = 300,
}

M.config = defaults

function M.setup(user_options)
    user_options = user_options or {}
    for key, value in pairs(user_options) do
        if M.config[key] ~= nil then
            M.config[key] = value
        else
            error("Option " .. key .. " is not valid for this plugin.")
        end
    end
end

-- function ShowCursorPos()
-- 	local position = vim.api.nvim_win_get_cursor(0)[1]
-- 	print(position)
-- end

function spawn_server(f)
	local t = M.config.timeout

	local options = {
		args = { "-f", f, "-t", t},
	}

	-- local child, _ = libuv.spawn("rl-markserver", options, function()end)
	local child, _ = libuv.spawn("/home/hedge/.config/nvim/rl-mark", options, function()end)

	return child
end

function kill_server(child)
	if child and not child:is_closing() then
		child:kill(libuv.constants.SIGTERM)
	end
end

function preview_markdown()
	local bufr = vim.api.nvim_get_current_buf()
	local file = vim.api.nvim_buf_get_name(bufr)
	local child = spawn_server(file)

	vim.api.nvim_create_autocmd("BufDelete", {
		buffer = bufr,
		callback = function()
			kill_server(child)
		end,
	})

	vim.api.nvim_create_autocmd("VimLeavePre", {
		callback = function()
			kill_server(child)
		end,
	})
end

return M
