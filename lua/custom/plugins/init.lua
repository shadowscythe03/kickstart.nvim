-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Normal mode: move current line
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { silent = true })

-- Visual mode: move selected block
vim.keymap.set('x', '<A-j>', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('x', '<A-k>', ":m '<-2<CR>gv=gv", { silent = true })
return {
  {
    'tpope/vim-fugitive',
    config = function()
      --vim-fugitive
      vim.keymap.set('n', '<leader>gs', ':Git<CR>', { noremap = true, desc = 'git status' }) --git status
      vim.keymap.set('n', '<leader>ga', ':Git add ', { noremap = true, desc = 'git add ' })
      vim.keymap.set('n', '<leader>gA', ':Git add .<CR>', { noremap = true, desc = 'git add .' })
      vim.keymap.set('n', '<leader>gp', ':Git push --quiet <CR>', { noremap = true, desc = 'git push' })
      vim.keymap.set('n', '<leader>gc', ':Git commit -qam "', { noremap = true, desc = 'git commit -am' })
    end,
  },
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'lervag/vimtex',
    lazy = false, -- don't lazy load
    enabled = vim.fn.executable 'pdflatex' == 1 or vim.fn.executable 'xelatex' == 1 or vim.fn.executable 'lualatex' == 1, -- enable only if LaTeX is installed
    init = function()
      if vim.fn.has 'win32' == 1 then
        -- Use SumatraPDF on Windows
        vim.g.vimtex_view_method = 'general'
        vim.g.vimtex_view_general_viewer = [[C:\Users\abhir\AppData\Local\SumatraPDF\SumatraPDF.exe]]
        -- Optional: configure forward search
        vim.g.vimtex_view_general_options = [[-reuse-instance -forward-search @tex @line @pdf]]
      else
        -- On Linux/macOS you might use Zathura, Skim, or Okular
        vim.g.vimtex_view_method = 'zathura'
      end
    end,
  },
  {
    'dense-analysis/ale',
    config = function()
      -- Configuration goes here.
      local g = vim.g
      -- Disable ALE's internal LSP integration
      vim.g.ale_disable_lsp = 1

      g.ale_ruby_rubocop_auto_correct_all = 1

      g.ale_linters = {
        ruby = { 'rubocop', 'ruby' },
        lua = { 'lua_language_server' },
      }
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup()
    end,
  },
  -- Using Lazy
  {
    'navarasu/onedark.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker',
      }
      -- require('onedark').load()
    end,
  },
  {
    'hat0uma/csvview.nvim',
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { '#', '//' } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { 'if', mode = { 'o', 'x' } },
        textobject_field_outer = { 'af', mode = { 'o', 'x' } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { '<Tab>', mode = { 'n', 'v' } },
        jump_prev_field_end = { '<S-Tab>', mode = { 'n', 'v' } },
        jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
        jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
      },
    },
    cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle' },
  },
  {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon',
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim',
    },
  },
}
