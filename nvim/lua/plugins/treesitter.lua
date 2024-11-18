return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "windwp/nvim-ts-autotag"
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript", "html", "css", "json", "c", "java", "markdown", "markdown_inline", "gitignore","vimdoc"},  -- add languages you use
        highlight = {
          enable = true                    -- enable Tree-sitter syntax highlighting
        },
        autotag = {
            enable = true
        }
      })
    end,
  }
