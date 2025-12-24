-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
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
  {
    'ojroques/vim-oscyank',
    event = 'TextYankPost',
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
}
