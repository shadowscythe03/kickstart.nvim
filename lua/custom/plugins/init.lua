-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    {
        "scottmckendry/cyberdream.nvim",
        priority = 1000, -- load before other plugins
        config = function()
        require("cyberdream").setup({
            transparent = true,
            italic_comments = true,
        })
        vim.cmd.colorscheme("cyberdream")
        end,
    },

}
