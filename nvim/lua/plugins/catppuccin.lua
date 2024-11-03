return { "catppuccin/nvim", 
          name = "catppuccin", 
          priority = 1000,
          config = function()
            require("catppuccin").setup({
            -- Your configuration here
            flavour = "mocha", -- example
            transparent_background = true, -- example
            })
        -- Optionally set colorscheme
            vim.cmd([[colorscheme catppuccin]])
            end
      }
