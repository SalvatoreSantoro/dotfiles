return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript", "html", "css", "json" },  -- add languages you use
        highlight = {
          enable = true,                    -- enable Tree-sitter syntax highlighting
        },
      })
    end,
  }
