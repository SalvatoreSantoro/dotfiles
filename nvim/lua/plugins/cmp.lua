return {
  "hrsh7th/nvim-cmp",            -- completion plugin
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",       -- LSP completion source
    "hrsh7th/cmp-buffer",         -- buffer completion source
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
      },
    })
  end,
}
