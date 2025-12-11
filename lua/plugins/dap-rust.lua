return {
  "mfussenegger/nvim-dap",
  dependencies = { "williamboman/mason.nvim", "jay-babu/mason-nvim-dap.nvim" },
  config = function()
    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb" },
      automatic_setup = true,
    })

    local dap = require("dap")
    local mason_path = vim.fn.stdpath("data") .. "/mason"

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = mason_path .. "/bin/codelldb",
        args = { "--port", "${port}" },
      },
    }
  end
}

