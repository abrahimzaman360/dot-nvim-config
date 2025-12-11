-- ~/.config/nvim/lua/core/lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Plugin spec imports
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  { import = "plugins.ui" },
  { import = "plugins.treesitter" },
  { import = "plugins.telescope" },
  { import = "plugins.filetree" },
  { import = "plugins.git" },

  -- Debugging
  { "nvim-neotest/nvim-nio" },
  { import = "plugins.dap" },
  { import = "plugins.dap-rust" },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
      "iamcco/markdown-preview.nvim",
      ft = { "markdown" },
      build = "cd app && npm install",
      init = function()
        vim.g.mkdp_auto_start = 1
      end,
    }
})

