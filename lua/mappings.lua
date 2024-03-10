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
