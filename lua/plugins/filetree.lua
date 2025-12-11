return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        window = {
          mappings = {
            ["L"] = "open",        -- Expand folder / open file
            ["H"] = "close_node",  -- Collapse folder
            ["J"] = "navigate_up", -- Go to parent directory
          },
        },
      })

      vim.keymap.set(
        "n",
        "<leader>e",
        ":Neotree toggle<CR>",
        { desc = "Toggle Neo-tree" }
      )
    end,
  },
}

