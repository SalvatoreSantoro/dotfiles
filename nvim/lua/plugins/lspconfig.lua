return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").pyright.setup({})    -- example for Python, add more servers as needed
  end,
}
