require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Lazy Git" })
map("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope Lsp references" })
map("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { desc = "Telescope diagnostics" })
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dus",
  function()
    local widgets = require("dap.ui.widgets");
    local sidebar = widgets.sidebar(widgets.scopes);
    sidebar.open();
  end, { desc = "Open debugging sidebar" })
map("n", "<leader>dgt",
  function()
    require("dap-go").debug_test()
  end, { desc = "Debug go test" })
map("n", "<leader>dgl",
  function()
    require("dap-go").debug_last()
  end, { desc = "Debug last go test" })
map("n", "<leader>v", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>")

-- LSP mappings
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show hover info" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

-- Enhanced LSP Code Actions and Refactoring
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Code actions" })
map("v", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Code actions (visual)" })

-- Quick fix and refactoring
map("n", "<leader>lf", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.kind and (action.kind:match("quickfix") or action.kind:match("refactor"))
    end,
    apply = true
  })
end, { desc = "LSP Quick fix/refactor" })

-- Source actions (organize imports, etc.)
map("n", "<leader>ls", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.kind and action.kind:match("source")
    end,
    apply = true
  })
end, { desc = "LSP Source actions" })

-- Organize imports (universal)
map("n", "<leader>lo", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.kind and action.kind:match("source.organizeImports")
    end,
    apply = true
  })
end, { desc = "LSP Organize imports" })

-- Extract refactoring
map("n", "<leader>le", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.kind and action.kind:match("refactor.extract")
    end
  })
end, { desc = "LSP Extract refactor" })

map("v", "<leader>le", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.kind and action.kind:match("refactor.extract")
    end
  })
end, { desc = "LSP Extract refactor (visual)" })

-- Inline refactoring
map("n", "<leader>li", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.kind and action.kind:match("refactor.inline")
    end
  })
end, { desc = "LSP Inline refactor" })

-- Rewrite refactoring
map("n", "<leader>lr", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.kind and action.kind:match("refactor.rewrite")
    end
  })
end, { desc = "LSP Rewrite refactor" })

-- Enhanced diagnostics navigation
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "LSP Show diagnostic" })
map("n", "<leader>lD", vim.diagnostic.setloclist, { desc = "LSP Diagnostic list" })
map("n", "[e", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Previous error" })
map("n", "]e", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next error" })
map("n", "[w", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Previous warning" })
map("n", "]w", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Next warning" })
-- Telescope LSP integrations
map("n", "<leader>lS", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "LSP Document symbols" })

-- Language-specific shortcuts (keeping Go for backward compatibility)
map("n", "<leader>gi", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.kind and action.kind:match("source.organizeImports")
    end,
    apply = true
  })
end, { desc = "Go organize imports" })
