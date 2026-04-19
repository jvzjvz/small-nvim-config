-- vim.opt.autocomplete = true
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true

vim.opt.autoindent = true      -- copy indent from previous line
vim.opt.smartindent = true     -- C-like indentation rules
vim.opt.cindent = true         -- stronger C-style indentation (optional but useful)
-- vim.opt.expandtab = true       -- IMPORTANT: spaces instead of tabs
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autocomplete = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smoothscroll = true
vim.opt.wrap = false
vim.opt.guicursor = "n-v-c:block,i:block"

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.clipboard = 'unnamedplus'

-- vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.showmode = false
vim.opt.confirm = true

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
	gh('zenbones-theme/zenbones.nvim'),
	gh('fenetikm/falcon'),
	gh('casedami/neomodern.nvim'),
	gh('dasch/satellite'),
	gh('sudoscrawl/tokyo-dark.nvim'),
	gh('itsthomashere/grace.nvim'),
	gh('vv9k/bogster'),
	gh('mazzettimatteo/Whitney'),
	gh('jssee/vim-cortado'),
	gh('NopAngel/nimmy.vim'),
	gh('glepnir/oceanic-material'),
	gh('kanenorman/gruvbox-darker.nvim'),
	gh('Oniup/ignite.nvim'),
	gh('deparr/tairiki.nvim'),
	-- gh(''),
	-- gh(''),
}
vim.pack.add(color_schemes)
vim.cmd.colorscheme('gruvbox')

local qol_extensions = {
	gh('nvim-lua/plenary.nvim'),
	gh('nvim-tree/nvim-web-devicons'),
	gh('stevearc/oil.nvim'),
	gh('nvim-lualine/lualine.nvim'),
	{src = gh('nvim-treesitter/nvim-treesitter'), version = 'main'},
	gh('nvim-treesitter/nvim-treesitter-context'),
	gh('sphamba/smear-cursor.nvim'),
	gh('ej-shafran/compile-mode.nvim'),
	gh('nvim-telescope/telescope.nvim'),
	gh('nvim-telescope/telescope-fzf-native.nvim'),
	{ src = gh('neovim/nvim-lspconfig')},
	-- gh('axkirillov/unified.nvim')
}
vim.pack.add(qol_extensions)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require('telescope').setup {
	pickers = {
		colorscheme = {
			theme = "dropdown",
			enable_preview = true
		}
	}
}

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

-- center screen when moving up and down (buggy)
-- vim.keymap.set('n', '<C-d>', '<C-d>zz')
-- vim.keymap.set('n', '<C-u>', '<C-u>zz')

local map = vim.keymap.set

-- tab & shift tab for buffer switching
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- clear search highlighting :noh
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- helix goto start / end line
map("n", "gl", "$", { desc = "Go to end of line" })
map("n", "gh", "^", { desc = "Go to start of line" })

-- window swapping without ctrl w
map("n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "Redraw / Clear hlsearch / Diff Update" })
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- autocomplete table
vim.keymap.set('i', '<Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-n>'
  else
    return '<Tab>'
  end
end, { expr = true })

vim.keymap.set('i', '<S-Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-p>'
  else
    return '<S-Tab>'
  end
end, { expr = true })

vim.keymap.set('i', '<CR>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-y>'
  else
    return '<CR>'
  end
end, { expr = true })
