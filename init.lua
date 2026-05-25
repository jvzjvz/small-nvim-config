if vim.g.neovide == true then
  -- vim.o.guifont = 'JetBrainsMono Nerd Font Mono:h12'
  -- vim.o.guifont = 'LythMono Nerd Font:h16:b'
  -- vim.o.guifont = 'Agave Nerd Font Mono:h16'
  -- vim.o.guifont = 'FiraCode Nerd Font:h16'
  vim.o.guifont = 'Hack Nerd Font Mono:h15'
  vim.api.nvim_set_keymap("n", "<C-=>", ":lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  1.0)<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_transparency = math.min(vim.g.neovide_transparency + 0.05, 1.0)<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-_>", ":lua vim.g.neovide_transparency = math.max(vim.g.neovide_transparency - 0.05, 0.0)<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 0.5<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-)>", ":lua vim.g.neovide_transparency = 0.9<CR>", { silent = true })
  else
  -- vim.pack.add({'https://github.com/sphamba/smear-cursor.nvim'})
  -- require('smear_cursor').setup()
end

vim.g.mapleader = ' '
vim.g.localleader = ' '
vim.opt.timeoutlen = 300
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.winborder = "rounded"

-- autocomplete setup start
vim.opt.autocomplete = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
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
-- autocomplete setup end

vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.smoothscroll = true
vim.opt.wrap = false
vim.opt.cursorline = false
vim.opt.guicursor = "n-v-c:block,i:block"

vim.opt.clipboard = 'unnamedplus'

-- vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.showmode = false
vim.opt.confirm = true

local colorschemes = {
  'https://github.com/rktjmp/lush.nvim', -- common dependency and for custom theme making
  'https://github.com/jvzjvz/autumn_night.nvim',
  'https://github.com/jvzjvz/srcery-vim',
  'https://github.com/Shatur/neovim-ayu',
  'https://github.com/wtfox/jellybeans.nvim',
  'https://github.com/harivansh-afk/cozybox.nvim',
  'https://github.com/oskarnurm/koda.nvim',
  'https://github.com/neanias/everforest-nvim',
  {src = 'https://github.com/Everblush/nvim', name = 'everblush-main'},
  'https://github.com/sainnhe/gruvbox-material',
  'https://github.com/zenbones-theme/zenbones.nvim',
  'https://github.com/sudoscrawl/tokyo-dark.nvim',
  'https://github.com/itsthomashere/grace.nvim',
  'https://github.com/Oniup/ignite.nvim',
  'https://github.com/deparr/tairiki.nvim',
  'https://github.com/datsfilipe/gruvbox.nvim',
  'https://github.com/metalelf0/kintsugi-nvim',
  'https://github.com/AvengeMedia/base46',
  'https://github.com/saeeedhany/parchment.nvim',
  'https://github.com/funnyVariable/blank.nvim',
  'https://github.com/jackplus-xyz/binary.nvim',
  'https://github.com/metalelf0/black-metal-theme-neovim',
  'https://github.com/drewxs/ash.nvim',
  'https://github.com/hendriknielaender/stardust.nvim',
  'https://github.com/amedoeyes/eyes.nvim',
  'https://github.com/mrpbennett/vault',
  'https://github.com/phha/zenburn.nvim',
  'https://github.com/StradNikw/Naysayer.nvim',
}
vim.pack.add(colorschemes)
vim.cmd.colorscheme('srcery')

vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_float_style = 'dim'
vim.g.gruvbox_material_colors_override = {
    bg0 = { '#111111', '234' },
    bg1 = { '#1d1d1d', '235' },
    bg2 = { '#262626', '236' },
    bg3 = { '#303030', '237' },
    bg_visual = { '#3a3a3a', '239' },
}

local qol_extensions = {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
  'https://github.com/ej-shafran/compile-mode.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/windwp/nvim-autopairs',
}
vim.pack.add(qol_extensions)

-- vim.diagnostic.config({
--   float = { border = "rounded" },
--   virtual_text = {
--     spacing = 4,
--     prefix = "●",
--   },
-- })

vim.g.compile_mode = {
  default_command = {
    c = 'cmake --build build && build/game.exe',
    cpp = 'cmake --build build && build/game.exe',
    odin = 'odin run .',
    go = 'go run .',
    lua = 'lovec .', -- love2d
    zig = 'zig build run',
    rust = 'cargo run',
  },
  focus_compilation_buffer = true,
  auto_jump_to_first_error = true,
}

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- Telescope
local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
  vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
  vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
  vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
  vim.keymap.set('n', '<leader>c', builtin.colorscheme, { desc = 'Telescope colorscheme' })
  vim.keymap.set('n', '<leader>S', builtin.tags, { desc = 'Telescope all tags' })
  vim.keymap.set('n', '<leader>s', builtin.current_buffer_tags, { desc = 'Telescope buffer tags' })
  vim.keymap.set('n', '<leader>m', builtin.marks, { desc ='Telescope marks'})
  vim.keymap.set('n', '<leader>n', function()
  builtin.find_files { cwd = vim.fn.stdpath('config') } -- TODO: change to just open the config file, no need for telescope picker
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
    marks = { -- maybe just remove
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
-- vim.keymap.set('n', '-', function()
--   require('oil').open_float()
-- end, {
--   desc = 'Oil float'
-- })


require('nvim-autopairs').setup {}

-- require('marks').setup {}

require('lualine').setup()


-- Treesitter
local ts = require('nvim-treesitter')
local ts_parsers = { 'c', 'cpp', 'odin', 'nim', 'lua', 'zig', 'rust' }
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

-- persistent visual selection after indentation
map('v', '>', '>gv')
map('v', '<', '<gv')

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

-- A match indentation on empty line
vim.keymap.set('n', 'A', function()
  if vim.fn.getline('.'):match('^%s*$') then
    return '"_cc'
  end
  return 'A'
end, { expr = true })
