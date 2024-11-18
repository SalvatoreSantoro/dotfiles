return {
  "Mofiqul/vscode.nvim",   -- alternative: 'lunarvim/vscode.nvim'
  lazy=false,
  config = function()
    vim.cmd([[colorscheme vscode]])
  end,
}
