-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
--
vim.g.python3_host_prog = "/Users/emichalak/.pyenv/versions/nvim-3.12/bin/python"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup("plugins")
require("emichalak")
require("nvim-tree").setup()
require("lualine").setup()

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "kanagawa",
	callback = function()
		if vim.o.background == "light" then
			vim.fn.system("kitty +kitten themes Kanagawa_light")
		elseif vim.o.background == "dark" then
			vim.fn.system("kitty +kitten themes Kanagawa_dragon")
		else
			vim.fn.system("kitty +kitten themes Kanagawa")
		end
	end,
})
-- green better than purple background
vim.cmd("colorscheme kanagawa")
