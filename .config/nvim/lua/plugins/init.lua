return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "c",
        "python",
        "cpp",
      },
    },
  },
  -- Disable nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },

  -- Easy motion for Neovim
  {
    "smoka7/hop.nvim",
    opts = require "configs.hop",
  },
}
