return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
      filters = {
        dotfiles = false,
        custom = { "^\\.git", "node_modules" }
      },
      view = {
        width = {
          min = 20,
          max = -1,
        }
      }
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "yaml-language-server",
        "golangci-lint",
        "lua-language-server",
        "ruby-lsp"
      }
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('nvchad.configs.lspconfig').defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"
      conf.defaults.file_ignore_patterns = { "node_modules", ".git" }

      return conf
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c", "vim", "lua", "vimdoc", "go", "gomod" },
      hightlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.install").prefer_git = true
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false
  }
}
