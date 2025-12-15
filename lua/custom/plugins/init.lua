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
  { 'wakatime/vim-wakatime', lazy = false }
}
