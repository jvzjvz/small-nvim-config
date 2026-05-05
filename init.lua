vim.g.mapleader = ' '
vim.g.localleader = ' '
vim.opt.timeoutlen = 250
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smoothscroll = true
vim.opt.wrap = false
-- vim.opt.guicursor = "n-v-c:block,i:block"

vim.opt.clipboard = 'unnamedplus'

-- vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.showmode = false
vim.opt.confirm = true

local color_schemes = {
  'https://github.com/Shatur/neovim-ayu',
  'https://github.com/jvzjvz/autumn_night.nvim',
  'https://github.com/rktjmp/lush.nvim', -- common dependency and for custom theme making
  'https://github.com/wtfox/jellybeans.nvim',
  'https://github.com/harivansh-afk/cozybox.nvim',
  'https://github.com/oskarnurm/koda.nvim',
  'https://github.com/neanias/everforest-nvim',
  'https://github.com/Everblush/nvim',
  'https://github.com/jvzjvz/srcery-vim',
  'https://github.com/sainnhe/gruvbox-material',
  'https://github.com/zenbones-theme/zenbones.nvim',
  'https://github.com/fenetikm/falcon',
  'https://github.com/casedami/neomodern.nvim',
  'https://github.com/dasch/satellite',
  'https://github.com/sudoscrawl/tokyo-dark.nvim',
  'https://github.com/itsthomashere/grace.nvim',
  'https://github.com/vv9k/bogster',
  'https://github.com/mazzettimatteo/Whitney',
  'https://github.com/jssee/vim-cortado',
  'https://github.com/NopAngel/nimmy.vim',
  'https://github.com/glepnir/oceanic-material',
  'https://github.com/kanenorman/gruvbox-darker.nvim',
  'https://github.com/Oniup/ignite.nvim',
  'https://github.com/deparr/tairiki.nvim',
  'https://github.com/datsfilipe/gruvbox.nvim',
  'https://github.com/IlyasYOY/theme.nvim',
  'https://github.com/metalelf0/kintsugi-nvim',
  'https://github.com/jaredgorski/Mies.vim',
  'https://github.com/AvengeMedia/base46',
}
vim.pack.add(color_schemes)

vim.g.gruvbox_material_background = 'hard'
vim.cmd.colorscheme('gruvbox-material')

local qol_extensions = {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
  'https://github.com/sphamba/smear-cursor.nvim',
  'https://github.com/ej-shafran/compile-mode.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },

  -- LSP / package manager
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',

  -- Completion menu
  'https://github.com/hrsh7th/nvim-cmp',
  'https://github.com/hrsh7th/cmp-nvim-lsp',
  'https://github.com/hrsh7th/cmp-buffer',
  'https://github.com/hrsh7th/cmp-path',
}
vim.pack.add(qol_extensions)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>c', builtin.colorscheme, { desc = 'Telescope colorscheme' })
vim.keymap.set('n', '<leader>S', builtin.tags, { desc = 'Telescope all tags' })
vim.keymap.set('n', '<leader>s', builtin.current_buffer_tags, { desc = 'Telescope buffer tags' })
vim.keymap.set('n', '<leader>n', function()
  builtin.find_files { cwd = vim.fn.stdpath('config') }
end, { desc = 'Find Neovim config files' })

require('telescope').setup {
  pickers = {
    colorscheme = {
      theme = 'dropdown',
      enable_preview = true,
    },
    buffers = {
      theme = 'dropdown',
    },
    find_files = {
      theme = 'dropdown',
    },
  },
}

-- Oil
require('oil').setup {
  default_file_explorer = true,
  view_options = {
    show_hidden = true,
  },
}
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Oil - Open parent directory' })

require('lualine').setup()
require('smear_cursor').setup()

-- Treesitter
local ts = require('nvim-treesitter')
local ts_parsers = { 'c', 'cpp', 'odin', 'nim', 'lua' }
ts.install(ts_parsers)

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)

    if lang and vim.treesitter.language.add(lang) then
      -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.treesitter.start()
    end
  end,
})

-- Mason
require('mason').setup()

-- Completion menu
local cmp = require('cmp')
local cmp_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_lsp.default_capabilities()

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },

  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  }),
})

-- LSP configs
vim.lsp.config('clangd', {
  capabilities = capabilities,
  cmd = { 'clangd', '--compile-commands-dir=build' },
})

vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
})

vim.lsp.config('ols', {
  capabilities = capabilities,
})

vim.lsp.config('gopls', {
  capabilities = capabilities,
})

vim.lsp.config('zls', {
  capabilities = capabilities,
})

vim.lsp.enable({
  'clangd',
  'lua_ls',
  'ols',
  'gopls',
  'zls',
})

-- LSP keymaps attach only when an LSP starts for the buffer
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'LSP hover' }))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = 'Go to declaration' }))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = 'Go to implementation' }))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'References' }))
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code action' }))
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, vim.tbl_extend('force', opts, { desc = 'Line diagnostics' }))
  end,
})

local map = vim.keymap.set

-- tab & shift tab for buffer switching
map('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- clear search highlighting :noh
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and Clear hlsearch' })

-- helix goto start / end line
map({ 'n', 'v' }, 'gl', '$', { desc = 'Go to end of line' })
map({ 'n', 'v' }, 'gh', '^', { desc = 'Go to start of line' })

-- helix line shift
map('n', '>', 'V>')
map('n', '<', 'V<')

-- window swapping without ctrl w
map('n', '<leader>ur', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>', { desc = 'Redraw / Clear hlsearch / Diff Update' })
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})
