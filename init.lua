vim.opt.autocomplete = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smoothscroll = true
vim.opt.wrap = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

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
}

vim.pack.add(color_schemes)
vim.cmd.colorscheme('koda-moss')

vim.pack.add({gh('nvim-tree/nvim-web-devicons')})

vim.pack.add({gh('stevearc/oil.nvim')})
require('oil').setup{
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	}
}
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Oil - Open parent directory' })

vim.pack.add({gh('nvim-lualine/lualine.nvim')})
require('lualine').setup()

vim.pack.add({gh('sphamba/smear-cursor.nvim')})
require('smear_cursor').setup()

vim.pack.add({{src = gh('nvim-treesitter/nvim-treesitter'), version = 'main'}})
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
vim.pack.add({gh('nvim-treesitter/nvim-treesitter-context')})
