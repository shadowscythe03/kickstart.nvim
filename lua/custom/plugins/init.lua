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
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'lervag/vimtex',
    lazy = false, -- don't lazy load
    enabled = vim.fn.has 'win32' == 1, -- only enable on Windows
    init = function()
      -- Use SumatraPDF on Windows
      vim.g.vimtex_view_method = 'general'
      vim.g.vimtex_view_general_viewer = [[C:\Users\abhir\AppData\Local\SumatraPDF\SumatraPDF.exe]]
      -- Optional: configure forward search
      vim.g.vimtex_view_general_options = [[-reuse-instance -forward-search @tex @line @pdf]]
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
}
