return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk_engines = {
			_ = "-xelatex",
		}

		-- Indentation and formatting
		vim.g.vimtex_indent_enabled = 1
		vim.g.vimtex_indent_on_ampersands = 1

		-- Better bracket/delimiter matching
		vim.g.vimtex_matchparen_enabled = 1

		-- Syntax concealment (makes LaTeX prettier in editor)
		vim.g.vimtex_syntax_conceal = {
			accents = 1,
			ligatures = 1,
			cites = 1,
			fancy = 1,
			spacing = 1,
			greek = 1,
			math_bounds = 1,
			math_delimiters = 1,
			math_fracs = 1,
			math_super_sub = 1,
			math_symbols = 1,
			sections = 0,
			styles = 1,
		}

		-- Text wrapping for LaTeX files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "tex",
			callback = function()
				vim.opt_local.linebreak = true -- Break at word boundaries
				vim.opt_local.textwidth = 88
				vim.opt_local.formatoptions:append("t") -- Auto-wrap text using textwidth
			end,
		})
	end,
}
