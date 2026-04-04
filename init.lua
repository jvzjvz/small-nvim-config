vim.opt.autocomplete = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smoothscroll = true
vim.opt.wrap = false

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.clipboard = 'unnamedplus'

local gh = function(x) return 'https://github.com/' .. x end
local cb = function(x) return 'https://codeberg.com/' .. x end

vim.cmd('packloadall')

local color_schemes = {
	gh('rktjmp/lush.nvim'), -- common dependency and for custom theme making
	gh('wtfox/jellybeans.nvim'),
	gh('harivansh-afk/cozybox.nvim'),
	gh('oskarnurm/koda.nvim'),
	gh('neanias/everforest-nvim'),
	gh('Everblush/nvim'),
	gh('jvzjvz/srcery-vim'),
	gh('sainnhe/gruvbox-material'),
	-- gh('/gruvbox'),
	gh('zenbones-theme/zenbones.nvim'),
	gh('nvim-lua/plenary.nvim'),
}
vim.pack.add(color_schemes)
vim.cmd.colorscheme('cozybox')

local qol_extensions = {
	gh('nvim-tree/nvim-web-devicons'),
	gh('stevearc/oil.nvim'),
	gh('nvim-lualine/lualine.nvim'),
	{src = gh('nvim-treesitter/nvim-treesitter'), version = 'main'},
	gh('nvim-treesitter/nvim-treesitter-context'),
	gh('sphamba/smear-cursor.nvim'),
	gh('ej-shafran/compile-mode.nvim'),
	-- gh('axkirillov/unified.nvim')
}
vim.pack.add(qol_extensions)

-- require('unified').setup()

require('oil').setup{
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	}
}
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Oil - Open parent directory' })

require('lualine').setup()

require('smear_cursor').setup()

local ts = require('nvim-treesitter')
local ts_parsers = {'c', 'cpp', 'odin'}
ts.install(ts_parsers)
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
	local filetype = args.match
	local lang = vim.treesitter.language.get_lang(filetype)
	if vim.treesitter.language.add(lang) then
	  vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	  vim.treesitter.start()
	end
  end,
})

-- require('compile-mode').setup()
