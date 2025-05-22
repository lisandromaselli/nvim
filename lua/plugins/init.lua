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
        git_ignored = false,
        custom = { "^\\.git$", "node_modules" }
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = "none",
        special_files = {},
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
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
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = function()
      local conf = require "nvchad.configs.telescope"

      -- Preserve your original ignore patterns
      conf.defaults.file_ignore_patterns = { "node_modules", "^%.git/" }

      -- Add visual enhancements and sensible defaults
      conf.defaults.selection_caret = "➜ "
      conf.defaults.path_display = { "truncate" }

      -- Improve sorting and fuzzy searching
      conf.extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      }

      -- Better file picker defaults (show hidden files except ignored)
      conf.pickers = {
        find_files = {
          hidden = true,
          no_ignore = false,
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      }

      return conf
    end,

    -- Enable Telescope extensions
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
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
