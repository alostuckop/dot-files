-- ~/.config/nvim/lua/term_toggle.lua

local M = {}

-- Variables to store buffer and window IDs
M.term_buf = nil
M.term_win = nil

-- Terminal toggle function
function M.toggle(height)
	-- Open a new window at the bottom with specified height
	vim.cmd("botright new")
	vim.cmd("resize " .. height)

	-- Check if the buffer exists or if it's valid (not wiped out)
	if not M.term_buf or vim.fn.bufexists(M.term_buf) == 0 then
		-- Create a new terminal if the buffer doesn't exist
		vim.cmd("term")
		M.term_buf = vim.fn.bufnr() -- Store the terminal buffer number
		vim.cmd("setlocal nonumber norelativenumber signcolumn=no")
	else
		vim.cmd("buffer " .. M.term_buf)
	end

	-- Enter insert mode in the terminal
	vim.cmd("startinsert")
	M.term_win = vim.fn.win_getid() -- Store the window ID
end

-- Key mapping to toggle the terminal
vim.keymap.set("n", "<leader>t", function()
	M.toggle(20)
end, { noremap = true, silent = true })

return M
