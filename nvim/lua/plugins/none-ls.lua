return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",

		{
			"jay-babu/mason-null-ls.nvim",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"williamboman/mason.nvim",
				"nvimtools/none-ls.nvim",
			},
			config = function()
				-- Ensure all formatters and linters are installed
				require("mason-null-ls").setup({
					ensure_installed = { "stylua", "prettier", "eslint_d", "clang-format" },
				})
			end,
		},
	},
	config = function()
		-- get access to the none-ls functions
		local null_ls = require("null-ls")
		-- run the setup function for none-ls to setup our different formatters
		null_ls.setup({
			sources = {
				-- setup lua formatter
				null_ls.builtins.formatting.stylua,
				-- setup eslint linter for javascript
				-- require("none-ls.diagnostics.eslint_d"),
				-- setup prettier to format languages that are not lua
				null_ls.builtins.formatting.prettierd.with({
					extra_args = function(params)
						return params.options
							and params.options.tabSize
							and {
								"--tab-width",
								params.options.tabSize,
							}
					end,
				}),
				null_ls.builtins.formatting.autopep8,
			},
		})

		-- set up a vim motion for <Space> + c + f to automatically format our code based on which langauge server is active
		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
	end,
}
